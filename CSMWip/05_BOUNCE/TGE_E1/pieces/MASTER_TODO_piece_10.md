
---

## PRIME ELECTRON WORLDLINE SPECIFICATIONS

### Electron Behavior
- Single particle emitted at eggshell center
- Initial velocity: (0, 0) - activated by SCAN or sensor input
- Walks worldline: position += velocity each frame
- Reflects off eggshell boundary: perfect elastic reflection with 1% energy loss
- Leaves persistent worldline trail (2000 points, gradient fade)

### Eggshell Geometry
- Elliptical boundary: rx = min(w,h)/2 - 40, ry = rx * 0.75
- Centered on screen
- Slow continuous rotation (0.0001 rad/frame)
- Semi-transparent stroke (#4488FF, 30% opacity)

