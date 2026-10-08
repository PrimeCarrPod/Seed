KEYSTORE="$PROJECT_DIR/debug.keystore"
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkey -v -keystore "$KEYSTORE" -alias androiddebugkey -keyalg RSA \
        -keysize 2048 -validity 10000 -storepass android -keypass android \
        -dname "CN=Bounce Debug, OU=CarrPod, O=CSM, L=Citadel, ST=Citadel, C=US" 2>/dev/null
fi
"$APKSIGNER" sign --ks "$KEYSTORE" --ks-pass pass:android --key-pass pass:android \
    --out "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" "$OUT_DIR/$APP_NAME-aligned.apk"

SIZE=$(stat --printf="%s" "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" 2>/dev/null || echo 0)
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  BUILD COMPLETE — $APP_NAME v$VERSION_NAME"
echo "  APK: $OUT_DIR/$APP_NAME-v$VERSION_NAME.apk"
echo "  Size: $SIZE bytes ($(echo "scale=1; $SIZE/1024" | bc 2>/dev/null || echo "?") KB)"
echo "═══════════════════════════════════════════════════════════"

"$AAPT2" dump badging "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" 2>/dev/null | head -5 || true
cp "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" "$PROJECT_DIR/../../../../CSMDropBox/$APP_NAME-v$VERSION_NAME.apk" 2>/dev/null && echo "  CSMDropBox copy OK" || true
cp "$OUT_DIR/$APP_NAME-v$VERSION_NAME.apk" "$PROJECT_DIR/../../../../$APP_NAME-v$VERSION_NAME.apk" 2>/dev/null && echo "  Repo root copy OK" || true
exit 0