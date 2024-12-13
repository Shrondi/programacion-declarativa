#| PRÁCTICA 3. PROGRAMACIÓN DECLARATIVA. CURSO 2023-2024
   Autor: Carlos Lucena Robles
 -------------------------------------------------------
|#



;; FUNCIONES AUXILIARES
;; <---------------------------------------------------------------------->

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


#| 
  Nombre: factorial
  Objetivo: Calcular el factorial de un numero
  Parámetro:
           n: Número natural
  Resultado: 
          Factorial del número
  Descripción:
          Se calcula iterativamente el factorial del número
  Funciones a las que llama: ninguna
|#
(define (factorial n)
 (if (or (= n 0) (= n 1)) 1
       (do
           ;; Variables del bucle
           (
            (i n (- i 1))
            (resultado 1 (* resultado i))
            )
         ;; Condición y sentencia de salida
         ((= i 1) resultado)
         ;; no hay cuerpo del bucle
         )
       )
  )
;; <---------------------------------------------------------------------->



#| 
  Nombre: conjentura-collatz-iterativa 
  Objetivo: Mostrar la sucesión numérica de la conjetura de Collatz para un número n
  Parámetro:
           n: Número entero positivo
  Resultado:
           Números de la sucesión de la conjetura  
  Descripción:
           Aplicando un método iterativo, se calcula el siguiente término comprobando
           si el número es par para calcular n/2 y si es impar 3n +1.
           La sucesión termina cuando llegue a 1
  Funciones a las que llama: ninguna
|#

(define (conjetura-collatz-iterativa n)

  ;; Función auxiliar
  (define (f x)
    (if (even? x) (/ x 2)
        (+ (* 3 x) 1))
   )

  ;; Cuerpo de la funcion
  (do
      ;; Variables del bucle
     (
      (resultado n (f resultado))
     )
    ;; Condición de salidad y sentencias asociadas
    ((= resultado 1) (display resultado) (newline))

    ;; Cuerpo del bucle
    (display resultado)
    (newline)
   )
  
  (newline)
  
  )


;; (conjetura-collatz-iterativa 5)
;; (conjetura-collatz-iterativa 6)
;; (conjetura-collatz-iterativa 13)




#| 
  Nombre: conjetura-collatz-recursiva 
  Objetivo: Mostrar la sucesión numérica de la conjetura de Collatz para un número n
  Parámetro:
           n: Número entero positivo
  Resultado:
           Números de la sucesión de la conjetura  
  Descripción:
           Aplicando un método recursivo, se calcula el siguiente término comprobando
           si el número es par para calcular n/2 y si es impar 3n +1.
           La sucesión termina cuando llegue a 1
  Funciones a las que llama: ninguna
|#

(define (conjetura-collatz-recursiva n)

  ;; Función auxiliar
  (define (f x)
    (if (even? x) (/ x 2)
        (+ (* 3 x) 1))
   )

   ;; Cuerpo de la funcion
   (display n) (newline)
    
   (if (not (= n 1)) ;; Caso base
       (conjetura-collatz-recursiva (f n)))
 )



;; (conjetura-collatz-recursiva 5) (newline)
;; (conjetura-collatz-recursiva 6) (newline)
;; (conjetura-collatz-recursiva 13) (newline)




#| 
  Nombre: primoIterativo?
  Objetivo: Comprobar si un número es primo o no
  Parámetro:
           n: Número natural
  Resultado: 
          #t si es primo; #f en caso contrario
  Descripción:
          Usando un método iterativo, se va calculando el resto de la división de n/i,
          siendo i los números naturales comprendidos entre 2 y la raíz cuadrada del número.
  Funciones a las que llama: ninguna
|#

(define (primoIterativo? n)

  (if (<= n 1) #f
  (do
      ;; Variables del bucle
      (
       (raiz-cuadrada (sqrt n))
       (i 2 (+ i 1))
       (divisible? #t (if (= (remainder n i) 0) #f #t))
       )
    ;; Condición de salida y sentencias asociadas
    ((or (> i raiz-cuadrada) (not divisible?)) divisible?)
  ))
 )

;; (primoIterativo? 2)
;; (primoIterativo? 100)
;; (primoIterativo? 4)
;; (primoIterativo? 13)




#| 
  Nombre: primoRecursivo?
  Objetivo: Comprobar si un número es primo o no
  Parámetro:
           n: Número natural
  Resultado: 
          #t si es primo; #f en caso contrario
  Descripción:
          Usando una función auxiliar recursiva, se va calculando el resto de la división de n/i,
          siendo i los números naturales comprendidos entre 2 y la raíz cuadrada del número.
  Funciones a las que llama: ninguna
|#

(define (primoRecursivo? n)

  ;; Función auxiliar
  (define (primoRecursivo-aux? n divisor)
     (cond
       ((<= n 1) #f) ;; Los números 0 y 1 no son primos
       ((= divisor 1) #t) ;; Caso base (el número es primo)
       ((= (remainder n divisor) 0) #f) ;; Caso base (no es primo)
       (else (primoRecursivo-aux? n (- divisor 1)))
    )
   )

  ;; Cuerpo función
  ;; Llamada a una función auxiliar recursiva
  (primoRecursivo-aux? n (truncate (sqrt n)))

 )


;; (primoRecursivo? 2)
;; (primoRecursivo? 100)
;; (primoRecursivo? 4)
;; (primoRecursivo? 13)




#| 
  Nombre: polinomio-euler
  Objetivo: Generar números primos usando el polinomio de Euler
  Parámetro:
          n: Número afortunado de Euler
  Resultado:
          Secuencia de números primos desde 1 hasta n-1
  Descripción:
           Usando un método iterativo, se calcula el número primo generado por el polinomio de Euler k^2 - k + n
           donde 1 <= k < n, siendo n un número afortunado de Euler
  Funciones a las que llama: ninguna
|#

(define (polinomio-euler n)

  ;; Cuerpo función
  (if (or (= n 2) (= n 3) (= n 5) (= n 11) (= n 17) (= n 41))
     ;; Consecuente
     (do
         ;; Variables del bucle
         (
          (k 2 (+ k 1))
          (primo n (+ (- (* k k) k) n))
          )
       ;; Condición de salida y sentencias asociadas
       ((> k n) (newline))
       
       ;; Cuerpo del bucle
       (display primo) (newline)
      )
     
     ;; Alternativa
     (display "No es un número afortunado de Euler")
     
     )
 )

;; (polinomio-euler 2)
;; (polinomio-euler 3)
;; (polinomio-euler 5)
;; (polinomio-euler 11)
;; (polinomio-euler 17)
;; (polinomio-euler 41)
;; (polinomio-euler 7)




#| 
  Nombre: terminoNumeroE
  Objetivo: Calcular el término n-ésimo
  Parámetro:
          n: Término n-ésimo de la sucesión
  Resultado: 
          Término n-ésimo de la sucesión (1 + 1/n)^n
  Descripción:
          Se calcula el término de la sucesión (1 + 1/n)^n
  Funciones a las que llama: ninguna
|#

(define (terminoNumeroE n)

  ;; Cuerpo función
  (if (= n 0.0) 0.0
  (expt (+ 1 (/ 1.0 n)) n))

  )

;; (terminoNumeroE 50)
;; (terminoNumeroE 100)
;; (terminoNumeroE 100000)




#| 
  Nombre: limiteSucesionNumeroE
  Objetivo: Calcular el límite de la sucesión que converge al número e 
  Parámetro:
          cota: Cota de error
  Resultado: 
          Número al que converge la sucesión con la cota dada
  Descripción:
          Se calcula iterativamente el término (1 + 1/n)^n hasta que la diferencia
          de los términos sea menor que la cota pasada como argumento
  Funciones a las que llama: terminoNumeroE
|#

(define (limiteSucesionNumeroE cota)

  ;; Cuerpo función
  (do
      ;; Variables bucle
      (
       (i 3.0 (+ i 1))
       (valorActual (terminoNumeroE 2) (terminoNumeroE i))
       (valorAnterior (terminoNumeroE 1) valorActual)
       (diferencia-terminos 0.25 (abs (- valorActual valorAnterior)))
       )
    ;; Condición de salida y sentencias asociadas
    ((< diferencia-terminos cota) valorActual)
   )
 )

;; (limiteSucesionNumeroE 1)
;; (limiteSucesionNumeroE 0.001)
;; (limiteSucesionNumeroE 0.0001)
;; (limiteSucesionNumeroE 0.000000000001)




#| 
  Nombre: sumaAureo-recursiva
  Objetivo: Calcular el número áureo mediante sumas infinitas
  Parámetro:
          n: Número de sumandos
  Resultado: 
          Aproximación del número áureo
  Descripción:
          De forma recursiva, se calcula el número áureo con sumas de raíces anidadas sqrt(1 + (sqrt 1 + ...))
  Funciones a las que llama: ninguna
|#

(define (sumaAureo-recursiva n)

  ;; Cuerpo función
  (cond
    ;; Casos base
    ((= n 0) 0)
    ((= n 1) 1)
    (else
      (sqrt
       (+ 1 (sumaAureo-recursiva (- n 1)))
       ))
    )

  )

;; (sumaAureo-recursiva 0)
;; (sumaAureo-recursiva 1)
;; (sumaAureo-recursiva 2)
;; (sumaAureo-recursiva 10)
;; (sumaAureo-recursiva 100)




#| 
  Nombre: sumaAureo-iterativa
  Objetivo: Calcular el número áureo mediante sumas infinitas
  Parámetro:
          n: Número de sumandos
  Resultado: 
          Aproximación del número áureo
  Descripción:
          De forma iterativa, se calcula el número áureo con sumas de raíces anidadas sqrt(1 + (sqrt 1 + ...))
  Funciones a las que llama: ninguna
|#

(define (sumaAureo-iterativa n)

  ;; Cuerpo función
  (do
     ;; Variables bucle
     (
     (i 0 (+ i 1))
     (suma 0.0 (sqrt (+ 1 suma)))
     )
    ;; Condición de salida y sentencias asociadas
    ((= i n) suma)
  )
 )

;; (sumaAureo-iterativa 0)
;; (sumaAureo-iterativa 1)
;; (sumaAureo-iterativa 2)
;; (sumaAureo-iterativa 10)
;; (sumaAureo-iterativa 100)





#| 
  Nombre: fraccion-continua-iterativa
  Objetivo: Calcular una fracción continua hasta el término k
  Parámetro:
          N: Función que calcula el valor de Nk
          D: Función que calcula el valor de Dk
          k: Número de términos de la fracción continua
  Resultado: 
          Calculo de la fracción continua
  Descripción:
          Iterativamente, se empieza desde el final de la fracción y se acumula
          el resultado en cada iteración de Ni/(Di+ resultado)
  Funciones a las que llama: ninguna
|#

(define (fraccion-continua-iterativa N D k)

  ;; Cuerpo función
  (do
     ;; Variables bucle
     (
     (i k (- i 1))
     (resultado 0.0 (/ (N i) (+ resultado (D i))))
     )
    ;; Condición de salida y sentencias asociadas
    ((< i 0) resultado)
  )
)

;; (fraccion-continua-iterativa (lambda (i) 1.0) (lambda (i) 1.0) 10)
;; (fraccion-continua-iterativa (lambda (i) 1.0) (lambda (i) 1.0) 100)
;; (fraccion-continua-iterativa (lambda (i) 1.0) (lambda (i) 1.0) 1000)





#| 
  Nombre: fraccion-continua-recursiva
  Objetivo: Calcular una fracción continua hasta el término k
  Parámetro:
          N: Función que calcula el valor de Nk
          D: Función que calcula el valor de Dk
          k: Número de términos de la fracción continua
  Resultado: 
          Calculo de la fracción continua
  Descripción:
          Recursivamente, se empieza desde el principio de la fracción y se calcula
 recursivamente el siguiente término Ni/(Di+ resultado)
  Funciones a las que llama: ninguna
|#

(define (fraccion-continua-recursiva N D k)

  ;; Función recursiva auxiliar
  (define (func-auxiliar i)
    (if (> i k) 0 ;; Caso base
        (/ (N i) (+ (func-auxiliar (+ i 1)) (D i)))
     )
    )

  ;; Cuerpo función
  (func-auxiliar 1) ;; Llamada a función recursiva
 )

;; (fraccion-continua-recursiva (lambda (i) 1.0) (lambda (i) 1.0) 10)
;; (fraccion-continua-recursiva (lambda (i) 1.0) (lambda (i) 1.0) 100)
;; (fraccion-continua-recursiva (lambda (i) 1.0) (lambda (i) 1.0) 1000)




#| 
  Nombre: limiteIterativa
  Objetivo: Calcular la aproximación al límite de cualquier sucesión numérica convergente
  Parámetro:
            funcion-termino: Función que representa el término general de la sucesión
            cota: Error entre dos elementos consecutivos de la serie
  Resultado: 
           Aproximación de la convergencia de la sucesión 
  Descripción:
           Con un método iterativo, se calcula el término n-ésimo de la serie hasta
           que la diferencia entre el término actual y el anterior sea inferior a la cota dada.
  Funciones a las que llama: ninguna
|#

(define (limiteIterativa funcion-termino cota)

  ;; Cuerpo función
  (do
      ;; Variables bucle
      (
       (i 3.0 (+ i 1))
       (valorActual (funcion-termino 2) (funcion-termino i))
       (valorAnterior (funcion-termino 1) valorActual)
       (diferencia-terminos (abs (- (funcion-termino 2) (funcion-termino 1))) (abs (- valorActual valorAnterior)))
       )
    ;; Condición de salida y sentencias asociadas
    ((< diferencia-terminos cota) valorActual)
   )
 )

;; (limiteIterativa (lambda (n) (expt (+ 1 (/ 1.0 n)) n)) 0.001)
;; (limiteIterativa terminoNumeroE 0.001)
;; (limiteIterativa convergencia-aureo 0.000001)




#| 
  Nombre: integral-trapecios 
  Objetivo: Calcular la integral definida usando el método de los trapecios
  Parámetro:
           f: Función positiva en el intervalo [a, b]
           a: Extremo inicial del intervalo
           b: Extremo final del intervalo
           n: Número de subintervalos
  Resultado: 
           Área bajo la curva en el intervalo dado
  Descripción:
           Aplicando un método iterativo, se calcula la suma de la serie
           ((f(x_i + f(x_i-1))/2) * h
  Funciones a las que llama: ninguna
|#

(define (integral-trapecios f a b n)

  ;; Cuerpo función
  (do
      ;; Variables bucle
      (
       (h (/ (- b a) n))
       (i 1 (+ i 1))
       (x a (+ a (* i h)))
       (resultado 0.0 (+ resultado (f x)))
      )
    ;; Condición de salida y sentencias asociadas
    ((> i n) (* resultado h))
   )
  )

;; (integral-trapecios (lambda (x) (/ 1 x)) 1 2 50)




#| 
  Nombre: suma-series-iterativo
  Objetivo: Calcular la suma de cualquier serie numérica no paramétrica convergente
  Parámetro:
          inicial: Índice del primer término
          cota: Cota de error
          termino: Función del término general de la serie
          siguiente: Función para pasar al siguiente término de la serie
  Resultado: 
         Número al que converge la serie
  Descripción:
         Iterativamente, se calcula cada término de la serie y se suman hasta que
         un término sea menor que la cota dada
  Funciones a las que llama: ninguna
|#

(define (suma-series-iterativo inicial cota termino siguiente)

  ;; Cuerpo función
  (do
      ;; Variables bucle
      (
       (i (siguiente inicial) (siguiente i))
       (termino-actual (termino inicial)  (termino i)) 
       (resultado 0 (+ resultado termino-actual))
       )
    ;; Condición de salida y sentencias asociadas
    ((< (abs termino-actual) cota) resultado)
   )
  )


;; (suma-series-iterativo 0 0.000000001 (lambda (n) (/ 1.0 (factorial n))) (lambda (n) (+ n 1)))





#| 
  Nombre: suma-series-recursivo
  Objetivo: Calcular la suma de cualquier serie numérica no paramétrica convergente
  Parámetro:
          inicial: Índice del primer término
          cota: Cota de error
          termino: Función del término general de la serie
          siguiente: Función para pasar al siguiente término de la serie
  Resultado: 
         Número al que converge la serie
  Descripción:
         Recursivamente, se calcula cada término de la serie y se suman hasta que
         un término sea menor que la cota dada
  Funciones a las que llama: ninguna
|#

(define (suma-series-recursivo inicial cota termino siguiente)

  ;; Variable local
  (define termino-actual (termino inicial))

  ;; Cuerpo función
  (if (< (abs termino-actual) cota) 0 ;; Caso base
      (+
       termino-actual
       ;; Llamada recursiva
       (suma-series-recursivo (siguiente inicial) cota termino siguiente)
       ) 
    )
 )


;; (suma-series-recursivo 0 0.000000001 (lambda (n) (/ 1.0 (factorial n))) (lambda (n) (+ n 1)))




#| 
  Nombre: suavizar
  Objetivo: Calcular la función suavizada
  Parámetro:
          f: Función a suavizar
          dx: Cantidad positiva
  Resultado: 
          Función suavizada 
  Descripción:
          Se calcula la función suavizada
  Funciones a las que llama: ninguna
|#

(define (suavizar f dx)

  ;; Cuerpo función
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
 )

;; ((suavizar sqrt 0.001) 2)