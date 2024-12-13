#| 
 Nombre: terminoGeneral-cantidad
 Objetivo: calcular la cantidad de dinero a depositar según los intereses y el tiempo
 Parámetro:
         c: cantidad de dinero a depositar
         n: número de años
         i: porcentaje de interés
 Resultado: 
         Cantidad de dinero a depositar
 Descripción:
          Se calcula el término general a_n de la sucesión numérica usando los argumentos de entrada:
                          a_n = C ( 1 + (i/100) )^n
 Funciones a las que llama: ninguna
|#

(define (terminoGeneral-cantidad c n i)

  ;; Variable local
  
  (define numero ;;Termino general a_n
    (*
     (expt (+ 1 (/ i 100.0)) n)
     c))

  ;; Cuerpo función
  
  (/
   (round (* numero 100)) ;; Se obtiene el numero con dos decimales redondeando
   100)
  
  )

;; (terminoGeneral-cantidad 1000 3 2)
;; (terminoGeneral-cantidad 1000.50 10 5)
;; (terminoGeneral-cantidad 1000 5 0)




#| 
 Nombre: terminoGeneral-Fibonacci
 Objetivo: Calcular el n-ésimo termino de la suceción de Fibonacci
 Parámetro:
         n: n-ésimo término de la sucesión
 Resultado: 
         n-ésimo término de la sucesión de Fibonacci
 Descripción:
         Se calcula el término general a_n de la sucesión numérica
 Funciones a las que llama: ninguna
|#

(define (terminoGeneral-Fibonacci n)

  ;; Variables locales
  (define a
    (expt
     (/
      (+ 1 (sqrt 5)) 2) n))

  (define b
    (expt
     (/
      (- 1 (sqrt 5)) 2) n))

  ;; Cuerpo de la función
  (truncate ;; Se obtiene un número real sin decimales
   (/ (- a b) (sqrt 5))
  )
  
  )

;; (terminoGeneral-Fibonacci 0)
;; (terminoGeneral-Fibonacci 1)
;; (terminoGeneral-Fibonacci 2)
;; (terminoGeneral-Fibonacci 3)
;; (terminoGeneral-Fibonacci 4)




#| 
 Nombre: convergencia-aureo
 Objetivo: Comprobar si la división de cualquier a_n de la sucesión de Fibonacci por el anterior, converge al número áureo
 Parámetro:
         n: n-ésimo término de la sucesión de Fibonacci
 Resultado: 
         Aproximación al número áureo
 Descripción:
         Se calcula a_n+1 / a_n donde:
         a_n es el n-ésimo término de la sucesión de Fibonacci y a_n+1 el término posterior
 Funciones a las que llama: terminoGeneral-Fibonacci
|#

(define (convergencia-aureo n)

  ;; Cuerpo función
  (/ (terminoGeneral-Fibonacci (+ n 1)) (terminoGeneral-Fibonacci n))

  )

;; (convergencia-aureo 1)
;; (convergencia-aureo 5)
;; (convergencia-aureo 13)
;; (convergencia-aureo 150)




#| 
 Nombre: millas->kilometros
 Objetivo: Convertir de millas a kilómetros
 Parámetro:
         m: Número de millas
 Resultado: 
         Equivalencia en kilómetros
 Descripción:
         Multiplicar el número de millas pasada como argumento por el factor 1.60934
 Funciones a las que llama: ninguna
|#

(define (millas->kilometros m)

   ;; Cuerpo función
  (* m 1.60934)

  )

;; (millas->kilometros 1)
;; (millas->kilometros 2)
;; (millas->kilometros 10)




#| 
 Nombre: kilometros->millas
 Objetivo: Convertir de kilómetros a millas
 Parámetro:
         k: Número de kilómetros
 Resultado: 
         Equivalencia en millas
 Descripción:
        Dividir el número de kilómetros pasada como argumento por el factor 1.60934
 Funciones a las que llama: ninguna
|#

(define (kilometros->millas k)

   ;; Cuerpo función
  (/ k 1.60934)

  )

;; (kilometros->millas 1)
;; (kilometros->millas 2)
;; (kilometros->millas 10)




#| 
 Nombre: celsius->fahrenheit
 Objetivo: Convertir de grados celsius a grados fahrenheit
 Parámetro:
         c: Grados celsius
 Resultado: 
         Equivalencia en grados fahrenheit
 Descripción:
        Aplicar la conversion: (c * 9/5) + 32
 Funciones a las que llama: ninguna
|#

(define (celsius->fahrenheit c)

   ;; Cuerpo función
  (+ (* c 9/5) 32)

  )

;; (celsius->fahrenheit 0)
;; (celsius->fahrenheit 100)
;; (celsius->fahrenheit -15)
;; (celsius->fahrenheit -20)




#| 
 Nombre: fahrenheit->celsius
 Objetivo: Convertir de grados fahrenheit a grados celsius
 Parámetro:
         f: Grados fahrenheit
 Resultado: 
         Equivalencia en grados celsius
 Descripción:
        Aplicar la conversion: (f - 32) * 5/9
 Funciones a las que llama: ninguna
|#

(define (fahrenheit->celsius f)

   ;; Cuerpo función
  (* (- f 32) (/ 5 9.0))

  )

;; (fahrenheit->celsius 32)
;; (fahrenheit->celsius 212)
;; (fahrenheit->celsius 5)
;; (fahrenheit->celsius -4)




#| 
 Nombre: perimetro
 Objetivo: Calcular el perimetro de un poligono regular
 Parámetro:
         n: Número de lados del polígono
         l: Longitud de los lados del polígono
 Resultado:
         Perímetro del polígono regular  
 Descripción:
         Se multiplica el número de lados y su longitud
 Funciones a las que llama: ninguna
|#

(define (perimetro n l)

  ;; Cuerpo función
  (* n l)
  )

;; (perimetro 0 2)
;; (perimetro 4 2)
;; (perimetro 10 1)




#| 
 Nombre: angulo-central
 Objetivo: Calcular el ángulo central de un polígono regular
 Parámetro:
         n: Número de lados del polígono regular
 Resultado: 
         Valor del ángulo en grados del polígono regular
 Descripción:
          Se divide 360º entre en número de lados
 Funciones a las que llama: ninguna
|#

(define (angulo-central n)

  ;; Cuerpo función
  (/ 360 n)
  )

;; (angulo-central 3)
;; (angulo-central 4)
;; (angulo-central 12)




#| 
 Nombre: apotema
 Objetivo: Calcular la apotema de un polígono regular
 Parámetro:
         n: Número de lados del polígono regular
         l: Longitud de lados del polígono regular
 Resultado: 
         Valor de la apotema del polígono regular
 Descripción:
          Se aplica la fórmula: l / 2 * tan(alpha/2) siendo alpha el valor del ángulo central
 Funciones a las que llama: angulo-central
|#


(define (apotema n l)
  
  ;; Funcion auxiliar
  (define (grados->radianes g)
    (define pi (acos -1.0))
    (* g (/ pi 180))
    )
  
  ;; Cuerpo función
  (/ l
     (* 2
        (tan
         (/
          (grados->radianes (angulo-central n))
          2))))
  )

;; (apotema 3 2)
;; (apotema 4 2)
;; (apotema 12 10)




#| 
 Nombre: area-poligono
 Objetivo: Calcular el area de un poligono regular
 Parámetro:
         n: Número de lados de un polígono regular
         l: Longitud de los lados de un polígono regular
 Resultado: 
         Área del polígono regular
 Descripción:
          Se calcula el perímetro y la apotema del polígono y se aplica la fórmula: (perímetro * apotema) / 2
 Funciones a las que llama: perimetro apotema
|#

(define (area-poligono n l)

  ;; Cuerpo función
  (/
   (* (perimetro n l) (apotema n l))
   2)
  )

;; (area-poligono 3 2)
;; (area-poligono 4 2)
;; (area-poligono 12 10)




#| 
 Nombre: areaTriangulo
 Objetivo: Calcular el área de un triángulo a partir de sus lados
 Parámetro:
         a: Longitud de uno de los lados
         b: Longitud de uno de los lados
         c: Longitud de uno de los lados
 Resultado: 
         Área del triángulo
 Descripción:
          Se usa la fórmula de Héron para calcular el área del triángulo
 Funciones a las que llama: ninguna
|#

(define (areaTriangulo a b c)

  ;; Variable local
  (define s (/ (+ a b c) 2))

   ;; Cuerpo función
    (sqrt
     (* (- s a) (- s b) (- s c) s))
)

;; (areaTriangulo 1 1 1)
;; (areaTriangulo 5 6 2)
;; (areaTriangulo 10.5 (sqrt 4) (* 3 4))




#| 
 Nombre: areaRombo
 Objetivo: Calcular el área de un rombo a partir de sus diagonales
 Parámetro:
         d1: Valor de la longitud diagonal mayor/menor del rombo
         d2: Valor de la longitud diagonal mayor/menor del rombo
 Resultado: 
         Valor del área del rombo
 Descripción:
         Se aplica la fórmula: (d1 * d2) / 2
 Funciones a las que llama: ninguna
|#

(define (areaRombo d1 d2)

  ;; Cuerpo función
  (/ (* d1 d2) 2.)
  
  )

;; (areaRombo 10 5)
;; (areaRombo 2.3 5.5)
;; (areaRombo 1 2)




#| 
 Nombre: areaTrapecio
 Objetivo: Calcular el área del trapecio a partir de sus bases y altura
 Parámetro:
         b1: Valor de la longitud de la base mayor/menor del trapecio
         b2: Valor de la longitud de la base mayor/menor del trapecio
          h: Valor de la altura del trapecio
 Resultado:
          Valor del área del trapecio
 Descripción:
          Se aplica la fórmula: ((b1+b2)/2) * h
 Funciones a las que llama: ninguna
|#

(define (areaTrapecio b1 b2 h)

  ;; Cuerpo función
  (/ (* (+ b1 b2) h) 2.)

  )

;; (areaTrapecio 10 5 5)
;; (areaTrapecio 0 1 1)
;; (areaTrapecio 20 20 20)




#| 
 Nombre: distancia-euclidiana
 Objetivo: Calcular la distancia euclidiana entre dos puntos cualesquiera del plano
 Parámetro:
         x1: Coordenada x del punto P1
         y1: Coordenada y del punto P1
         x2: Coordenada x del punto P2
         y2: Coordenada y del punto P2
 Resultado: 
         Distancia euclidiana entre los dos puntos pasados como argumentos
 Descripción:
          Se aplica la fórmula:
            sqrt( (x2 - x1)^2 + (y2-y1)^2 )
 Funciones a las que llama: ninguna
|#

(define (distancia-euclidiana x1 y1 x2 y2)

  ;; Variables locales
  (define x (expt (- x2 x1) 2))
  (define y (expt (- y2 y1) 2))

  ;; Cuerpo función
  (sqrt (+ x y))

  )

;; (distancia-euclidiana 0 0 5 5)
;; (distancia-euclidiana 3 3.5 -5.1 -5.2)
;; (distancia-euclidiana -10 3.5 20 0)




#| 
 Nombre: distancia-manhattan
 Objetivo: Calcular la distancia de Manhattan entre dos puntos cualesquiera del plano
 Parámetro:
         x1: Coordenada x del punto P1
         y1: Coordenada y del punto P1
         x2: Coordenada x del punto P2
         y2: Coordenada y del punto P2
 Resultado: 
         Distancia de Manhattan entre los dos puntos pasados como argumentos
 Descripción:
          Se aplica la fórmula:
              |x2-x1| + |y2-y1|
 Funciones a las que llama: ninguna
|#

(define (distancia-manhattan x1 y1 x2 y2)

  ;; Cuerpo función
  (+ (abs (- x2 x1)) (abs (- y2 y1)))
  )

;; (distancia-manhattan 0 0 5 5)
;; (distancia-manhattan 3 3.5 -5.1 -5.2)
;; (distancia-manhattan -10 3.5 20 0)




#| 
 Nombre: distancia-chebyshev
 Objetivo: Calcular la distancia de Chebyshev entre dos puntos cualesquiera del plano
 Parámetro:
         x1: Coordenada x del punto P1
         y1: Coordenada y del punto P1
         x2: Coordenada x del punto P2
         y2: Coordenada y del punto P2
 Resultado: 
         Distancia de Chebyshev entre los dos puntos pasados como argumentos
 Descripción:
          Se aplica la fórmula:
              max( |x2-x1|, |y2-y1|)
 Funciones a las que llama: ninguna
|#

(define (distancia-chebyshev x1 y1 x2 y2)

  ;; Cuerpo función
  (max (abs (- x2 x1)) (abs (- y2 y1)))
  )

;; (distancia-chebyshev 0 0 5 5)
;; (distancia-chebyshev 3 3.5 -5.1 -5.2)
;; (distancia-chebyshev -10 3.5 20 0)




#| 
 Nombre: areaTrianguloVertices
 Objetivo: Calcular el area de un triangulo a partir de las coordenadas de sus vértices
 Parámetro:
         x1: Coordenada x del punto P1
         y1: Coordenada y del punto P1
         x2: Coordenada x del punto P2
         y2: Coordenada y del punto P2
         x3: Coordenada x del punto P3
         y3: Coordenada y del punto P3
 Resultado: 
         Valor del área del triángulo
 Descripción:
         Se calcula la distancia euclidiana entre los puntos pasados como argumentos llamando a la
         función distancia-euclidiana obteniendo así la longitud de los lados del triángulo,
         y se calcula el área llamando a la función areaTriangulo que usa la fórmula de Héron
 Funciones a las que llama: distancia-euclidiana areaTriangulo
|#

(define (areaTrianguloVertices x1 y1 x2 y2 x3 y3)

  ;; Variables locales
  (define lado1 (distancia-euclidiana x1 y1 x2 y2))
  (define lado2 (distancia-euclidiana x2 y2 x3 y3))
  (define lado3 (distancia-euclidiana x3 y3 x1 y1))

  ;; Cuerpo función
  (areaTriangulo lado1 lado2 lado3)

  )

;; (areaTrianguloVertices 0 10 10 0 -10 0)
;; (areaTrianguloVertices 1 2 3 -1 5 5)




#| 
 Nombre: areaRomboVerticesLet
 Objetivo: Calcular el área de un rombo a partir de las coordenadas de sus vértices
 Parámetro:
         x1: Coordenada x del punto A
         y1: Coordenada y del punto A
         x2: Coordenada x del punto B
         y2: Coordenada y del punto B
         x3: Coordenada x del punto A' (punto opuesto al A)
         y3: Coordenada y del punto A' (punto opuesto al A)
         x4: Coordenada x del punto B' (punto opuesto al B)
         y4: Coordenada y del punto B' (punto opuesto al B)
 Resultado: 
         Valor del área del rombo
 Descripción:
          Se calcula la diagonal mayor y menor usando la distancia euclidiana
          y se calcula el área del rombo con las medidas de las diagonales.
 Funciones a las que llama: distancia-euclidiana areaRombo
|#

(define (areaRomboVerticesLet x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Cuerpo función
  (let
      ;; Variables locales let
      (
        (d1 (distancia-euclidiana x1 y1 x3 y3))
        (d2 (distancia-euclidiana x2 y2 x4 y4))
      )
      ;; Cuerpo función let
       (areaRombo d1 d2)
  )
 )

;; (areaRomboVerticesLet 5 0 0 2 -5 0 0 -2)
;; (areaRomboVerticesLet 2 4 4 0 2 -4 0 0)




#| 
 Nombre: distanciaPuntoRecta
 Objetivo: Calcular la distancia de un punto a una recta
 Parámetro:
         x: Coordenada x del punto
         y: Coordenada y del punto
         a: Coeficiente de la x de la ecuación de la recta
         b: Coeficiente de la y de la ecuación de la recta
         c: Término independiente de la ecuación de la recta
 Resultado:
         Valor de la distancia del punto a la recta 
 Descripción:
          Se resuelve la fórmula:
                 |ax + by + c| / sqrt(a^2 + b^2)
 Funciones a las que llama: ninguna
|#

(define (distanciaPuntoRecta x y a b c)

  ;; Cuerpo función
  (/
   (abs
    (+ (* a x) (* b y) c))
   (sqrt (+ (expt a 2) (expt b 2)))

  )
 )

;; (distanciaPuntoRecta 0 0 5 2 1)
;; (distanciaPuntoRecta -5 -5 -5 0 0)




#| 
 Nombre: distanciaPuntoRecta2
 Objetivo: Calcular la distancia de un punto a la recta que pasa por dos puntos dados
 Parámetro:
         x0: Coordenada x del punto
         y0: Coordenada y del punto
         x1: Coordenada x de un punto por el que pasa la recta
         y1: Coordenada y de un punto por el que pasa la recta
         x2: Coordenada x de otro punto por el que pasa la recta
         y2: Coordenada y de otro punto por el que pasa la recta
 Resultado: 
         Valor de la distancia del punto a la recta
 Descripción:
         Se calcula los coeficientes de la recta que pasa por los puntos dados como argumentos
         y se calcula la distancia del punto dado a la recta calculada.
 Funciones a las que llama: distanciaPuntoRecta
|#

(define (distanciaPuntoRecta2 x0 y0 x1 y1 x2 y2)

  ;; Cuerpo función
  (let
      ;; Variables locales let
      (
       (a (- y2 y1))
       (b (- x1 x2))
       (c (- (* y1 x2) (* x1 y2)))
       )
    ;; Cuerpo función let
    (distanciaPuntoRecta x0 y0 a b c)
   )
  )

;; (distanciaPuntoRecta2 0 0 5 0 0 5)
;; (distanciaPuntoRecta2 -2 -2 0 -10 0 10)




#| 
 Nombre: areaTrapecioLetVertices
 Objetivo: Calcular el área de un trapecio a partir de sus vértices
 Parámetro:
         x1: Coordenada x del punto de la base menor
         y1: Coordenada y del punto de la base menor
         x2: Coordenada x del punto contiguo de la base menor
         y2: Coordenada y del punto contiguo de la base menor
         x3: Coordenada x del punto de la base mayor (contiguo al punto x2, y2)
         y3: Coordenada y del punto de la base mayor (contiguo al punto x2, y2)
         x4: Coordenada x del punto contiguo a la base mayor (contiguo al punto x1, y1)
 Resultado: 
         Valor del área del trapecio
 Descripción:
         Para calcular el área del trapecio, se calculan las bases usando las distancias euclidianas entre los vértices del trapecio
         y se calcula la altura usando la distancia de un vértice de la base menor a la recta que forma la base mayor.
 Funciones a las que llama: distancia-euclidiana distanciaPuntoRecta2 areaTrapecio
|#

(define (areaTrapecioLetVertices x1 y1 x2 y2 x3 y3 x4 y4)

  (let
      ;; Variables locales let
      (
       (base-menor (distancia-euclidiana x1 y1 x2 y2))
       (base-mayor (distancia-euclidiana x3 y3 x4 y4))
       (altura (distanciaPuntoRecta2 x1 y1 x3 y3 x4 y4))
      )
    ;; Cuerpo función let
    (areaTrapecio base-menor base-mayor altura)
    
  )
 )

;; (areaTrapecioLetVertices -2 2 2 2 3 -1 -3 -1)
;; (areaTrapecioLetVertices 2 0 0 0 -1 2 3 2)