#| PRÁCTICA 2. PROGRAMACIÓN DECLARATIVA. CURSO 2023-2024
   Autor: Carlos Lucena Robles
 -------------------------------------------------------
|#




;; FUNCIONES AUXILIARES PRACTICA 1
;; <---------------------------------------------------------------------->

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
      ;; (Modificado respecto a la práctica 1)
      (if (= d1 d2) (display "Coordenadas no válidas para formar un rombo")
       (areaRombo d1 d2))
  )
 )
;; <---------------------------------------------------------------------->
;; <---------------------------------------------------------------------->




#| 
 Nombre: codigo-provincia
 Objetivo: Obtener el código de las provincias de Andalucía
 Parámetro:
         nombre: Nombre de la provincia
 Resultado: 
         Número que identifica la provincia
 Descripción:
         Se asocia cada provincia con un número identificador.
         Si la provincia no pertenece a Andalucía, se muestra un mensaje de error.
         (Ejecutar con el dialecto Pretty Big)
 Funciones a las que llama: ninguna
|#

(define (codigo-provincia nombre)

  ;; Cuerpo función
  (case nombre
    (("Almeria")  4)
    (("Cadiz")    11)
    (("Cordoba")  14)
    (("Granada")  18)
    (("Huelva")   21)
    (("Jaen")     23)
    (("Malaga")   29)
    (("Sevilla")  41)
    (else (display "Provincia incorrecta"))
   ) 
  )

;; ¡¡Ejecutar con el dialecto Pretty Big!!
;; (codigo-provincia "Cordoba")
;; (codigo-provincia "Granada")
;; (codigo-provincia "Madrid")


 


#| 
 Nombre: letra-dni
 Objetivo: Calcular la letra del DNI
 Parámetro:
         n: Número del DNI
 Resultado: 
         Letra del DNI
 Descripción:
         Se calcula el resto de la divión n/23 y se devuelve la letra asignada
 Funciones a las que llama: ninguna
|#

(define (letra-dni n)

  ;; Cuerpo función
  (case (modulo n 23)
    ((0) "T")
    ((1) "R")
    ((2) "W")
    ((3) "A")
    ((4) "G")
    ((5) "M")
    ((6) "Y")
    ((7) "F")
    ((8) "P")
    ((9) "D")
    ((10) "X")
    ((11) "B")
    ((12) "N")
    ((13) "J")
    ((14) "Z")
    ((15) "S")
    ((16) "Q")
    ((17) "V")
    ((18) "H")
    ((19) "L")
    ((20) "C")
    ((21) "K") 
    ((22) "E")
   )

  )

;; (letra-dni 31889292)
;; (letra-dni 80111468);
;; (letra-dni 02628441);




#| 
 Nombre: vectores-angulo
 Objetivo: Calcular el ángulo que forman los vectores
 Parámetro:
         x1: Coordenada x del Punto 1 (Origen vector u)
         y1: Coordenada y del Punto 1 (Origen vector u)
         x2: Coordenada x del Punto 2 (Destino vector u)
         y2: Coordenada y del Punto 2 (Destino vector u)
         x3: Coordenada x del Punto 3 (Origen vector v)
         y3: Coordenada y del Punto 3 (Origen vector v)
         x4: Coordenada x del Punto 4 (Destino vector v)
         y4: Coordenada y del Punto 4 (Destino vector v)
 Resultado: 
         Valor del ángulo en radianes
 Descripción:
         Se calculan los vectores, u y v, definidos por los puntos P1P2 y P3P4
         y se calcula el ángulo entre los vectores usando el producto escalar.
         Si algún vector es nulo, se devuelve 0.0
 Funciones a las que llama: ninguna
|#

(define (vectores-angulo x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Variables locales
  (define u1 (- x2 x1)) ;; Componente del vector u=P1P2
  (define u2 (- y2 y1)) ;; Componente del vector u=P1P2

  (define v1 (- x4 x3)) ;; Componente del vector v=P3P4
  (define v2 (- y4 y3)) ;; Componente del vector v=P3P4

  (define pi (acos -1.0))
  
  ;; Cuerpo función

  ;; Si el vector u o v es nulo: se devuelve 0.0
  (if (or (and (= u1 0) (= u2 0)) (and (= v1 0) (= v2 0))) 0.0
      
      ;; Alternativa: se calcula el ángulo si los vectores NO son nulos
      (let
          ;; Variables locales de let
          (
           (aux (/
                 (+ (* u1 v1) (* u2 v2))
                 (* (sqrt (+ (expt u1 2) (expt u2 2)))
                    (sqrt (+ (expt v1 2) (expt v2 2))))))
          )
          ;; Cuerpo let
          ;; Usando una cota de error, se precisa si aux es muy cercano a -1 o 1 y se devuelve 0 o pi respectivamente
          ;; En caso contrario, se calcula el acos(aux)
           (cond
             ((and (positive? aux) (< (abs (- aux 1)) 1e-6)) 0)
             ((and (negative? aux) (< (abs (- aux -1)) 1e-6)) pi)
             (else (acos aux))
           )
     )
 )
)

;; (vectores-angulo 0 0 1 1 0 0 4 4)       ;; (vectores en la misma direccion y sentido)
;; (vectores-angulo 0 0 0 0 0 1 4 4)       ;; (vector nulo)
;; (vectores-angulo 0 0 10 10 0 0 -10 -10) ;; (vectores misma dirección distinto sentido)
;; (vectores-angulo 0 0 10 10 0 0 10 -10)
;; (vectores-angulo 0 0 10 10 0 0 -10 10)
;; (vectores-angulo 0 0 10 10 0 0 10 0)




#| 
 Nombre: posicion-rectas
 Objetivo: Determinar la posición relativa de dos rectas
 Parámetro:
         a1: Coeficiente de la X de la ecuación de una recta
         b1: Coeficiente de la Y de la ecuación de una recta
         c1: Término independiente de la ecuación de una recta
         a2: Coeficiente de la X de la ecuación de otra recta
         b2: Coeficiente de la Y de la ecuación de otra recta
         c2: Término independiente de la ecuación de otra recta
 Resultado: 
         Devuelve una cadena indicando la posición relativa de las rectas (Iguales, Paralelas, Perpendiculares, Secantes)
 Descripción:
         Se dividen los coeficientes entre si para determinar la posición de las rectas:
                     a1/a2 = b1/b2  = c1/c2 --> Iguales
                     a1/a2 = b1/b2 != c1/c2 --> Paralelas
                     a1*a2 + b1*b2 = 0      --> Perpendiculares
                     a1/a2 != b1/b2         --> Secantes
 Funciones a las que llama: ninguna
|#

(define (posicion-rectas a1 b1 c1 a2 b2 c2)

  ;; Función auxiliar
  (define (cociente-coeficientes x y)
    (if (= y 0) +inf.0 ;; Si es división por 0, se devuelve infinito
        (/ x y)
    )
   )

  ;; Cuerpo función
  (let
      ;; Variables locales let
      (
       (cociente-a1/a2 (cociente-coeficientes a1 a2))
       (cociente-b1/b2 (cociente-coeficientes b1 b2))
       (cociente-c1/c2 (cociente-coeficientes c1 c2))
      )

    ;; Cuerpo de let
    (cond
      ((= cociente-a1/a2 cociente-b1/b2 cociente-c1/c2) "Iguales")
      ((and (= cociente-a1/a2 cociente-b1/b2) (not (= cociente-b1/b2 cociente-c1/c2))) "Paralelas")
      ((= 0 (+ (* a1 a2) (* b1 b2))) "Perpendiculares")
      ((not (= cociente-a1/a2 cociente-b1/b2)) "Secantes") 
     )
   )

  )

;; (posicion-rectas 4 4 4 2 2 2)
;; (posicion-rectas 4 4 4 2 2 5)
;; (posicion-rectas 1 0 0 0 1 0)
;; (posicion-rectas 1 0 0 5 1 0)





#| 
 Nombre: posicion-circunferencias
 Objetivo: Determinar la posición relativa de dos circunferencias
 Parámetro:
         x1: Coordenada x del centro de una circunferencia
         y1: Coordenada y del centro de una circunferencia
         x2: Coordenada x del centro de otra circunferencia
         y2: Coordenada y del centro de otra circunferencia
         r1: Radio de la circunferencia con el centro en las coordenadas (x1, y1)
         r2: Radio de la circunferencia con el centro en las coordenadas (x2, y2)
 Resultado: 
         Número que significa la posición relativa de las dos circunferencias
 Descripción:
         Se calcula la distancia a los centros usando la distancia euclidiana,
         y se compara con la suma/diferencia de los radios para determinar la posición relativa de las dos circunferencias:
                     Iguales              --> distancia-centros = 0 y r1-r2=0
                     Concentricas         --> distancia-centros = 0 [ y r1 != r2 ]
                     Tangentes por dentro --> distancia-centros = r1-r2
                     Tangentes por fuera  --> distancia-centros = r1+r2
                     Interiores           --> distancia-centros < abs(r1-r2)
                     Exteriores           --> distancia-centros > r1+r2
                     Secantes por dentro  --> distancia-centros < r1+r2 y distancia-centros > abs(r1-r2) y distancia-centros < max(r1, r2)
                     Secantes por fuera   --> distancia-centros < r1+r2 y distancia-centros > abs(r1-r2) [ y distancia-centros >[=] max(r1, r2) ]
 Funciones a las que llama: distancia-euclidiana
|#

(define (posicion-circunferencias x1 y1 x2 y2 r1 r2)

  ;; Variables locales
  (define distancia-centros (distancia-euclidiana x1 y1 x2 y2))
  (define suma-radios (+ r1 r2))
  (define diferencia-radios (abs (- r1 r2)))

  ;; Cuerpo función
  (cond
    ( (= 0 distancia-centros diferencia-radios) 1) ;; Iguales
    ( (= 0 distancia-centros) 2) ;; Concentricas
    ( (= distancia-centros diferencia-radios) 3) ;; Tangentes por dentro
    ( (= distancia-centros suma-radios) 4) ;; Tangentes por fuera
    ( (< distancia-centros diferencia-radios) 5) ;; Interiores
    ( (> distancia-centros suma-radios) 6) ;; Exteriores
    ( (and (< distancia-centros suma-radios) (> distancia-centros diferencia-radios) (< distancia-centros (max r1 r2))) 7) ;; Secantes por dentro
    ( (and (< distancia-centros suma-radios) (> distancia-centros diferencia-radios)) 8) ;; Secantes por fuera
   )
 )

;; (posicion-circunferencias 0 0 0 0 10 10)
;; (posicion-circunferencias -5 0 -5 0 10 20)
;; (posicion-circunferencias 0 0 0 5 5 10)
;; (posicion-circunferencias 0 0 0 15 5 10)
;; (posicion-circunferencias 0 0 2 2 6 10)
;; (posicion-circunferencias 0 0 0 6 3 2)
;; (posicion-circunferencias 0 0 0 4 5 2)
;; (posicion-circunferencias 0 0 0 6 5 2)




#| 
  Nombre: valor-punto
  Objetivo: Determinar que valor le corresponde a un punto según su posición
  Parámetro:
          x: Coordenada x del punto
          y: Coordenada y del punto
  Resultado: 
          Número que indica la posición del punto respecto a las figuras
  Descripción:
          Se calculan las distancias euclidiana, Manhattan y Chebyshev para obtener
          la posición del punto dado en las figuras.
  Funciones a las que llama: distancia-euclidiana distancia-manhattan distancia-chebyshev
|#

(define (valor-punto x y)

  ;; Cuerpo función
  (let
      ;; Variables locales let
      (
       (d2 (distancia-euclidiana 0 0 x y))
       (d1 (distancia-manhattan 1 0 x y))
       (dmax (distancia-chebyshev -1 0 x y))
      )
    ;; Cuerpo let
    (cond
      ((or (= d2 1) (= d1 1) (= dmax 1)) 1) ;; El punto pertenece a los lados de una de las figuras
      ((and (> d2 1) (< dmax 1)) 2) ;; El punto está dentro del cuadrado y fuera del círculo
      ((and (< d2 1) (< dmax 1)) 3) ;; El punto está dentro del cuadrado y del círculo 
      ((and (< d2 1) (> d1 1) (> dmax 1)) 4) ;; El punto está dentro del círculo y fuera del rombo y del cuadrado
      ((and (< d2 1) (< d1 1)) 5) ;; El punto está dentro del círculo y del rombo
      ((and (< d1 1) (> d2 1)) 6) ;; El punto está dentro del rombo y fuera del círculo
      (else 7) ;; Otro caso
      )
   )
 )

;; (valor-punto 0 1)
;; (valor-punto -1.5 0.5)
;; (valor-punto -0.5 0.5)
;; (valor-punto 0.5 0.8)
;; (valor-punto 0.5 0)
;; (valor-punto 1.5 0)
;; (valor-punto 4 0)





#| 
  Nombre: tipoTrianguloPorAngulos
  Objetivo: Clasificar los triángulos según sus ángulos
  Parámetro:
          x1: Coordenada x de un vértice (A) del triángulo
          y1: Coordenada y de un vértice (A) del triángulo
          x2: Coordenada x de un vértice (B) del triángulo
          y3: Coordenada y de un vértice (B) del triángulo
          x3: Coordenada x de un vértice (C) del triángulo
          y3: Coordenada y de un vértice (C) del triángulo
  Resultado: 
          Cadena indicando el tipo de triángulo (Recto, Acutángulo, Obtusángulo, Nulo)
  Descripción:
          Se calcula el ángulo entre los vectores que formados por los puntos del triángulo
          y se comparan los ángulos obtenidos para determinar el tipo de triángulo.
  Funciones a las que llama: vectores-angulo
|#



(define (tipoTrianguloPorAngulos x1 y1 x2 y2 x3 y3)

  ;; Variables locales
  (define angulo-1 (vectores-angulo x1 y1 x2 y2 x1 y1 x3 y3)) ;; Vector AB y AC
  (define angulo-2 (vectores-angulo x2 y2 x1 y1 x2 y2 x3 y3)) ;; Vector BA y BC
  (define angulo-3 (vectores-angulo x3 y3 x1 y1 x3 y3 x2 y2)) ;; Vector CA y CB

  (define pi (acos -1.0))

  ;; Función auxiliar
  ;; Comprueba si dos ángulos son iguales usando una cota de error
  (define (angulos-iguales? alpha beta cota)

    (< (abs (- alpha beta)) cota)
    )

    
  ;; Cuerpo función
  (cond
    ((or (angulos-iguales? angulo-1 (/ pi 2) 1e-6) (angulos-iguales? angulo-2 (/ pi 2) 1e-6) (angulos-iguales? angulo-3 (/ pi 2) 1e-6)) "Recto") ;; Si algún ángulo es de 90º
    ((and (< angulo-1 (/ pi 2)) (< angulo-2 (/ pi 2)) (< angulo-3 (/ pi 2))) "Acutangulo") ;; Todos los ángulos deben ser menores a 90º
    ((or (angulos-iguales? angulo-1 0 1e-6) (angulos-iguales? angulo-2 0 1e-6) (angulos-iguales? angulo-3 0 1e-6) (angulos-iguales? angulo-1 pi 1e-6) (angulos-iguales? angulo-2 pi 1e-6) (angulos-iguales? angulo-3 pi 1e-6)) "Nulo") ;; Si algún ángulo es de 0º o 180º
    ((and (or (> angulo-1 (/ pi 2)) (> angulo-2 (/ pi 2)) (> angulo-3 (/ pi 2))) (or (< angulo-1 pi) (< angulo-2 pi) (< angulo-3 pi))) "Obtusangulo") ;; Algún ángulo es menor que 180º y mayor que 90º
  )

 )

;; (tipoTrianguloPorAngulos 0 0 0 1 1 0)
;; (tipoTrianguloPorAngulos 0 0 0.6 0.2 0.4 -1)
;; (tipoTrianguloPorAngulos 0 0 0.6 0.4 0.4 -1)
;; (tipoTrianguloPorAngulos 0 0 -0.2 0.2 0.2 -0.2)




#| 
  Nombre: ladosParalelos?
  Objetivo: Determinar si dos rectas son paralelas
  Parámetro:
          x1: Coordenada x del P1
          y1: Coordenada y del P1
          x2: Coordenada x del P2
          y2: Coordenada y del P2
          x3: Coordenada x del P3
          y3: Coordenada y del P3
          x4: Coordenada x del P4
          y4: Coordenada y del P4
  Resultado: 
         Verdadero si las rectas son paralelas; falso en caso contrario
  Descripción:
        Se calcula el ángulo que forman los vectores directores de las rectas definidas por los puntos P1P2 y P3P4.
        Si el ángulo es 0º o 180º (pi radianes) las rectas son paralelas.
  Funciones a las que llama: vectores-angulo
|#

(define (ladosParalelos? x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Cuerpo función
  (let
      ;; Variables de let
      (
       (pi (acos -1.0))
       (angulo-vectores-directores (vectores-angulo x1 y1 x2 y2 x3 y3 x4 y4))
       )
      ;; Cuerpo de let
     (or (eq? angulo-vectores-directores 0) (= angulo-vectores-directores pi))
    ;; Usamos eq? para diferenciar si la función angulo-vectores devuelve 0.0 (vectores nulos) o 0 (paralelos)
     
  )
 )

;; (ladosParalelos? 0 0 5 0 0 0 10 0)   ;; Rectas coincidentes (vectores directores misma dirección y sentido)
;; (ladosParalelos? 0 0 5 0 0 0 -10 0)  ;; Rectas coincidentes (vectores directores misma dirección y distinto sentido)
;; (ladosParalelos? 0 0 5 0 0 -5 5 -5)  ;; Rectas paralelas (vectores directores misma dirección y sentido)
;; (ladosParalelos? 0 0 5 0 0 -5 -5 -5) ;; Rectas paralelas (vectores directores misma dirección y distinto sentido)
;; (ladosParalelos? 0 0 5 0 0 -5 0 -2)  ;; Perpendiculares
;; (ladosParalelos? 0 0 5 0 0 -5 2 -2)  ;; Secantes





#| 
  Nombre: perpendiculares?
  Objetivo: Determinar si dos recta son perpendiculares
  Parámetro:
          x1: Coordenada x del P1
          y1: Coordenada y del P1
          x2: Coordenada x del P2
          y2: Coordenada y del P2
          x3: Coordenada x del P3
          y3: Coordenada y del P3
          x4: Coordenada x del P4
          y4: Coordenada y del P4
  Resultado: 
          Verdadero si las rectas son perpendiculares y falso en caso contrario.
  Descripción:
          Se calcula el ángulo formado por los vectores directores de las rectas definidas por los puntos P1P2 y P3P4
          Si el ángulo es 90º (pi/2 radianes) las rectas con perpendiculares.
  Funciones a las que llama: vectores-angulo
|#

(define (perpendiculares? x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Variable local
  (define pi (acos -1.0))

  ;; Cuerpo función
  (= (vectores-angulo x1 y1 x2 y2 x3 y3 x4 y4) (/ pi 2))

  )

;; (perpendiculares? 0 0 5 0 0 -5 0 -2) ;; Perpendiculares
;; (perpendiculares? 0 0 5 0 0 -5 1 -2) ;; Secantes
;; (perpendiculares? 0 0 5 0 0 -5 5 -5) ;; Paralelas




#| 
  Nombre: area-trapecio
  Objetivo: Calcular el área de un trapecio
  Parámetro: 
          x1: Coordenada x del P1
          y1: Coordenada y del P1
          x2: Coordenada x del P2
          y2: Coordenada y del P2
          x3: Coordenada x del P3
          y3: Coordenada y del P3
          x4: Coordenada x del P4
          y4: Coordenada y del P4
  Resultado: 
          Valor del área del trapecio
  Descripción:
          Se determinan que puntos forman los lados paralelos del trapecio (base mayor y menor), y usando funciones
          se calcula la longitud de las bases (distancia euclidiana de los puntos) y la altura (distancia de un punto a la recta)
  Funciones a las que llama: ladosParalelos? areaTrapecioLetVertices
|#

(define (area-trapecio x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Cuerpo función
  (cond
    ((ladosParalelos? x1 y1 x2 y2 x3 y3 x4 y4) (areaTrapecioLetVertices x1 y1 x2 y2 x3 y3 x4 y4))
    ((ladosParalelos? x1 y1 x3 y3 x2 y2 x4 y4) (areaTrapecioLetVertices x1 y1 x3 y3 x2 y2 x4 y4))
    ((ladosParalelos? x1 y1 x4 y4 x2 y2 x3 y3) (areaTrapecioLetVertices x1 y1 x4 y4 x2 y2 x3 y3))
    (else (display "Coordenadas no válidas para formar un trapecio"))
  )

 )

;; (area-trapecio 0 0 2 2 4 2 6 0)
;; (area-trapecio 2 2 0 0 4 2 6 0)
;; (area-trapecio 6 0 4 2 2 2 0 0)
;; (area-trapecio 0 0 4 2 2 2 0 0) ;; Trapecio no válido




#| 
  Nombre: area-rombo
  Objetivo: Calcular el área de un rombo
  Parámetro: 
          x1: Coordenada x del P1
          y1: Coordenada y del P1
          x2: Coordenada x del P2
          y2: Coordenada y del P2
          x3: Coordenada x del P3
          y3: Coordenada y del P3
          x4: Coordenada x del P4
          y4: Coordenada y del P4
  Resultado: 
          Valor del área del rombo
  Descripción:
          Se determinan que puntos forman las diagonales del rombo, y usando funciones
          se calcula la longitud de las diagonales y el área.
  Funciones a las que llama: perpendiculares? areaRomboVerticesLet
|#

(define (area-rombo x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Cuerpo función
  (cond
    ((perpendiculares? x1 y1 x2 y2 x3 y3 x4 y4) (areaRomboVerticesLet x1 y1 x3 y3 x2 y2 x4 y4))
    ((perpendiculares? x1 y1 x3 y3 x2 y2 x4 y4) (areaRomboVerticesLet x1 y1 x2 y2 x3 y3 x4 y4))
    ((perpendiculares? x1 y1 x4 y4 x2 y2 x3 y3) (areaRomboVerticesLet x1 y1 x2 y2 x4 y4 x3 y3))
  )

 )

;; (area-rombo -1 0 0 2 1 0 0 -2)
;; (area-rombo 0 -2 1 0 0 2 -1 0)
;; (area-rombo -1 0 0 0 1 0 0 2) ;; Rombo no válido


#| 
  Nombre: cuadrilateros-convexos
  Objetivo: Determinar que tipo de cuadrilátero forman 4 puntos del plano
  Parámetro:
          x1: Coordenada x del P1
          y1: Coordenada y del P1
          x2: Coordenada x del P2
          y2: Coordenada y del P2
          x3: Coordenada x del P3
          y3: Coordenada y del P3
          x4: Coordenada x del P4
          y4: Coordenada y del P4
  Resultado: 
          Cadena con el tipo de cuadrilátero
  Descripción:
           Se calculan las longitudes de los lados (P1P2, P2P3 y P3P4) y los ángulos entre dichos lados.
           Se hacen distintas comparaciones para determinar que tipo de cuadrilátero se forma.
  Funciones a las que llama: distancia-euclidiana vectores-angulo ladosParalelos?
|#

(define (cuadrilateros-convexos x1 y1 x2 y2 x3 y3 x4 y4)

  ;; Cuerpo función
  (let
      ;; Variables locales let
      (
       (pi (acos -1.0))
       
       (lado1 (distancia-euclidiana x1 y1 x2 y2))
       (lado2 (distancia-euclidiana x2 y2 x3 y3))
       (lado3 (distancia-euclidiana x3 y3 x4 y4))
       (lado4 (distancia-euclidiana x4 y4 x1 y1))
       
       (angulo1 (vectores-angulo x1 y1 x2 y2 x2 y2 x3 y3))
       (angulo2 (vectores-angulo x2 y2 x3 y3 x3 y3 x4 y4))
       (angulo3 (vectores-angulo x3 y3 x4 y4 x4 y4 x1 y1))
       (angulo4 (vectores-angulo x4 y4 x1 y1 x1 y1 x2 y2))

       (paralelos-lado1-lado3? (ladosParalelos? x1 y1 x2 y2 x3 y3 x4 y4))
       (paralelos-lado2-lado4? (ladosParalelos? x2 y2 x3 y3 x4 y4 x1 y1))
      )
    
    ;; Cuerpo let
    (cond
      ((and (= lado1 lado2 lado3 lado4) (= angulo1 angulo2 angulo3 angulo4 (/ pi 2))) "Cuadrado")
      ((and (not (= lado1 lado2 lado3 lado4)) (= angulo1 angulo2 angulo3 angulo4 (/ pi 2))) "Rectangulo")
      ((and (= lado1 lado2 lado3 lado4) (= angulo1 angulo3) (= angulo2 angulo4)) "Rombo")
      ((and (= lado1 lado3) (= lado2 lado4) (= angulo1 angulo3) (= angulo2 angulo4)) "Romboide")
      ((and (or paralelos-lado1-lado3? paralelos-lado2-lado4?) (or (= angulo1 (/ pi 2)) (= angulo2 (/ pi 2)) (= angulo3 (/ pi 2)) (= angulo4 (/ pi 2)))) "Trapecio rectangular")
      ((and (or paralelos-lado1-lado3? paralelos-lado2-lado4?) (or (= lado1 lado2) (= lado1 lado3) (= lado1 lado4))) "Trapecio isósceles")
      ((and (or paralelos-lado1-lado3? paralelos-lado2-lado4?) (or (not (= lado1 lado2)) (not (= lado1 lado3))  (not (= lado1 lado4)))) "Trapecio escaleno")
      ((and (= lado1 lado2) (= lado3 lado4)) "Cometa")
      ((or (= lado1 lado2) (= lado3 lado4)) "Cometa oblicuo")
      ((not (= lado1 lado2 lado3 lado4)) "Trapezoide")
     )

   )
  
  )

;; (cuadrilateros-convexos 0 0 0 2 2 2 2 0)   ;; Cuadrado
;; (cuadrilateros-convexos 0 0 0 2 4 2 4 0)   ;; Rectangulo
;; (cuadrilateros-convexos 0 -2 -1 0 0 2 1 0) ;; Rombo
;; (cuadrilateros-convexos 0 0 2 3 7 3 5 0)   ;; Romboide
;; (cuadrilateros-convexos 0 0 0 4 4 2 4 0)   ;; Trapecio rectangular
;; (cuadrilateros-convexos 0 0 1 2 3 2 4 0)   ;; Trapecio isósceles
;; (cuadrilateros-convexos 0 0 1 2 2 2 4 0)   ;; Trapecio escaleno
;; (cuadrilateros-convexos -1 0 0 1 1 0 0 -2) ;; Cometa
;; (cuadrilateros-convexos -1 0 0 1 1 0 1 -1) ;;Cometa oblicuo
;; (cuadrilateros-convexos -2 0 0 2 1 0 1 -1) ;; Trapezoide
