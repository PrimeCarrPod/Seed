
if [ ! -f "$ANDROID_JAR" ]; then echo "ERROR: android.jar not found"; exit 1; fi
if [ ! -f "$AAPT2" ]; then echo "ERROR: aapt2 not found"; exit 1; fi

rm -rf "$GEN_DIR" "$OBJ_DIR"
mkdir -p "$GEN_DIR" "$OBJ_DIR" "$OUT_DIR"

echo "[1/7] aapt2 compile..."
"$AAPT2" compile --dir "$SRC_DIR/res" -o "$OBJ_DIR/resources.zip" 2>/dev/null

echo "[2/7] aapt2 link..."
"$AAPT2" link -o "$OUT_DIR/$APP_NAME-base.apk" -I "$ANDROID_JAR" \
    --manifest "$SRC_DIR/AndroidManifest.xml" --java "$GEN_DIR" \
    --min-sdk-version $MIN_SDK --target-sdk-version $TARGET_SDK \
    --version-code $VERSION_CODE --version-name "$VERSION_NAME" \
    --auto-add-overlay -v "$OBJ_DIR/resources.zip" 2>&1 | grep -v "note:" | head -5

echo "[2b] Assets..."
if [ -d "$SRC_DIR/assets" ]; then
    ATMP="$OBJ_DIR/atmp"; mkdir -p "$ATMP"
    cp "$OUT_DIR/$APP_NAME-base.apk" "$ATMP/base.apk"
    (cd "$SRC_DIR" && zip -r "$ATMP/base.apk" assets/ 2>/dev/null)
