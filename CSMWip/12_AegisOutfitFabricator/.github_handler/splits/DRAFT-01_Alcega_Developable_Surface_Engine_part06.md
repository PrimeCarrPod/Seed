N_vertices
70
1
10
x1
20
y1
...
0
LINE
8
NOTCH
10
x_notch
20
y_notch
11
x_notch+3
21
y_notch
...
```

### 4.6 SVG Output Structure
```xml
<svg width="560mm" height="Lmm" viewBox="0 0 560 L">
  <g id="CUT" stroke="red" stroke-width="0.1" fill="none">
    <path d="M x1,y1 L x2,y2 ..."/>
  </g>
  <g id="FOLD" stroke="yellow" stroke-width="0.1" stroke-dasharray="2,2" fill="none">
