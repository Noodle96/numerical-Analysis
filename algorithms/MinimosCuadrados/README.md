# Ajuste de Curvas con mínimos cuadrados
Consideremos la siguiente tabla que representa la cotización del dólar (t<sub>i</sub>)  en el tiempo (c<sub>i</sub>) :

<div align="center">

| Tiempo (t<sub>i</sub>) | Cotización del dólar (c<sub>i</sub>) |
| ----------------- | ----------------------------- |
| 1 | 3790.81   |
| 2 |  4407.51  |
| 3 |  4412.01 |
| 4 |  4711.73 |
| 5 |  4283.17  |
| 6 | 5105.71   |
| 7 | 5383.11  |
| 8 |  5807.58  |
| 9 | 6079.87  |
|10 |  6205.98  |

</div>

Luego si graficamos los pares (t<sub>i</sub> ,c<sub>i</sub> ) que disponemos en los datos, formamos el siguiente diagrama de dispersión:
<p align="center">
  <img src='../../assets/images/minimosCuadrados/puntos.jpg' width='800px' />
</p>

En base a estos datos nos interesa encontrar una función c(t) con la que podeamos calcular una estimativa de la cotización del dolar para un tiempo cualquiera, para un polinomio de grado n el polinomio será\\

<p align="center">
  c(t) = a<sub>0</sub> + a<sub>1</sub>t + a<sub>2</sub>t<sup>2</sup> + ... + a<sub>n</sub>t<sup>n</sup>
</p>
Ajustando los puntos a un polinomio de grado 1
<p align="center">
  <img src='../../assets/images/minimosCuadrados/polinomio_01.jpg' width='800px' />
</p>

Ajustando los puntos a un polinomio de grado 2
<p align="center">
  <img src='../../assets/images/minimosCuadrados/polinomio_02.jpg' width='800px' />
</p>

Ajustando los puntos a un polinomio de grado 3
<p align="center">
  <img src='../../assets/images/minimosCuadrados/polinomio_03.jpg' width='800px' />
</p>
Ajustando los puntos a un polinomio de grado 4
<p align="center">
  <img src='../../assets/images/minimosCuadrados/polinomio_04.jpg' width='800px' />
</p>
Ajustando los puntos a un polinomio de grado 5
<p align="center">
  <img src='../../assets/images/minimosCuadrados/polinomio_05.jpg' width='800px' />
</p>