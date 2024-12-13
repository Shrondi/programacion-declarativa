#| PRÁCTICA 4. PROGRAMACIÓN DECLARATIVA. CURSO 2023-2024
   Autor: Carlos Lucena Robles
 -------------------------------------------------------
|#

(require racket/vector)
(require racket/list)


;; FUNCIONES AUXILIARES
;; <---------------------------------------------------------------------->



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


;; <---------------------------------------------------------------------->




#| 
  Nombre: modulo-vector
  Objetivo: Calcular el modulo de un vector
  Parámetro: 
          v: Vector con las componentes
  Resultado: 
          Módulo del vector
  Descripción:
          Se itera sobre el vector calculando el cuadrado de cada componente y se
          calcula la raíz cuadrada de la suma total
  Funciones a las que llama: ninguna
|#

(define (modulo-vector v)

  ;; Cuerpo función
  (do
      ;; Variables locales
      (
       (n (vector-length v))
       (i 1 (+ i 1))
       (resultado (sqr (vector-ref v 0)) (+ resultado (sqr (vector-ref v i))))
      )
    ;; Condición de salida
    ((= i n) (sqrt resultado))
    )
)

;; (modulo-vector #(1 0 2))
;; (modulo-vector #(1 0 2 0 3))
;; (modulo-vector #(1))





#| 
  Nombre: media-aritmetica
  Objetivo: Calcular la media aritmetica
  Parámetro:
          v: Vector con las componentes
  Resultado: 
          Media aritmética de las componentes
  Descripción:
          Iterativamente, se recorre el vector sumando las componentes y el resultado se divide entre la longitud del vector. 
  Funciones a las que llama: ninguna
|#

(define (media-aritmetica v)

  ;; Cuerpo función
  (do
      ;; Variables locales
      (
       (n (vector-length v))
       (i 1 (+ i 1))
       (suma (vector-ref v 0) (+ suma (vector-ref v i)))
      )
    ;; Condición de salida
    ((= i n) (/ (/ suma n) 1.0)) ;; Se divide entre 1.0 para no obtener fracciones mixtas
    )
)

;; (media-aritmetica #(1. 2. 3.))
;; (media-aritmetica #(1. 2. 3. 4. 5.))
;; (media-aritmetica #(1 2 3 4 5 6))




#| 
  Nombre: extraer-columna 
  Objetivo: Extraer una columna de una matriz
  Parámetro:
          m: Matriz bidimensional (vector con subvectores)
          c: Columna a extraer
  Resultado: 
          Vector con la columna de la matriz
  Descripción:
           Se itera sobre la matriz fila por fila formando un vector con el elemento de la columna dada
  Funciones a las que llama: ninguna
|#


(define (extraer-columna m c)

  ;; Cuerpo función
  (do
      ;; Variables locales
      (
       (n (vector-length m))
       (i 0 (+ i 1))
       (resultado (vector)  (vector-append resultado (vector (vector-ref (vector-ref m i) c))))
      )
     ;; Condición de salida y sentencia asociada
     ((= i n) resultado)
    
    )
  )

;; (extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)) 0)
;; (extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)) 1)
;; (extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)) 2)
;; (extraer-columna #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)) 3)




#| 
  Nombre: maxiMin
  Objetivo: Obtener el máximo de los valores mínimos de las columnas de una matriz
  Parámetro:
          m: Matriz bidimensional (vector con subvectores)
  Resultado: 
          El máximo valor de los valores mínimos de las columnas de la matriz dada
  Descripción:
          Iterativamente, se extrae cada columna de la matriz para calcular su mínimo y se comprueba si ese valor es el máximo
  Funciones a las que llama: extraer-columna
|#

(define (maxiMin m)

  ;; Función auxiliar
  (define (minimo-vector v)
  (do
      ;; Variables locales del bucle
      (
       (n  (vector-length v))
       (i  1                     (+ i 1))
       (minimo (vector-ref v 0)  (if (> minimo (vector-ref v i))
                                     (vector-ref v i)
                                     minimo))
       )
    ;; Condición de salida y sentencias asociadas
      ((= i n) minimo)
    )
  )

  ;; Cuerpo función
  (do
      ;; Variables locales del bucle
     (
       (n (vector-length (vector-ref m 0)))
       (i 1 (+ i 1))
       (columna (extraer-columna m 0) (extraer-columna m i))
       (maximo  (vector-ref (vector-ref m 0) 0)   (if (< maximo (minimo-vector columna))
                                                             (minimo-vector columna)
                                                             maximo)
          )
      )
    ;; Condición de salida y sentencias asociadas
    ((= i n) maximo)
    )
  )

;; (maxiMin #(#(1. 2. 3. 2.) #(4. 5. 6. 4.) #(7. 8. 9. 7.)))




#| 
  Nombre: determinante
  Objetivo: Calcular el determinante de una matriz de 3x3
  Parámetro:
          m: Matriz de dimensión de 3x3
  Resultado: 
         Valor del determinante de la matriz
  Descripción:
         Se aplica la regla de Sarrus, sumando la multiplicación los valores de cada diagonal
  Funciones a las que llama: ninguna
|#

(define (determinante m)

  ;; Cuerpo función
  (do
      ;; Variables locales del bucle
      (
      (i 0 (+ i 1))
      (diagonales-principales 0.0 (+ diagonales-principales
                                   (*
                                    (vector-ref (vector-ref m 0) i)
                                    (vector-ref (vector-ref m 1) (modulo (+ i 1) 3))
                                    (vector-ref (vector-ref m 2) (modulo (+ i 2) 3))
                                    )
                                  )
                              )
      (diagonales-secundarias 0.0 (+ diagonales-secundarias
                                   (*
                                    (vector-ref (vector-ref m 2) i)
                                    (vector-ref (vector-ref m 1) (modulo (+ i 1) 3))
                                    (vector-ref (vector-ref m 0) (modulo (+ i 2) 3))
                                    )
                                  )
                              )
      )
    ;; Condición de salida y sentencia asociada
    ((= i 3) (- diagonales-principales diagonales-secundarias))
   )
   
  )

;; (determinante #(#(1. 2. 3.) #(4. 5. 6.) #(7. 8. 9.)))
;; (determinante #(#(2 -1 3) #(0 4 -2) #(1 5 2)))
;; (determinante #(#(4 -2 7) #(1 5 -3) #(0 2 8)))





#| 
  Nombre: area-triangulo
  Objetivo: Calcular el area de un triangulo
  Parámetro:
          x1: Coordenada x del punto 1
          y1: Coordenada y del punto 1
          x2: Coordenada x del punto 2
          y2: Coordenada y del punto 2
          x3: Coordenada x del punto 3
          y3: Coordenada y del punto 3
  Resultado: 
          Valor del área del triángulo
  Descripción:
          Se aplica la fórmula:
                 abs( 1/2 * |x1 y1 1, x2 y2 1, x3 y3 1| )
  Funciones a las que llama: determinante
|#

(define (area-triangulo x1 y1 x2 y2 x3 y3)

  ;; Cuerpo función
  (abs (* (/ 1 2.0)
          (determinante (vector (vector x1 y1 1)
                                (vector x2 y2 1)
                                (vector x3 y3 1)
                                )
                        )
          )
       )

  )

;; (area-triangulo 0 1 -1 0 1 0)
;; (area-triangulo 0 2 -1 0 1 0)
;; (area-triangulo 0 -2 -1 0 1 0)




#| 
  Nombre: primosMenores
  Objetivo: Generar una lista con los números primos menores o iguales al número dado
  Parámetro:
          n: Número natural
  Resultado: 
          Lista con los números primos menores o iguales que el número dado como argumento
  Descripción:
          Se guardan en una lista los números que sean primos desde 2 hasta n usando el predicado primoIterativo?
  Funciones a las que llama: primoIterativo?
|#

(define (primosMenores n)

  ;; Cuerpo función
  (do
      ;; Variables locales del bucle
      (
      (i 2 (+ i 1))
      (lista '() (if (primoIterativo? i) (append lista (list i)) lista))
      )
    ;; Condición salida y sentencia asociada
    ((> i n) lista)
    )
  )


(define (primosMenores-otraForma n)
  (flatten
   (build-list (+ n 1) (lambda (i) (if (primoIterativo? i) i '())
                    )
               )
   )
  )


;; (primosMenores 9)
;; (primosMenores 11)
;; (primosMenores-otraForma 9)
;; (primosMenores-otraForma 11)





#| 
  Nombre: descomposicionEnPrimos
  Objetivo: Descomponer un número natural en sus factores primos
  Parámetro:
          n: Número natural
  Resultado: 
          Lista con los números primos
  Descripción:
           Iterativamente, se va calculando la division de n/i, si el resto es 0 se guarda en una lista y se vuelve a dividir,
           en caso contrario, se incrementa i, hasta que el resto de la división valga 1
  Funciones a las que llama: ninguna
|#

(define (descomposicionEnPrimos n)

  ;; Cuerpo función
  (do
      ;; Variables locales bucle
      (
      (i 2 (if (zero? (modulo resto i)) i (+ i 1))) ;; Se incrementa i si no es divisible
      (resto n (if (zero? (modulo resto i)) (/ resto i) resto))
      (lista '() (if (zero? (modulo resto i)) (cons i lista) lista))
      )
    ;; Condición de salida y sentencia asociada
    ((= resto 1) lista))
  )




;; (descomposicionEnPrimos 2)
;; (descomposicionEnPrimos 12)
;; (descomposicionEnPrimos 60)





#| 
  Nombre: filtrarListaPrimos
  Objetivo: Devolver los números primos de la lista dada
  Parámetro:
          lista: Lista de números naturales
  Resultado: 
          Lista con los números primos
  Descripción:
          Recursivamente, se comprueba si el primer elemento de la lista es primo se mantiene,
          en caso contrario, se procesa el resto de la lista
  Funciones a las que llama: primoIterativo?
|#

(define (filtrarListaPrimos lista)
  
  ;; Cuerpo función
  (cond
    ;
    ((not (list? lista)) '()) ;; Se comprueba si es una lista
    
    ((null? lista) '()) ;; Se comprueba si es la lista vacía
    ;; se inserta el primer elemento en la lista generada por el resto de la lista
    (else (if (primoIterativo? (car lista))
              (cons (car lista) (filtrarListaPrimos (cdr lista)))
              (filtrarListaPrimos (cdr lista))
          ) 
    )                                    
  )
 )


;; (filtrarListaPrimos '())
;; (filtrarListaPrimos '(2 3 4 5 6))
;; (filtrarListaPrimos '(2 3 4 5 6 7 8 9 10))




#| 
  Nombre: filtrarPrimos
  Objetivo: Devolver una lista compuesta por los números primos
  Parámetro:
          [n1...nn]: Cero o más números naturales
  Resultado: 
          Lista con los números primos de los números dados
  Descripción:
          Se define una función que acepta parámetros opcionales,
          y se procesa la lista a través de la función filtrarListaPrimos
  Funciones a las que llama: filtrarListaPrimos
|#

(define filtrarPrimos
  (lambda lista
    ;; Cuerpo función
    (filtrarListaPrimos lista)
   )
 )

;; (filtrarPrimos)
;; (filtrarPrimos 2 3 4 5 6)
;; (filtrarPrimos 2 3 4 5 6 7 8 9 10 11 12)




#| 
  Nombre: filtrarPrimosDelimitados
  Objetivo: Devolver una lista con los números primos delimitados
  Parámetro:
          inicial: Número natural
          final: Número natural
          [n...nn]: Cero o más números naturales
  Resultado: 
         Lista de primos en el intervalo dado
  Descripción:
         Recursivamente, se inserta en la lista si el elemento es primo,
         en caso contrario, no se incluye.
         En ambos casos se hace una llamada recursiva a la función con el resto de la lista como argumento.
  Funciones a las que llama: ninguna
|#

(define (filtrarPrimosDelimitados inicial final . lista)

  ;; Función auxiliar recursiva
  (define (auxiliar inicial final lista)
    (cond
      ((not (list? lista)) '()) ;; Se comprueba si es una lista
      ((null? lista) '()) ;; Se comprueba si es la lista vacía
      ;; Se inserta el primer elemento en la lista generada por el resto de la lista
      ;; si está dentro del intervalo [inicial, final] y es primo
      (else (if (and (>= (car lista) inicial) (<= (car lista) final) (primoIterativo? (car lista)))
                ;; Consecuente
                (cons (car lista) (auxiliar inicial final (cdr lista)))
                ;; Alternativa
                (auxiliar inicial final (cdr lista))
             ) 
       )                                    
     )
   )
    ;; Cuerpo función
    (auxiliar inicial final lista) ;; Llamada recursiva
)

;; (filtrarPrimosDelimitados 2 10)
;; (filtrarPrimosDelimitados 2 10 3 4 5 6)
;; (filtrarPrimosDelimitados 2 10 3 4 5 6 7 8 9 10 11 12)
;; (filtrarPrimosDelimitados 10 2 3 4 5 6 7 8 9 10 11 12)




#| 
  Nombre: separar
  Objetivo: Separar una lista en dos sublistas
  Parámetro:
          lista: Lista con números
  Resultado: 
          Lista con dos sublistas
  Descripción:
          Recursivamente, se forma una lista con dos sublistas formando:
              - Un primer par con el car y con el car del cddr de la lista
              - Un segundo par con el cadr y con el cadr del cddr de la lista
  Funciones a las que llama: ninguna
|#

(define (separar lista)
  ;; Cuerpo función
  (cond
    ((null? lista) (list '() '())) ;; Caso base: Si la lista esta vacía
    ((null? (cdr lista)) (list (list (car lista)) '())) ;; Caso base: Si solo hay un número
    (else
      (list
        (cons (car lista)  (car (separar (cddr lista))))
        (cons (cadr lista) (cadr (separar (cddr lista))))
       )
     )
   )
 )

;; (separar '())
;; (separar '(2))
;; (separar '(3 2))
;; (separar '(1 3 2))
;; (separar '(4 1 3 2))
;; (separar '(5 4 1 3 2))




#| 
  Nombre: unir
  Objetivo: Formar una lista nueva a partir de dos sublistas
  Parámetro:
          lista1: Sublista de números ordenada primera
          lista2: Sublista de números ordenada segunda
  Resultado: 
         Lista ordenada formada a partir de la unión de las dos listas
  Descripción:
         Recursivamente, se comparan los dos primeros valores de las listas,
        y el elemento menor irá al principio de la lista y se vuelve a hacer una llamada recursiva invirtiendo las listas.
  Funciones a las que llama: ninguna
|#

(define (unir lista1 lista2)
  ;; Cuerpo función
  (cond
    ((and (null? lista1) (null? lista2)) '()) ;; Caso base: Si las sublistas estan vacías
    ((null? lista2) lista1) ;; Caso base: La segunda sublista está vacía
    ((null? lista1) lista2) ;; Casi base: La primera lista está vacía
    ((< (car lista1) (car lista2)) (cons (car lista1) (unir (cdr lista1) lista2))) ;; El elemento de la lista 1 es el menor
    (else ;; Los dos elementos son iguales o el primer elemento de la segunda lista es mayor
     (cons (car lista2) (unir lista1 (cdr lista2)))
    )
  )
 )

;; (unir '() '())
;; (unir '(1) '())
;; (unir '(1) '(2))
;; (unir '(1 3) '(2))
;; (unir '(1 3) '(2 4 5))
;; (unir '(1 3 5) '(2 4))
;; (unir '() '(1 2 3 4 5))





#| 
  Nombre: mergeSort
  Objetivo: Aplicar el método merge sort
  Parámetro:
          lista: Lista con números
  Resultado: 
          Lista ordenada
  Descripción:
           Se hacen dos llamadas recursivas dividiendo las listas en cada llamada.
           Finalmente, se van uniendo las sublistas de forma ordenada
  Funciones a las que llama: ninguna
|#

(define (mergeSort lista)
  ;; Cuerpo función
  (cond
    ((null? lista) lista) ;; Caso base: La lista esta vacía
    ((null? (cdr lista)) lista) ;; Caso base: El final de la lista esta vacía
    (else
    (unir (mergeSort (car (separar lista)))
          (mergeSort (cadr (separar lista)))
          )
    )
   )
 )

;; (mergeSort '())
;; (mergeSort '(2))
;; (mergeSort '(1 3 2))
;; (mergeSort '(5 4 1 3 2))




#| 
  Nombre: mergeSortDatos
  Objetivo: Ordenar números pasados como argumentos
  Parámetro:
          [n..nn]: Cero o más números
  Resultado: 
          Lista ordenada
  Descripción:
          Los argumentos son recogidos por una lista para que sea procesada por la función mergeSort
  Funciones a las que llama: mergeSort
|#

(define mergeSortDatos
  (lambda lista
    ;; Cuerpo función
    (mergeSort lista)
   )
 )


;; (mergeSortDatos)
;; (mergeSortDatos 2)
;; (mergeSortDatos 1 3 2)
;; (mergeSortDatos 5 4 1 3 2)