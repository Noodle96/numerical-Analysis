# Splines Interpolantes
Consiste en usar una función por partes, cuyas partes son justamente polinomios interpolantes de grado menor .Esta función por partes deberia de tener características deseables, como continuidad y difereciabilidad.

**Ejemplo 1** Sea \( f(x) = x<sub>3</sub> -x<sub>2</sub> + x +2 \) halle una spline cúbica que interpole los siguientes puntos
<div align="center">

|  x<sub>k</sub>|f(x<sub>k</sub>)|
| ----------------- | ----------------------------- |
| -1 | -1   |
| 0 |  2  |
| 1 |  3 |
| 2 |  8 |
| 3 |  23  |
</div>

Spline Lineal
<p align="center">
  <img src='../../assets/images/splines/lineal.jpg' width='800px' />
</p>

Spline Cubico
<p align="center">
  <img src='../../assets/images/splines/01.png' width='800px' />
</p>
