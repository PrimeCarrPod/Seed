### Prime Gap Universe
- Prime gaps from PrimeBookOne tiles drive concentric markers
- Each prime gap = elliptical ring at radius proportional to gap size
- Electron crossing gap threshold → increments gap index
- Visual: orange rings (#F97316), current gap highlighted
- Events sent to Android via TGEBridge.onPrimeGapEvent()

### Landolil Menu Integration
- Fullscreen modal overlay (not Android dialog)
- 7 buttons: RESUME, THEORY MODE, PRIME EXPLORER, WORLDLINE HISTORY, GAP ANALYSIS, RESET
- Primary/secondary/danger button variants
- Theory mode toggles simulation physics vs visualization
- Back button closes menu first

### Sensor Integration
- Accelerometer + Gyroscope → motion input
- motionActive toggle enables sensor listeners
- JavaScript receives: updateMotion(ax,ay,az,gx,gy,gz)
