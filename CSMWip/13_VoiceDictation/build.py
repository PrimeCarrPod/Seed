#!/usr/bin/env python3
"""
VoiceDictation APK Builder — No-Gradle (javac + aapt2 + d8 + zipalign + apksigner)
"""
import os
import sys
import subprocess
import shutil
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.absolute()
ANDROID_SDK = os.environ.get("ANDROID_SDK")
ANDROID_JAR = os.environ.get("ANDROID_JAR") or (Path(ANDROID_SDK) / "platforms" / "android-34" / "android.jar" if ANDROID_SDK else None)
BUILD_TOOLS = os.environ.get("BUILD_TOOLS") or (Path(ANDROID_SDK) / "build-tools" / "34.0.0" if ANDROID_SDK else None)

SRC_DIR = PROJECT_ROOT / "src" / "main" / "java"
RES_DIR = PROJECT_ROOT / "res"
MANIFEST = PROJECT_ROOT / "AndroidManifest.xml"
BUILD_DIR = PROJECT_ROOT / "build"
CLASSES_DIR = BUILD_DIR / "classes"
DEX_DIR = BUILD_DIR / "dex"
APK_UNALIGNED = PROJECT_ROOT / "voicedictation-unaligned.apk"
APK_ALIGNED = PROJECT_ROOT / "voicedictation-aligned.apk"
APK_FINAL = PROJECT_ROOT / "voicedictation.apk"
KEYSTORE = PROJECT_ROOT / "debug.keystore"

PACKAGE = "com.csmlabs.voicedictation"
MAIN_CLASS = f"{PACKAGE}.MainActivity"

def run(cmd, cwd=None, check=True):
    print(f"> {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd or PROJECT_ROOT, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
    if result.stderr:
        print(result.stderr, file=sys.stderr)
    if check and result.returncode != 0:
        raise RuntimeError(f"Command failed: {' '.join(cmd)}")
    return result

def check_env():
    missing = []
    if not ANDROID_SDK or not Path(ANDROID_SDK).exists():
        missing.append("ANDROID_SDK")
    if not ANDROID_JAR or not Path(ANDROID_JAR).exists():
        missing.append("ANDROID_JAR")
    if not BUILD_TOOLS or not Path(BUILD_TOOLS).exists():
        missing.append("BUILD_TOOLS")
    if missing:
        raise RuntimeError(f"Missing env vars: {', '.join(missing)}. Set ANDROID_SDK, ANDROID_JAR, BUILD_TOOLS")
    print(f"✓ ANDROID_SDK: {ANDROID_SDK}")
    print(f"✓ ANDROID_JAR: {ANDROID_JAR}")
    print(f"✓ BUILD_TOOLS: {BUILD_TOOLS}")

def clean():
    if BUILD_DIR.exists():
        shutil.rmtree(BUILD_DIR)
    for f in [APK_UNALIGNED, APK_ALIGNED, APK_FINAL]:
        if f.exists():
            f.unlink()
    print("✓ Cleaned build artifacts")

def compile_resources():
    CLASSES_DIR.mkdir(parents=True, exist_ok=True)
    res_zip = BUILD_DIR / "res.zip"
    
    # Compile resources
    aapt2 = BUILD_TOOLS / "aapt2"
    run([str(aapt2), "compile", "--dir", str(RES_DIR), "-o", str(res_zip)])
    
    # Link resources + generate R.java
    run([str(aapt2), "link",
         "-o", str(APK_UNALIGNED),
         "-I", str(ANDROID_JAR),
         str(res_zip),
         "--manifest", str(MANIFEST),
         "--java", str(CLASSES_DIR),
         "--no-static-reflection"])
    
    print("✓ Resources compiled, R.java generated")

def compile_java():
    # Find all .java files
    java_files = list(SRC_DIR.rglob("*.java"))
    if not java_files:
        raise RuntimeError("No Java source files found")
    
    # Include libs/*.jar (OKHttp, Okio) in classpath
    libs_jars = []
    libs_dir = PROJECT_ROOT / "libs"
    if libs_dir.exists():
        libs_jars = [str(f) for f in libs_dir.glob("*.jar")]
    
    classpath_parts = [str(ANDROID_JAR), str(CLASSES_DIR)] + libs_jars
    classpath = ":".join(classpath_parts)
    
    javac_cmd = [
        "javac",
        "-source", "1.8",
        "-target", "1.8",
        "-bootclasspath", str(ANDROID_JAR),
        "-cp", classpath,
        "-d", str(CLASSES_DIR),
    ] + [str(f) for f in java_files]
    
    run(javac_cmd)
    print(f"✓ Compiled {len(java_files)} Java files")

def dex():
    DEX_DIR.mkdir(parents=True, exist_ok=True)
    d8 = BUILD_TOOLS / "d8"
    run([str(d8), "--output", str(DEX_DIR), "--lib", str(ANDROID_JAR), str(CLASSES_DIR / PACKAGE.replace(".", "/"))])
    print("✓ DEX generated")

def package_apk():
    # Re-link with DEX
    aapt2 = BUILD_TOOLS / "aapt2"
    res_zip = BUILD_DIR / "res.zip"
    
    run([str(aapt2), "link",
         "-o", str(APK_UNALIGNED),
         "-I", str(ANDROID_JAR),
         str(res_zip),
         "--manifest", str(MANIFEST)])
    
    # Add classes.dex to APK
    import zipfile
    with zipfile.ZipFile(APK_UNALIGNED, 'a') as apk:
        dex_file = DEX_DIR / "classes.dex"
        if dex_file.exists():
            apk.write(dex_file, "classes.dex")
        else:
            raise RuntimeError("classes.dex not found")
    
    print("✓ APK packaged with DEX")

def align_and_sign():
    if not os.environ.get("ANDROID_KEYSTORE_PASS"):
        raise SystemExit("ERROR: ANDROID_KEYSTORE_PASS is required for signing; set it in the environment.")
    os.environ.setdefault("ANDROID_KEY_PASS", os.environ["ANDROID_KEYSTORE_PASS"])
    zipalign = BUILD_TOOLS / "zipalign"
    apksigner = BUILD_TOOLS / "apksigner"
    
    run([str(zipalign), "-f", "4", str(APK_UNALIGNED), str(APK_ALIGNED)])
    
    run([str(apksigner), "sign",
         "--ks", str(KEYSTORE),
         "--ks-pass", "env:ANDROID_KEYSTORE_PASS",
         "--key-pass", "env:ANDROID_KEY_PASS",
         str(APK_ALIGNED)])
    
    shutil.move(APK_ALIGNED, APK_FINAL)
    print(f"✓ Signed APK: {APK_FINAL}")

def install_apk():
    run(["adb", "install", "-r", str(APK_FINAL)], check=False)

def main():
    if len(sys.argv) > 1 and sys.argv[1] == "clean":
        clean()
        return
    
    try:
        check_env()
        compile_resources()
        compile_java()
        dex()
        package_apk()
        align_and_sign()
        
        if len(sys.argv) > 1 and sys.argv[1] == "install":
            install_apk()
        
        print("\n✅ Build successful!")
        print(f"   APK: {APK_FINAL}")
        
    except Exception as e:
        print(f"\n❌ Build failed: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()