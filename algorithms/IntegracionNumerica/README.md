# Integración numérica 

## Fórmulas de Newton-Cotes

Sabemos que, si una función $f: \mathbb{R} \mapsto \mathbb{R}$ es continua en el intervalo $[a, b]$, entonces tal función tiene antiderivada $F$ en $[a, b]$, es decir

$$
F^{\prime}(x)=f(x), \quad x \in[a, b]
$$

y

$$
\int_{a}^{b} f(x) d x=F(b)-F(a)
$$

Sin lugar a dudas, esto constituyó uno de los más grandes descubrimientos dentro del cálculo infinitesimal. Pero es casi improbable calcular la integral de una función arbitraria $f$. En esta sesión veremos algunos de los más populares métodos numéricos para calcular integrales definidas.

Ejemplo 1 Consideremos los discos duros de un determinado modelo y marca producidos por una empresa de material informático. Se sabe que el tiempo de vida de estos discos es una variable aleatoria normalmente distribuida com $\mu=760$ y $\sigma=140$ horas. Se desea determinar la probabilidad de que un disco tenga un tiempo de vida entre 700 y 800 horas.

Se sabe que la siguiente función
$$
\begin{align*}
f(x)=\frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{(x-\mu)^{2}}{2 \sigma^{2}}},       &  -\infty<x<\infty  
\end{align*}
$$
<!-- $$
f(x) = \frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{(x-\mu)^{2}}{2 \sigma^{2}}}  -\infty<x<\infty 
$$ -->
<!-- f(x)=\frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{(x-\mu)^{2}}{2 \sigma^{2}}}, \quad-\infty<x<\infty -->

donde $x$ es la variable aleatoria, $\mu$ es la media y $\sigma$ la desviación estándar, corresponde a la distribución Normal.

Para determinar la probabilidad que un disco tenga un tiempo de vida entre 700 y 800 horas, debemos calcular:

$$
\begin{aligned}
\mathrm{P}(700 \leq x \leq 800) & =\int_{700}^{800} \frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{(x-\mu)^{2}}{2 \sigma^{2}}} \mathrm{~d} x \\
& =\int_{700}^{800} \frac{1}{140 \sqrt{2 \pi}} e^{-\frac{(x-760)^{2}}{2(140)^{2}}} \mathrm{~d} x
\end{aligned}
$$

Aquí ya vemos un inconveniente, esa integral definida no se puede resolver con los métodos exactos conocidos.  [^0]
<!-- ${ }^{1}$ -->

La idea básica de los métodos consiste en establecer una partición uniforme del intervalo de integración $[a, b]$ :

$$
a=x_{0}<x_{1}<x_{2}<\ldots<x_{n-1}<x_{n}=b
$$donde $h=x_{1}-x_{0}=x_{2}-x_{1}=\cdots=x_{n}-x_{n-1}=(b-a) / n$. Posteriormente, sustituir la función $f$ por polinomios interpoladores que la aproximen razonablemente en el intervalo $[a, b]$. Así, el problema se resumiría a la integración de polinomios, lo que es trivial.

Específicamente, veremos dos casos particulares de las fórmulas de Newton-Cotes, que se caracterizan por

$$
x_{0}=a, \quad x_{n}=b, \quad y \quad \int_{a}^{b} f(x) d x=\int_{x_{0}}^{x_{n}} f(x) d x=A_{0} f\left(x_{0}\right)+A_{1} f\left(x_{1}\right)+\ldots+A_{n} f\left(x_{n}\right)
$$

donde los coeficientes $A_{0}, A_{1}, \ldots A_{n}$ son determinados de acuerdo con el grado del polinomio aproximador.

## 1. Método de los Trapecios

Si usamos la fórmula de Lagrange para interpolar $f$, mediante un polinomio $p_{1}$ de grado uno, en $x_{0}$ y $x_{1}$, tenemos

$$
\begin{aligned}
\int_{x_{0}}^{x_{1}} f(x) d x & \approx \int_{x_{0}}^{x_{1}} p_{1}(x) d x \\
& =\int_{x_{0}}^{x_{1}}\left(\frac{x-x_{1}}{-h} f\left(x_{0}\right)+\frac{x-x_{0}}{h} f\left(x_{1}\right)\right) d x \\
& =\frac{1}{h} \int_{x_{0}}^{x_{1}}\left(x_{1} f\left(x_{0}\right)-x f\left(x_{0}\right)+x f\left(x_{1}\right)-x_{0} f\left(x_{1}\right)\right) d x \\
& =\frac{1}{h}\left(x_{1} f\left(x_{0}\right) \int_{x_{0}}^{x_{1}} d x-f\left(x_{0}\right) \int_{x_{0}}^{x_{1}} x d x+f\left(x_{1}\right) \int_{x_{0}}^{x_{1}} x d x-x_{0} f\left(x_{1}\right) \int_{x_{0}}^{x_{1}} d x\right) \\
& =\frac{1}{h}\left(x_{1} f\left(x_{0}\right)\left(x_{1}-x_{0}\right)-\frac{f\left(x_{0}\right)\left(x_{1}^{2}-x_{0}^{2}\right)}{2}+\frac{f\left(x_{1}\right)\left(x_{1}^{2}-x_{0}^{2}\right)}{2}-x_{0} f\left(x_{1}\right)\left(x_{1}-x_{0}\right)\right) \\
& =\frac{1}{h}\left(x_{1} f\left(x_{0}\right) h-\frac{f\left(x_{0}\right)\left(x_{1}+x_{0}\right) h}{2}+\frac{f\left(x_{1}\right)\left(x_{1}+x_{0}\right) h}{2}-x_{0} f\left(x_{1}\right) h\right) \\
& =\left(x_{1} f\left(x_{0}\right)-\frac{f\left(x_{0}\right)\left(x_{1}+x_{0}\right)}{2}+\frac{f\left(x_{1}\right)\left(x_{1}+x_{0}\right)}{2}-x_{0} f\left(x_{1}\right)\right) \\
& =f\left(x_{0}\right)\left(x_{1}-\frac{x_{1}+x_{0}}{2}\right)+f\left(x_{1}\right)\left(\frac{x_{1}+x_{0}}{2}-x_{0}\right) \\
& =f\left(x_{0}\right)\left(\frac{x_{1}-x_{0}}{2}\right)+f\left(x_{1}\right)\left(\frac{x_{1}-x_{0}}{2}\right) \\
& =\frac{h}{2}\left(f\left(x_{0}\right)+f\left(x_{1}\right)\right)=T
\end{aligned}
$$

Observe que, cuando $f$ sobre $\left[x_{0}, x_{1}\right]$ está por encima del eje de las abscisas, $T$ puede ser interpretada como el área del trapecio mostrado en la figura de abajo, que es una aproximación para el valor de la integral de $f$ en $\left[x_{0}, x_{1}\right]$. Mientras más pequeño sea $h$, mejor será la aproximación.

![](https://cdn.mathpix.com/cropped/2024_02_01_101aa18d505605f6a2a6g-3.jpg?height=494&width=711&top_left_y=435&top_left_x=684)

Podemos repetir ese procedimiento para cada uno de los subintervalos generados por la partición uniforme, así

$$
\begin{aligned}
\int_{a}^{b} f(x) d x & =\sum_{k=0}^{n-1} \int_{x_{k}}^{x_{k+1}} f(x) d x \approx \sum_{k=0}^{n-1} \frac{h}{2}\left(f\left(x_{k}\right)+f\left(x_{k+1}\right)\right) \\
& =\frac{h}{2} \sum_{k=0}^{n-1}\left(f\left(x_{k}\right)+f\left(x_{k+1}\right)\right)
\end{aligned}
$$

Note además que $x_{k}=x_{0}+k h=a+k h$, esto nos lleva al siguiente algoritmo.

Algoritmo 1 (Regla de los Trapecios) Dada la función $\mathrm{f}: \mathbb{R} \mapsto \mathbb{R}$ continua en $[\mathrm{a}, \mathrm{b}]$.

1. Definir $\mathrm{n}$ y calcular $\mathrm{h}=(\mathrm{b}-\mathrm{a}) / \mathrm{n}$
2. Calcular

$$
I=\frac{h}{2} \sum_{k=0}^{n-1}\{f(a+k h)+f(a+(k+1) h)\}
$$

I es una aproximación $a \int_{a}^{b} f(x) d x$

Una función en MatLab quedaría así:

![](https://cdn.mathpix.com/cropped/2024_02_01_101aa18d505605f6a2a6g-3.jpg?height=301&width=572&top_left_y=1893&top_left_x=660)

Ejemplo 2 Usando la función MatLab de arriba, calcule y verifique que, para $\mathrm{n}=10000$, se cumple

$$
\int_{-1}^{2} x^{2} \mathrm{~d} x \approx 3.000000004499998
$$

Ejercicio 1 Numéricamente, halle la probabilidad, $\mathrm{P}(700 \leq x \leq 800)$, mencionada en (1):

$$
\int_{700}^{800} \frac{1}{140 \sqrt{2 \pi}} e^{-\frac{(x-760)^{2}}{2(140)^{2}}} d x
$$

SOLUCIÓN. 0.27833...

## 2. Método de Simpson

Consideremos la misma partición introducida en la parte superior. Podemos usar de nuevo la fórmula de Lagrange para obtener la fórmula de integración resultante de la interpolación de $f$ por un polinomio de grado 2. Sea $p_{2}$ el polinomio que interpola $f$ en los puntos $x_{0}$, $x_{1}=x_{0}+h$ y $x_{2}=x_{0}+2 h:$

![](https://cdn.mathpix.com/cropped/2024_02_01_101aa18d505605f6a2a6g-4.jpg?height=571&width=791&top_left_y=914&top_left_x=632)

Así,

$$
p_{2}(x)=\frac{\left(x-x_{1}\right)\left(x-x_{2}\right)}{(-h)(-2 h)} f\left(x_{0}\right)+\frac{\left(x-x_{0}\right)\left(x-x_{2}\right)}{(h)(-h)} f\left(x_{1}\right)+\frac{\left(x-x_{0}\right)\left(x-x_{1}\right)}{(2 h)(h)} f\left(x_{2}\right)
$$

Luego,

$$
\begin{aligned}
& \int_{x_{0}}^{x_{2}} f(x) d x \approx \int_{x_{0}}^{x_{2}} p_{2}(x) d x \\
& =\frac{f\left(x_{0}\right)}{2 h^{2}} \int_{x_{0}}^{x_{2}}\left(x-x_{1}\right)\left(x-x_{2}\right) d x-\frac{f\left(x_{1}\right)}{h^{2}} \int_{x_{0}}^{x_{2}}\left(x-x_{0}\right)\left(x-x_{2}\right) d x+\frac{f\left(x_{2}\right)}{2 h^{2}} \int_{x_{0}}^{x_{2}}\left(x-x_{0}\right)\left(x-x_{1}\right) d x
\end{aligned}
$$

Integrando(realizar el procedimiento), tenemos

$$
\int_{x_{0}}^{x_{2}} f(x) d x \approx \frac{h}{3}\left(f\left(x_{0}\right)+4 f\left(x_{1}\right)+f\left(x_{2}\right)\right)=S
$$

Podemos tomar de tres en tres puntos de la partición y aplicar repetidamente esta regla, para
eso requerimos que la partición sea definida por $n$ par. Luego:

$$
\begin{aligned}
\int_{a}^{b} f(x) d x= & \int_{x_{0}}^{x_{n}} f(x) d x=\sum_{k=1}^{n / 2} \int_{x_{2 k-2}}^{x_{2 k}} f(x) d x \approx \frac{h}{3}\left\{\left[f\left(x_{0}\right)+4 f\left(x_{1}\right)+f\left(x_{2}\right)\right]\right. \\
& \left.+\left[f\left(x_{2}\right)+4 f\left(x_{3}\right)+f\left(x_{4}\right)\right]+\cdots+\left[f\left(x_{n-2}\right)+4 f\left(x_{n-1}\right)+f\left(x_{n}\right)\right]\right\}
\end{aligned}
$$

Más aún,

$$
\begin{aligned}
\int_{a}^{b} f(x) d x \approx & \frac{h}{3}\left\{\left[f\left(x_{0}\right)+f\left(x_{n}\right)\right]+4\left[f\left(x_{1}\right)+f\left(x_{3}\right)+\cdots+f\left(x_{n-1}\right)\right]\right. \\
& \left.+2\left[f\left(x_{2}\right)+f\left(x_{4}\right)+\cdots+f\left(x_{n-2}\right)\right]\right\}
\end{aligned}
$$

Esto nos lleva al siguiente algoritmo.

Algoritmo 2 (Regla de Simpson) Dada la función $\mathrm{f}: \mathbb{R} \mapsto \mathbb{R}$ continua en $[\mathrm{a}, \mathrm{b}]$.

1. Definir $\mathrm{n}$ y calcular $\mathrm{h}=(\mathrm{b}-\mathrm{a}) / \mathrm{n}$
2. Calcular

$$
\begin{aligned}
S &= \frac{h}{3}\{[f(a)+f(b)]+4[f(a+h)+f(a+3 h)+\cdots+f(a+(n-1) h)] +2[f(a+2 h)+f(a+4 h)+\cdots+f(a+(n-2) h)]\}
\end{aligned}
$$

$S$ es una aproximación para $\int_{a}^{b} f(x) d x$

Una función en MatLab/Octave para este caso, estaría dada del siguiente modo:

![](https://cdn.mathpix.com/cropped/2024_02_01_101aa18d505605f6a2a6g-5.jpg?height=469&width=599&top_left_y=1588&top_left_x=657)

Ejercicio 2 Calcule numéricamente mediante el método de Simpson la integral $\int_{0}^{2} \mathrm{e}^{-x^{2}} \mathrm{dx}$. Compare con los resultados obtenidos con el método de los trapecios.

Ejercicio 3 Numéricamente, ahora mediante el método de Simpson, halle la probabilidad

$$
P(700 \leq x \leq 800)
$$

mencionada en en arriba. Compare con el método de los trapecios.

Ejercicio 4 Calcule numéricamente

$$
\int_{-3}^{7} \sin\left(7 x^{3}+ sin\left(\ln \left(x^{4}+x^{2}+5\right)\right)\right) dx
$$

Comente los resultados en clase.


[^0]:    ${ }^{1}$ En estadística y probabilidades, para hallar esas integrales lo usual es estandarizar la variable y utilizar las tablas al final de los libros.

