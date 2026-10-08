    mv "$ATMP/base.apk" "$OUT_DIR/$APP_NAME-base.apk"; rm -rf "$ATMP"
fi

echo "[3/7] javac..."
ALL_SOURCES=$(find "$SRC_DIR/java" "$GEN_DIR" -name "*.java" 2>/dev/null)
javac -source 11 -target 11 -classpath "$ANDROID_JAR" -d "$OBJ_DIR" \
    -sourcepath "$SRC_DIR/java:$GEN_DIR" -Xlint:-options $ALL_SOURCES 2>&1 | grep -v "warning:" || true

echo "[4/7] d8..."
"$D8" --lib "$ANDROID_JAR" --min-api $MIN_SDK --output "$OBJ_DIR" \
    $(find "$OBJ_DIR" -name "*.class") 2>&1 | tail -1 || \
    find "$OBJ_DIR" -name "*.class" | xargs "$D8" --lib "$ANDROID_JAR" --min-api $MIN_SDK --output "$OBJ_DIR"

echo "[5/7] Dex inject..."
cp "$OUT_DIR/$APP_NAME-base.apk" "$OUT_DIR/$APP_NAME-dexed.apk"
cp "$OBJ_DIR/classes.dex" /tmp/classes.dex
(cd /tmp && zip -q "$OUT_DIR/$APP_NAME-dexed.apk" classes.dex); rm -f /tmp/classes.dex

echo "[6/7] zipalign..."
"$ZIPALIGN" -p -f 4 "$OUT_DIR/$APP_NAME-dexed.apk" "$OUT_DIR/$APP_NAME-aligned.apk"

echo "[7/7] apksigner..."
