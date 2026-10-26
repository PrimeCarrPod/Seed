#!/usr/bin/env python3
"""
No-Gradle Android APK Build System
Builds APK using only: javac, aapt2, d8, zipalign, apksigner
"""

import os
import sys
import subprocess
import shutil
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent
BUILD_DIR = PROJECT_ROOT / "build"
SRC_DIR = PROJECT_ROOT / "src"
RES_DIR = PROJECT_ROOT / "res"
MANIFEST = PROJECT_ROOT / "AndroidManifest.xml"
OUTPUT_APK = PROJECT_ROOT / "bounce.apk"

# Environment variables (with defaults)
ANDROID_SDK = os.environ.get("ANDROID_SDK", "/opt/android-sdk")
ANDROID_JAR = os.environ.get("ANDROID_JAR", f"{ANDROID_SDK}/platforms/android-34/android.jar")
BUILD_TOOLS = os.environ.get("BUILD_TOOLS", f"{ANDROID_SDK}/build-tools/34.0.0")

AAPT2 = f"{BUILD_TOOLS}/aapt2"
JAVAC = "javac"
D8 = f"{BUILD_TOOLS}/d8"
ZIPALIGN = f"{BUILD_TOOLS}/zipalign"
APKSIGNER = f"{BUILD_TOOLS}/apksigner"
KEYSTORE = PROJECT_ROOT / "debug.keystore"

KEYSTORE_PASS = os.environ.get("ANDROID_KEYSTORE_PASS")
KEY_PASS = os.environ.get("ANDROID_KEY_PASS", KEYSTORE_PASS)
KEY_ALIAS = os.environ.get("ANDROID_KEY_ALIAS", "androiddebugkey")
if not KEYSTORE_PASS:
    raise SystemExit("ERROR: ANDROID_KEYSTORE_PASS is required for signing; set it in the environment.")
os.environ.setdefault("ANDROID_KEY_PASS", KEY_PASS)


def run(cmd, cwd=None, check=True):
    print(f"$ {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd or PROJECT_ROOT, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
    if result.stderr:
        print(result.stderr, file=sys.stderr)
    if check and result.returncode != 0:
        sys.exit(result.returncode)
    return result


def clean():
    if BUILD_DIR.exists():
        shutil.rmtree(BUILD_DIR)
    for apk in PROJECT_ROOT.glob("*.apk"):
        apk.unlink()
    print("Cleaned build artifacts")


def ensure_keystore():
    if not KEYSTORE.exists():
        print("Generating debug.keystore...")
        run([
            "keytool", "-genkey", "-v",
            "-keystore", str(KEYSTORE),
            "-alias", KEY_ALIAS,
            "-keyalg", "RSA", "-keysize", "2048",
            "-validity", "10000",
            "-storepass", KEYSTORE_PASS,
            "-keypass", KEY_PASS,
            "-dname", "CN=Android Debug,O=Android,C=US"
        ])


def compile_resources():
    print("=== Compiling Resources ===")
    res_zip = BUILD_DIR / "res.zip"
    BUILD_DIR.mkdir(parents=True, exist_ok=True)

    # Compile resources
    run([AAPT2, "compile", "--dir", str(RES_DIR), "-o", str(res_zip)])

    # Link resources + generate R.java
    gen_dir = BUILD_DIR / "generated"
    gen_dir.mkdir(parents=True, exist_ok=True)
    run([
        AAPT2, "link",
        "-o", str(BUILD_DIR / "base.apk"),
        "-I", ANDROID_JAR,
        str(res_zip),
        "--manifest", str(MANIFEST),
        "--java", str(gen_dir)
    ])

    return gen_dir


def compile_java(gen_dir):
    print("=== Compiling Java ===")
    classes_dir = BUILD_DIR / "classes"
    classes_dir.mkdir(parents=True, exist_ok=True)

    # Find all Java sources
    java_files = list(SRC_DIR.rglob("*.java"))
    if not java_files:
        print("No Java sources found")
        return

    gen_java = list(gen_dir.rglob("*.java"))
    all_java = java_files + gen_java

    run([
        JAVAC,
        "-source", "1.8", "-target", "1.8",
        "-bootclasspath", ANDROID_JAR,
        "-d", str(classes_dir),
        *[str(f) for f in all_java]
    ])


def dex():
    print("=== Dexing ===")
    dex_dir = BUILD_DIR / "dex"
    dex_dir.mkdir(parents=True, exist_ok=True)

    class_files = list((BUILD_DIR / "classes").rglob("*.class"))
    if not class_files:
        print("No class files to dex")
        return

    run([
        D8,
        "--output", str(dex_dir),
        "--lib", ANDROID_JAR,
        *[str(f) for f in class_files]
    ])


def package_apk():
    print("=== Packaging APK ===")
    unaligned = PROJECT_ROOT / "bounce-unaligned.apk"
    res_zip = BUILD_DIR / "res.zip"

    run([
        AAPT2, "link",
        "-o", str(unaligned),
        "-I", ANDROID_JAR,
        str(res_zip),
        "--manifest", str(MANIFEST)
    ])

    # Add classes.dex
    dex_file = BUILD_DIR / "dex" / "classes.dex"
    if dex_file.exists():
        import zipfile
        with zipfile.ZipFile(unaligned, 'a') as z:
            z.write(dex_file, "classes.dex")
    else:
        print("WARNING: classes.dex not found")


def align_and_sign():
    print("=== Aligning & Signing ===")
    unaligned = PROJECT_ROOT / "bounce-unaligned.apk"
    aligned = PROJECT_ROOT / "bounce-aligned.apk"

    run([ZIPALIGN, "-f", "4", str(unaligned), str(aligned)])
    run([
        APKSIGNER, "sign",
        "--ks", str(KEYSTORE),
        "--ks-pass", "env:ANDROID_KEYSTORE_PASS",
        "--key-pass", "env:ANDROID_KEY_PASS",
        str(aligned)
    ])

    # Final output
    shutil.move(str(aligned), str(OUTPUT_APK))
    unaligned.unlink(missing_ok=True)
    print(f"✓ Built {OUTPUT_APK}")


def build():
    ensure_keystore()
    gen_dir = compile_resources()
    compile_java(gen_dir)
    dex()
    package_apk()
    align_and_sign()


def install():
    build()
    run(["adb", "install", "-r", str(OUTPUT_APK)])


def main():
    if len(sys.argv) < 2:
        print("Usage: build.py [build|clean|install]")
        sys.exit(1)

    cmd = sys.argv[1]
    if cmd == "build":
        build()
    elif cmd == "clean":
        clean()
    elif cmd == "install":
        install()
    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)


if __name__ == "__main__":
    main()