#| PRÁCTICA 5. PROGRAMACIÓN DECLARATIVA. CURSO 2023-2024
   Autor: Carlos Lucena Robles
 -------------------------------------------------------
|#



;; FUNCIONES AUXILIARES
;; <---------------------------------------------------------------------->

(define (leer-teclado mensaje)
    (display mensaje)
    (display " --> ")
    (read)
    )


(define (leer-teclado-cadena mensaje)
    (display mensaje)
    (display " --> ")
    
    ;; Elimina el carácter de salto de línea #\newline, si existe
    (if (char=? (peek-char) #\newline)
        (read-char)
    )
    
    ;; Lee los caracteres hasta que encuentra el carácter de salto de línea #\newline
    (do
        (
         (cadena   (make-string 0)  (string-append cadena (string caracter)))
         (caracter (read-char)      (read-char))
         )
      ;;
      ((char=? #\newline caracter) 
        ;; devuelve la cadena leída 
          cadena
         )
      ;;
      )
    )




(define (poner-comillas texto)
    (string-append (string #\") texto (string #\"))
    )

;; <---------------------------------------------------------------------->





;; TIPO DATO ABSTRACTO: CONCEJAL
;; <---------------------------------------------------------------------->

#| 
  Nombre: crear-concejal
  Objetivo: Abstracción del tipo de dato "concejal"
  Parámetro:
          nombre: Nombre [y apellidos] del concejal
          partido: Nombre del partido al que pertenece
          cargo: Alcalde, teniente de alcalde, delegado de cultura, ... o ninguno
  Resultado: 
          Lista de asociación con los datos dados
  Descripción:
          Se crear una lista de asociacion con los argumentos pasados
  Funciones a las que llama: ninguna
|#

(define (crear-concejal nombre partido cargo)
	(list   (list 'nombre nombre)
		(list 'partido partido)
		(list 'cargo cargo)
	)
)





#| 
  Nombre: obtener-nombre-concejal
  Objetivo: Obtener el nombre de un concejal dado
  Parámetro:
          concejal: Tipo abstracto
  Resultado: 
         Nombre del concejal
  Descripción:
         Usando la función assoc se obtiene el nombre del concejal de la lista de asociación
  Funciones a las que llama: ninguna
|#

(define (obtener-nombre-concejal concejal)
	(cadr (assoc 'nombre concejal))
)





#| 
  Nombre: obtener-partido-concejal
  Objetivo: Obtener el partido de un concejal dado
  Parámetro:
          concejal: Tipo abstracto
  Resultado: 
         Partido del concejal
  Descripción:
         Usando la función assoc se obtiene el partido del concejal de la lista de asociación
  Funciones a las que llama: ninguna
|#

(define (obtener-partido-concejal concejal)
	(cadr (assoc 'partido concejal))
)




#| 
  Nombre: obtener-cargo-concejal
  Objetivo: Obtener el cargo de un concejal dado
  Parámetro:
          concejal: Tipo abstracto
  Resultado: 
         Cargo del concejal
  Descripción:
         Usando la función assoc se obtiene el cargo del concejal de la lista de asociación
  Funciones a las que llama: ninguna
|#

(define (obtener-cargo-concejal concejal)
	(cadr (assoc 'cargo concejal))
)




#| 
  Nombre: modificar-nombre-concejal
  Objetivo: Modificar el nombre de un concejal dado
  Parámetro:
          concejal: Tipo abstracto
          nuevo-nombre: Nombre nuevo del concejal
  Resultado: 
         Concejal modificado con el nuevo nombre
  Descripción:
         Usando la función assoc y set! se modifica el nombre del concejal en la lista de asociación
  Funciones a las que llama: ninguna
|#

(define (modificar-nombre-concejal! concejal nuevo-nombre)
	(set-cdr! (assoc 'nombre concejal) (list nuevo-nombre))
)





#| 
  Nombre: modificar-partido-concejal
  Objetivo: Modificar el partido de un concejal dado
  Parámetro:
          concejal: Tipo abstracto
          nuevo-partido: Nuevo partido del concejal
  Resultado: 
         Concejal modificado con el nuevo partido
  Descripción:
         Usando la función assoc y set! se modifica el partido del concejal en la lista de asociación
  Funciones a las que llama: ninguna
|#

(define (modificar-partido-concejal! concejal nuevo-partido)
	(set-cdr! (assoc 'partido concejal) (list nuevo-partido))
)




#| 
  Nombre: modificar-cargo-concejal
  Objetivo: Modificar el cargo de un concejal dado
  Parámetro:
          concejal: Tipo abstracto
          nuevo-cargo: Nuevo cargo del concejal
  Resultado: 
         Concejal modificado con el nuevo cargo
  Descripción:
         Usando la función assoc y set! se modifica el cargo del concejal en la lista de asociación
  Funciones a las que llama: ninguna
|#

(define (modificar-cargo-concejal! concejal nuevo-cargo)
	(set-cdr! (assoc 'cargo concejal) (list nuevo-cargo))
)





;; TIPO DATO ABSTRACTO: AYUNTAMIENTO
;; <---------------------------------------------------------------------->

#| 
  Nombre: crear-ayuntamiento
  Objetivo: Crear un ayuntamiento sin concejales
  Parámetro:
          (ninguno)
  Resultado: 
          Lista de concejales
  Descripción:
          Se crea una lista que contendrá los concelajes del ayuntamiento
  Funciones a las que llama: ninguna
|#

(define (crear-ayuntamiento)
  '() ;; Lista vacía
  )





#| 
  Nombre: ayuntamiento-vacio?
  Objetivo: Comprobar si el ayuntamiento está vacío
  Parámetro:
          ayuntamiento: Tipo abstracto de dato
  Resultado: 
          #t si está vacío; #f en caso contrario
  Descripción:
           Se usa la función null? para determinar si la lista está vacía
  Funciones a las que llama: ninguna
|#

(define (ayuntamiento-vacio? ayuntamiento)

  ;; Cuerpo funcion
  (null? ayuntamiento)
  )





#| 
  Nombre: cargar-ayuntamiento
  Objetivo: Leer los datos de los concejales desde un fichero para almacenarlos en el ayuntamiento
  Parámetro:
          (ninguno)
  Resultado: 
          Ayuntamiento cargado con los datos del fichero
  Descripción:
          Se leen los datos de un fichero
  Funciones a las que llama: leer-teclado-cadena poner-comillas
|#

(define (cargar-ayuntamiento)

  ;; Variable local
  (define puerto (open-input-file (leer-teclado-cadena "Nombre del fichero (sin comillas)")))

  ;; Cuerpo funcion
  (do
    (
     (lista-ayuntamiento '() (append lista-ayuntamiento
                                (list (crear-concejal (poner-comillas nombre) 
                                                     (read puerto) 
                                                     (read puerto) 
                                                     )
                                      )
                                )
                     )
     ;; Al leer el nombre desde un fichero, le quita las comillas
     (nombre         (read puerto)  (read puerto))
     )
    ;; Condicion de salida del bucle
    ((eof-object? nombre) 
        ;; Se cierra el puerto asociado al fichero de entrada
        (close-input-port puerto) 
        ;; Se devuelve la lista de donantes
	lista-ayuntamiento                    
	)
    ;; No hay cuerpo del bucle
    )
  )




#| 
  Nombre: grabar-ayuntamiento
  Objetivo: Crear un fichero con los datos de los concejales del ayuntamiento
  Parámetro:
          ayuntamiento: Tipo de dato abstracto
  Resultado: 
          Fichero con los datos de los concejales
  Descripción:
          Se crea un fichero con los datos del ayuntamiento
  Funciones a las que llama: leer-teclado-cadena obtener-nombre-concejal obtener-partido-concejal obtener-cargo-concejal
|#

(define (grabar-ayuntamiento ayuntamiento)

  ;; Cuerpo funcion
  (do
      ;; Variables locales bucle
    (
     (puerto (open-output-file (leer-teclado-cadena "Nombre del fichero (sin comillas)")))
     (lista-auxiliar ayuntamiento (cdr lista-auxiliar))
     )
    ;; Condicion de salida del bucle
    ((null? lista-auxiliar) 
         ; Se cierra el puerto asociado al fichero de salida
        (close-output-port puerto) 
	)
    ;; Cuerpo del bucle
     (display (obtener-nombre-concejal (car lista-auxiliar)) puerto)
     (display " " puerto)
     (display (obtener-partido-concejal (car lista-auxiliar)) puerto)
     (display " " puerto)
     (display (obtener-cargo-concejal (car lista-auxiliar)) puerto)
     (display " " puerto)
     (newline puerto)
    )
  )




#| 
  Nombre: existe-concejal?
  Objetivo: Comprobar si un ayuntamiento contiene a un concejal
  Parámetro:
          ayuntamiento: Tipo de dato abstracto
          nombre-concejal: Nombre del concejal a buscar en ayuntamiento
  Resultado: 
          #t si existe, #f en caso contrario
  Descripción:
          Se recorre la lista ayuntamiento obteniendo cada concejal, y se compara
          cada nombre con el nombre del concejal buscado
  Funciones a las que llama: ayuntamiento-vacio?
|#

(define (existe-concejal? ayuntamiento nombre-concejal)

  ;; Cuerpo funcion
  (if (ayuntamiento-vacio? ayuntamiento) #f
      ;; Alternativa
      (do
          ;; Variable locales bucle
          (
           (lista-auxiliar ayuntamiento (cdr lista-auxiliar))
           (nombre-lista (obtener-nombre-concejal (car ayuntamiento)) (obtener-nombre-concejal (car lista-auxiliar)))
           (existe? (string-ci=? nombre-concejal (obtener-nombre-concejal (car ayuntamiento))) (string-ci=? nombre-concejal nombre-lista))
           )
        ;; Condicion de salida del bucle
        ((or (null? lista-auxiliar) existe?) existe?)
        )
      )
  )




#| 
  Nombre: insertar-concejal!
  Objetivo: Insertar un concejal en el ayuntamiento
  Parámetro:
          ayuntamiento: Tipo de dato abstracto
  Resultado: 
          Tipo de dato abstracto concejal o #f si no existe
  Descripción:
          Se pide los datos del concejal por teclado para crearlo.
  Funciones a las que llama: crear-concejal leer-teclado-cadena
|#

(define (insertar-concejal! ayuntamiento)

  ;; Variable local
  (define concejal
    (crear-concejal
     (leer-teclado-cadena "Nombre del concejal (escribe con comillas): ")
     (leer-teclado-cadena "Partido (escribe con comillas): ")
     (leer-teclado-cadena "Cargo (escribe con comillas): ")
     )
    )
  
  ;; Cuerpo funcion
  (if (existe-concejal? ayuntamiento (obtener-nombre-concejal concejal))
      #f concejal)
  )





#| 
  Nombre: borrar-concejal!
  Objetivo: Borrar un concejal del ayuntamiento
  Parámetro:
          ayuntamiento: Tipo de dato abstracto
           nombre-concejal: Nombre del concejal a borrar en ayuntamiento
  Resultado: 
          Nuevo ayuntamiento sin el concejal o #f si no existia
  Descripción:
          Se itera sobre el ayuntamiento y se devuelve la lista sin el concejal
  Funciones a las que llama: obtener-nombre-concejal
|#

(define (borrar-concejal! ayuntamiento nombre-concejal)

  ;; Cuerpo funcion
  (if (existe-concejal? ayuntamiento nombre-concejal)
      ;; Consecuente
      (cond ((null? ayuntamiento)
             '())
            ((string-ci=? nombre-concejal (obtener-nombre-concejal (car ayuntamiento)))
             (cdr ayuntamiento))
            (else
             (cons (car ayuntamiento)
                   (borrar-concejal! (cdr ayuntamiento) nombre-concejal))
             )
            )
      ;; Alternativa
      #f
      )
  )





#| 
  Nombre: modificar-concejal!
  Objetivo: Modificar un concejal del ayuntamiento
  Parámetro:
          ayuntamiento: Tipo de dato abstracto
           nombre-concejal: Nombre del concejal a modificar del ayuntamiento
  Resultado: 
          Nuevo ayuntamiento con el concejal modificado o #f si no existia
  Descripción:
          Se borra el concejal de la lista y despues se añade uno nuevo.
  Funciones a las que llama: borrar-concejal! insertar-concejal!
|#

(define (modificar-concejal! ayuntamiento nombre-concejal)

  ;; Variable local
  (define lista-auxiliar (borrar-concejal! ayuntamiento nombre-concejal))

  ;; Cuerpo funcion
  (if lista-auxiliar
      (append lista-auxiliar (insertar-concejal! ayuntamiento))
      #f
      )
  )




#| 
  Nombre: consultar-concejal
  Objetivo: Consultar un concejal del ayuntamiento
  Parámetro:
           ayuntamiento: Tipo de dato abstracto
           nombre-concejal: Nombre del concejal a consultar del ayuntamiento
  Resultado: 
          Datos del concejal consultado o #f si no existe
  Descripción:
          Se itera sobre el ayuntamiento buscando al concejal. Se muestran sus datos una vez encontrado.
  Funciones a las que llama: ayuntamiento-vacio? existe-concejal? obtener-nombre-concejal obtener-partido-concejal obtener-cargo-concejal
|#

(define (consultar-concejal ayuntamiento nombre-concejal)

  ;; Funcion auxiliar
  (define (mostrar-concejal lista-auxiliar)
    (display "Nombre: ")
    (display (obtener-nombre-concejal (car lista-auxiliar)))
    (newline)
    (display "Partido: ")
    (display (obtener-partido-concejal (car lista-auxiliar)))
    (newline)
    (display "Cargo: ")
    (display (obtener-cargo-concejal (car lista-auxiliar)))
    (newline)
    (newline)
    )

  ;; Cuerpo funcion
  (if (or (ayuntamiento-vacio? ayuntamiento) (not (existe-concejal? ayuntamiento nombre-concejal))) #f
      (do
          ;; Variables locales del bucle
          (
           (lista-auxiliar ayuntamiento (cdr lista-auxiliar))
           (nombre-lista (obtener-nombre-concejal (car ayuntamiento)) (obtener-nombre-concejal (car lista-auxiliar)))
           (existe? (string-ci=? nombre-concejal (obtener-nombre-concejal (car ayuntamiento))) (string-ci=? nombre-concejal nombre-lista))
           )
        ;; Condicion de salida del bucle
        ((or (null? lista-auxiliar) existe?) (mostrar-concejal lista-auxiliar))
        )
      )
  )





#| 
  Nombre: consultar-concejales-partido
  Objetivo: Consultar los concejales de un partido del ayuntamiento
  Parámetro:
           ayuntamiento: Tipo de dato abstracto
           nombre-partido: Nombre del partido a consultar del ayuntamiento
  Resultado: 
          Datos de los concejales del partido consultado o #f si no existe
  Descripción:
          Se itera sobre el ayuntamiento buscando a los concejales que pertenecen a dicho partido. Se muestran sus datos una vez encontrados.
  Funciones a las que llama: ayuntamiento-vacio? obtener-nombre-concejal obtener-partido-concejal obtener-cargo-concejal
|#

(define (consultar-concejales-partido ayuntamiento nombre-partido)

  ;; Funcion auxiliar
  (define (mostrar-concejal lista-auxiliar)
    (display "Nombre: ")
    (display (obtener-nombre-concejal (car lista-auxiliar)))
    (newline)
    (display "Partido: ")
    (display (obtener-partido-concejal (car lista-auxiliar)))
    (newline)
    (display "Cargo: ")
    (display (obtener-cargo-concejal (car lista-auxiliar)))
    (newline)
    (newline)
    )

  ;; Cuerpo funcion
  (if (ayuntamiento-vacio? ayuntamiento) #f
     ;; Variables locales del bucle
      (do
          (
           (lista-auxiliar ayuntamiento (cdr lista-auxiliar))
           (nombre-lista (obtener-partido-concejal (car ayuntamiento)) (obtener-partido-concejal (car lista-auxiliar)))
           (existe? (string-ci=? nombre-partido (obtener-partido-concejal (car ayuntamiento))) (string-ci=? nombre-partido nombre-lista))
           )
        ;; Condicion de salida del bucle
        ((null? lista-auxiliar) (newline))

        (if existe? (mostrar-concejal lista-auxiliar))
        )
      )  
  )





#| 
  Nombre: consultar-concejales
  Objetivo: Consultar los concejales del ayuntamiento
  Parámetro:
           ayuntamiento: Tipo de dato abstracto
  Resultado: 
          Datos de los concejales del ayuntamiento o #f si no existe
  Descripción:
          Se itera sobre el ayuntamiento mostrando los datos de los concejales
  Funciones a las que llama: ayuntamiento-vacio? obtener-nombre-concejal obtener-partido-concejal obtener-cargo-concejal
|#
(define (consultar-concejales ayuntamiento)
  
  ;; Cuerpo funcion
  (if (ayuntamiento-vacio? ayuntamiento) #f
      (do
          ;; Variables locales del bucle
          (
           (lista-auxiliar ayuntamiento (cdr lista-auxiliar))
           )
        ;; Condicion de salida del bucle
        ((null? lista-auxiliar) (newline))
    
        ;; Cuerpo del bucle
        (display "Nombre: ")
        (display (obtener-nombre-concejal (car lista-auxiliar)))
        (newline)
        (display "Partido: ")
        (display (obtener-partido-concejal (car lista-auxiliar)))
        (newline)
        (display "Cargo: ")
        (display (obtener-cargo-concejal (car lista-auxiliar)))
        (newline)
        (newline)
        (newline)
        )
      )
  )




#| 
  Nombre: programa-gestion-ayuntamiento
  Objetivo: Programa para gestionar un ayuntamiento y sus concejales
  Parámetro:
           (ninguno)
  Funciones a las que llama: crear-ayuntamiento ayuntamiento-vacio?
                             cargar-ayuntamiento grabar-ayuntamiento
                             existe-concejal? insertar-concejal!
                             borrar-concejal! modificar-concejal!
                             consultar-concejal consultar-concejales
                             consultar-concejales-partido
|#

(define (programa-gestion-ayuntamiento)

  ;; Funcion auxiliar
  ;; Muestra el menu del programa y recoge la opcion elegida
  (define (pedir-opcion)
    (newline)
    (display "Elige una opcion" )
    (newline)
    (display "1 -> Crear un ayuntamiento" )
    (newline)
    (display "2 -> Comprobar si un ayuntamiento está vacío" )
    (newline)
    (display "3 -> Cargar un ayuntamiento desde un fichero" )
    (newline)
    (display "4 -> Grabar el ayuntamiento en un fichero" )
    (newline)
    (display "5 -> Insertar un concejal en un ayuntamiento" )
    (newline)
    (display "6 -> Modificar un concejal de un ayuntamiento" )
    (newline)
    (display "7 -> Borrar un concejal de un ayuntamiento" )
    (newline)
    (display "8 -> Consultar los datos un concejal" )
    (newline)
    (display "9 -> Consultar los datos de todos los concejales" )
    (newline)
    (display "10 -> Consultar los datos de todos los concejales de un partido" )
    (newline)
    (display "11 -> Mostrar la estructura interna del ayuntamiento" )
    (newline)
    (display "0 -> Salir" )
    (newline)
		
    (newline)
    (display " --> ")
    ;; lee la opción elegida
    (read)
    )

  ;; Cuerpo funcion
  (do
      ;; Variables locales del bucle
      (
       (ayuntamiento '())   
       (opcion (pedir-opcion) (pedir-opcion))
       )
    ;; Condicion de salida
    ((= opcion 0) (display "fin del programa"))

    ;; Cuerpo del bucle
    (cond
      ((= opcion 1)
       (display "Crear un ayuntamiento")
       (newline)
       (set! ayuntamiento (crear-ayuntamiento))
       (display "Ayuntamiento creado")
       (newline)
       )
      ((= opcion 2)
       (display "Comprobar si un ayuntamiento está vacío")
       (newline)
       (if (ayuntamiento-vacio? ayuntamiento)
           (display "El ayuntamiento está vacío")
           (display "El ayuntamiento no está vacío")
           )
       (newline)
       )
      ;; CARGAR CONCEJALES DESDE UN FICHERO
      ((= opcion 3)
       (display "Carga de los datos de los concejales desde un fichero")
       (newline)
       (set! ayuntamiento (append ayuntamiento (cargar-ayuntamiento)))
       (display "Datos cargados")
       (newline)
       )
      ;; GRABAR LOS CONCEJALES EN UN FICHERO
      ((= opcion 4) 
       (display "Grabacion de los datos de los concejales en un fichero")
       (newline)	   
       (grabar-ayuntamiento ayuntamiento)
       (display "Datos grabados")
       (newline)
       )
      ;; INTRODUCIR LOS CONCEJALES DESDE EL TECLADO
      ((= opcion 5) 
       (display "Insertar de datos de un concejal")
       (newline)
       (define concejal (insertar-concejal! ayuntamiento))
       (newline)
       (cond
         (concejal (set! ayuntamiento (append ayuntamiento (list concejal))) (display "Concejal insertado correctamente"))
         (else (display "El concejal ya existe, no se insertara"))
         )
       (newline)
       )
      ;; MODIFICAR UN CONCEJAL
      ((= opcion 6)
       (define lista-auxiliar
         (modificar-concejal! ayuntamiento
                              (leer-teclado-cadena "Introduce el nombre del concejal a modificar: ")))
       (newline)
       (cond
         (lista-auxiliar (set! ayuntamiento lista-auxiliar) (display "Concejal modificado correctamente"))
         (else (display "El concejal no existe. No se ha modificado ningún concejal"))
         )
       (newline)
       )
      ;; BORRAR UN CONCEJAL
      ((= opcion 7)
       (define lista-auxiliar
         (borrar-concejal! ayuntamiento
                           (leer-teclado-cadena "Introduce el nombre del concejal a borrar: ")))
       (newline)
       (cond
         (lista-auxiliar (set! ayuntamiento lista-auxiliar) (display "Concejal borrado correctamente"))
         (else (display "El concejal no existe. No se ha borrado ningún concejal"))
         )
       (newline)
       )
      ;; CONSULTAR UN CONCEJAL
      ((= opcion 8) 
       (if (not (consultar-concejal ayuntamiento (leer-teclado-cadena "Introduce el nombre del concejal a consultar: ")))
           (display "El concejal no existe"))
       (newline)
       )
      ;; CONSULTAR TODOS LOS CONCEJALES
      ((= opcion 9) 
       (if (not (consultar-concejales ayuntamiento)) (display "No hay concejales para mostrar"))
       (newline)
       )
      ;; CONSULTAR LOS CONCEJALES POR PARTIDO
      ((= opcion 10) 
       (if (not (consultar-concejales-partido ayuntamiento (leer-teclado-cadena "Introduce el nombre del partido a consultar: "))) (display "No hay concejales para mostrar"))
       (newline)
       )
      ;; MOSTRAR LA ESTRUCTURA INTERNA DE LA LISTA DE AYUNTAMIENTO
      ((= opcion 11) 
       (display ayuntamiento)
       (newline)
       )
      ;; CONTROL DE ERRORES
      (else (display "Opcion incorrecta")
            (newline)
            )
      )
    
    (leer-teclado-cadena "Pulse \"Enter\" para continuar")
    (newline)
    )
  )

;;LLAMADA AL PROGRAMA
;;(programa-gestion-ayuntamiento)






;; TIPO DATO ABSTRACTO: POLIGONO
;; <---------------------------------------------------------------------->



#| 
  Nombre: crear-poligono
  Objetivo: Crear un poligono vacio
  Parámetro:
          vertices: Lista de vertices
  Resultado: 
          Poligono vacio
  Descripción:
          Se crea una lista vacia
  Funciones a las que llama: ninguna
|#

(define (crear-poligono)
  (list)
  )





#| 
  Nombre: poligono-nulo?
  Objetivo: Comprobar si el poligono es nulo
  Parámetro:
          poligono: Tipo abstracto de dato
  Resultado: 
          #t si es nulo; #f en caso contrario
  Descripción:
           Si la lista contiene menos de 3 elementos (vertices), el poligono es nulo
  Funciones a las que llama: ninguna
|#

(define (poligono-nulo? poligono)

  ;; Cuerpo funcion
  (< (length poligono) 3)
  )






#| 
  Nombre: cargar-poligono
  Objetivo: Leer los datos de los verticees desde un fichero para almacenarlos en el poligono
  Parámetro:
          (ninguno)
  Resultado: 
          Poligono cargado con los datos del fichero
  Descripción:
          Se leen los datos de un fichero
  Funciones a las que llama: leer-teclado-cadena
|#

(define (cargar-poligono)

  ;; Variable local
  (define puerto (open-input-file (leer-teclado-cadena "Nombre del fichero (sin comillas)")))

  ;; Cuerpo funcion
  (do
    (
     (poligono (list) (append poligono (list vertice)))
     (vertice  (read puerto)  (read puerto))
     )
    ;; Condicion de salida del bucle
    ((eof-object? vertice) 
        ;; Se cierra el puerto asociado al fichero de entrada
        (close-input-port puerto) 
        ;; Se devuelve el poligono
	poligono                    
	)
    ;; No hay cuerpo del bucle
    )
  )




#| 
  Nombre: grabar-poligono
  Objetivo: Crear un fichero con los vertices del poligono
  Parámetro:
          poligono: Tipo de dato abstracto
  Resultado: 
          Fichero con los vertices del poligono
  Descripción:
          Se crea un fichero con los vertices del poligono
  Funciones a las que llama: leer-teclado-cadena
|#

(define (grabar-poligono poligono)

  ;; Cuerpo funcion
  (do
      ;; Variables locales bucle
    (
     (puerto (open-output-file (leer-teclado-cadena "Nombre del fichero (sin comillas)")))
     (lista-auxiliar poligono (cdr lista-auxiliar))
     )
    ;; Condicion de salida del bucle
    ((null? lista-auxiliar) 
         ; Se cierra el puerto asociado al fichero de salida
        (close-output-port puerto) 
	)
    ;; Cuerpo del bucle
     (display (car lista-auxiliar) puerto)
     (newline puerto)
    )
  )




#| 
  Nombre: numero-vertices
  Objetivo: Devolver el numero de vertices del poligono
  Parámetro:
          poligono: Tipo de dato abstracto
  Resultado: 
          Numero de vertices del poligono
  Descripción:
          Se calcula la longitud de la lista
  Funciones a las que llama: ninguna
|#

(define (numero-vertices poligono)

  ;; Cuerpo funcion
  (length poligono)
  )




#| 
  Nombre: posicion-vertice
  Objetivo: Devolver la posicion del vertice en el poligono
  Parámetro:
          poligono: Tipo de dato abstracto
          vertice: Lista con las coordenadas x,y
  Resultado: 
          Posicion del vertice en el poligono o -1 si no pertenece
  Descripción:
          Se recorre el poligono buscando el vertice deseado.
  Funciones a las que llama: poligono-nulo?
|#

(define (posicion-vertice poligono vertice)

  (define posicion (index-of poligono vertice))
  ;; Cuerpo funcion
  (if (poligono-nulo? poligono) -1
      ;; Alternativa
      (if posicion posicion -1)
      )
  )




#| 
  Nombre: insertar-vertice
  Objetivo: Insertar un vertice en el poligono
  Parámetro:
          poligono: Tipo de dato abstracto
  Resultado: 
          Tipo de dato abstracto vertice o #f si no existe
  Descripción:
          Se pide la coordenada x e y del vertice por teclado para crearlo.
  Funciones a las que llama: leer-teclado
|#

(define (insertar-vertice poligono)

  (define (insertar-lista nuevo posicion lista)
    (cond
      ((null? lista)
       (list nuevo))
      ((zero? posicion)
       (cons nuevo lista))
      (else 
       (cons (car lista) (insertar-lista nuevo (- posicion 1) (cdr lista))))
      )
    )
  
  (define X (leer-teclado "Introduce la coordenada X: "))
  (define Y (leer-teclado "Introduce la coordenada Y: "))
  (define posicion (leer-teclado "Indique la posicion: "))

  (insertar-lista (list X Y) posicion poligono)
  )






#| 
  Nombre: borrar-vertice
  Objetivo: Borrar un vertice de una posicion del poligono
  Parámetro:
          poligono: Tipo de dato abstracto
          posicion: Posicion del vertice a borrar
  Resultado: 
          Nuevo poligono sin el vertice o #f si es una posicion no valida
  Descripción:
          Se itera sobre el poligono y se devuelve la lista sin el vertice
  Funciones a las que llama: ninguna
|#

(define (borrar-vertice poligono posicion)

  (define (borrar-elemento-posicion lista n)
  (cond
    ((zero? n) (cdr lista))
      (else (append (list (car lista)) (borrar-elemento-posicion (cdr lista) (- n 1))))
      )
    )
  ;; Cuerpo funcion
  (if (>= posicion (length poligono)) #f
      ;; Alternativa
      (borrar-elemento-posicion poligono posicion)
      )
  )






#| 
  Nombre: consultar-vertice
  Objetivo: Devolver el vertice que ocupa determinada posicion en el poligono
  Parámetro:
           poligono: Tipo de dato abstracto
           posicion: Posicion del vertice
  Resultado: 
          Datos de los verticees del partido consultado o #f si la posicion es invalida
  Descripción:
           Se devuelve el vertice de dicha posicion
  Funciones a las que llama: ninguna
|#

(define (consultar-vertice poligono posicion)

  ;; Cuerpo funcion
  (cond ((>= posicion (length poligono)) #f)
        (else
         (define vertice (list-ref poligono posicion))
         (display "Coordenada X: ") (display (car vertice)) (newline)
         (display "Coordenada Y: ") (display (cadr vertice)) (newline)
         )
        )
  )





#| 
  Nombre: mostrar-vertices
  Objetivo: Consultar los vertices del poligono
  Parámetro:
           poligono: Tipo de dato abstracto
  Resultado: 
          Datos de los verticees del poligono
  Descripción:
          Se itera sobre el poligono mostrando los datos de los verticees
  Funciones a las que llama: ninguna
|#
(define (mostrar-vertices poligono)
  
  ;; Cuerpo funcion
  (if (zero? (numero-vertices poligono)) #f
      ;; Alternativa
      (do
          ;; Variables locales del bucle
          (
           (i 0 (+ i 1))
           )
        ;; Condicion de salida del bucle
        ((>= i (length poligono)) (newline))
    
        ;; Cuerpo del bucle
        (display "Coordenada X") (display i) (display ": ")
        (display (car (list-ref poligono i)))
        (newline)
        (display "Coordenada Y") (display i) (display ": ")
        (display (cadr (list-ref poligono i)))
        (newline)
        (newline)
        )
      )
  )





#| 
  Nombre: perimetro
  Objetivo: Calcular el perimetro de un poligono
  Parámetro:
          poligono: Tipo abstracto de datos
  Resultado: 
          Valor del perimetro
  Descripción:
          Se calcula la distancia entre dos vertices consecutivos del poligono,
          y se va acumulando el resultado. El último vértice se une con el primero.
  Funciones a las que llama: ninguna
|#

(define (perimetro poligono)

  ;; Funcion auxiliar
  ;; Calcular la distancia euclidiana entre dos puntos
  (define (distancia-euclidiana punto1 punto2)
    (sqrt (+ (expt (- (car punto2) (car punto1)) 2)
             (expt (- (cadr punto2) (cadr punto1)) 2))
          )
    )

  ;; Funcion auxiliar
  (define (longitud-lado i)
    (let
        ;; Variables locales let
        (
         (punto1 (list-ref poligono i))
         (punto2 (list-ref poligono (if (= (+ i 1) (length poligono))
                                        0 ;; Unimos el final con el punto 0
                                        (+ i 1)
                                        )
                           )
                 )
         )
      ;; Cuerpo let
      (distancia-euclidiana punto1 punto2)))
  
  ;; Cuerpo funcion
  (if (poligono-nulo? poligono) #f
      
      ;; Alternativa
      (do
          ;; Variables locales bucle
          (
           (i 1 (+ i 1))
           (resultado (longitud-lado 0) (+ resultado (longitud-lado i)))
           )
        ;; Condicion de salida y sentencia asociada
        ((= i (length poligono)) resultado)
        )
      )
  )
  
  

#| 
  Nombre: area
  Objetivo: Calcular el area de un poligono
  Parámetro:
          poligono: Tipo abstracto de datos
  Resultado: 
          Valor del area
  Descripción:
          Se aplica la formula del determinante de Gauss
  Funciones a las que llama: ninguna
|#

(define (area poligono)

  ;; Funcion auxiliar
  (define (auxiliar poligono)
    (cond
      ;; Caso base
      ((< (length poligono) 3) 0) 
      ;;Recursion: Se aplica (x1*y2 - y1*x2) + ... (xn*y1 - yn*x1)
      (else
       (+
        (- (* (caar poligono) (cadadr poligono))
           (* (cadar poligono) (caadr poligono)))
        (auxiliar (cddr poligono))
        )
       )
      )
    )

  ;; Cuerpo funcion
  (if (poligono-nulo? poligono) #f

      ;; Alternativa
      (abs (* (/ 1 2)
              (auxiliar poligono)
              )
           )
      )
  )




#| 
  Nombre: programa-gestion-poligono
  Objetivo: Programa para gestionar un poligono y sus verticees
  Parámetro:
           (ninguno)
  Funciones a las que llama: crear-poligono poligono-nulo?
                             cargar-poligono grabar-poligono
                             posicion-vertice insertar-vertice
                             borrar-vertice numero-vertices
                             consultar-vertice mostrar-vertices
|#

(define (programa-gestion-poligono)

  ;; Funcion auxiliar
  ;; Muestra el menu del programa y recoge la opcion elegida
  (define (pedir-opcion)
    (newline)
    (display "Elige una opcion" )
    (newline)
    (display "1 -> Crear un poligono nulo" )
    (newline)
    (display "2 -> Comprobar si el poligono es nulo" )
    (newline)
    (display "3 -> Cargar un poligono desde un fichero" )
    (newline)
    (display "4 -> Grabar el poligono en un fichero" )
    (newline)
    (display "5 -> Insertar un vertice en el poligono" )
    (newline)
    (display "6 -> Comprobar si un vertice pertenece al poligono" )
    (newline)
    (display "7 -> Numero de vertices del poligono" )
    (newline)
    (display "8 -> Borrar un vertice del poligono" )
    (newline)
    (display "9 -> Consultar vertice que ocupa determinada posicion" )
    (newline)
    (display "10 -> Mostrar los vertices del poligono" )
    (newline)
    (display "11 -> Mostrar la estructura interna del poligono" )
    (newline)
    (display "12 -> Calcular el perimetro del poligono" )
    (newline)
    (display "13 -> Calcular el area del poligono" )
    (newline)
    (display "0 -> Salir" )
    (newline)
		
    (newline)
    (display " --> ")
    ;; lee la opción elegida
    (read)
    )

  ;; Cuerpo funcion
  (do
      ;; Variables locales del bucle
      (
       (poligono (list))   
       (opcion (pedir-opcion) (pedir-opcion))
       )
    ;; Condicion de salida
    ((= opcion 0) (display "fin del programa"))

    ;; Cuerpo del bucle
    (cond
      ;; CREAR POLIGONO
      ((= opcion 1)
       (display "Crear un poligono nulo")
       (newline)
       (set! poligono (crear-poligono))
       (display "Poligono creado")
       (newline)
       )
      ;; COMPROBAR SI EL POLIGONO ES NULO
      ((= opcion 2)
       (display "Comprobar si el poligono es nulo")
       (newline)
       (if (poligono-nulo? poligono)
           (display "El poligono es nulo")
           (display "El poligono no es nulo")
           )
       (newline)
       )
      ;; CARGAR VERTICES DESDE UN FICHERO
      ((= opcion 3)
       (display "Cargar un poligono desde un fichero")
       (newline)
       (set! poligono (append poligono (cargar-poligono)))
       (display "Datos cargados")
       (newline)
       )
      ;; GRABAR VERTICES EN UN FICHERO
      ((= opcion 4) 
       (display "Grabar el poligono en un fichero")
       (newline)	   
       (grabar-poligono poligono)
       (display "Datos grabados")
       (newline)
       )
      ;; INTRODUCIR LOS VERTICES DESDE EL TECLADO
      ((= opcion 5) 
       (display "Insertar un vertice en el poligono")
       (newline)
       (newline)
       (set! poligono (insertar-vertice poligono))
       (display "Vertice insertado correctamente")
       (newline)
       )
      ;; COMPROBAR SI VERTICE PERTENECE AL POLIGONO
      ((= opcion 6)
       (display "Comprobar si un vertice pertenece al poligono") (newline)
       (let*
           (
            (X (leer-teclado "Introduce la coordenada X: "))
            (Y (leer-teclado "Introduce la coordenada Y: "))
            (posicion (posicion-vertice poligono (list X Y)))
            )
         (newline)
         (cond
           ((not (= posicion -1)) (display "El vertice ocupa la posicion: ") (display posicion))
           (else (display "El vertice no existe."))
           )
         (newline)
         )
       )
      ;; NUMERO DE VERTICES
      ((= opcion 7)
       (display "Numero de vertices del poligono: ") (display (numero-vertices poligono))
       (newline)
       )
      ;; BORRAR UN VERTICE
      ((= opcion 8)
       (define lista-auxiliar
         (borrar-vertice poligono
                         (leer-teclado "Introduce la posicion del vertice a borrar: ")))
       (newline)
       (cond
         (lista-auxiliar (set! poligono lista-auxiliar) (display "Vertice borrado correctamente"))
         (else (display "Posicion invalida. No se ha borrado ningún vertice"))
         )
       (newline)
       )
      ;; CONSULTAR UN VERTICE
      ((= opcion 9) 
       (if (not (consultar-vertice poligono (leer-teclado "Introduce la posicion del vertice a consultar: ")))
           (display "Posicion invalida"))
       (newline)
       )
      ;; CONSULTAR TODOS LOS VERTICES
      ((= opcion 10) 
       (if (not (mostrar-vertices poligono)) (display "No hay vertices para mostrar"))
       (newline)
       )
      ;; MOSTRAR LA ESTRUCTURA INTERNA DE LA LISTA DE AYUNTAMIENTO
      ((= opcion 11) 
       (display poligono)
       (newline)
       )
      ;; PERIMETRO
      ((= opcion 12)
       (define perimetro-valor (perimetro poligono))
       (cond
         (perimetro-valor (newline) (display "El valor del perimetro es: ") (display perimetro-valor))
         (else (display "El poligono es nulo, no se puede calcular su perimetro"))
         )
       (newline)
       )
      ;; PERIMETRO
      ((= opcion 13)
       (define area-valor (area poligono))
       (cond
         (area-valor (newline) (display "El valor del area es: ") (display area-valor))
         (else (display "El poligono es nulo, no se puede calcular su area"))
         )
       (newline)
       )
      ;; CONTROL DE ERRORES
      (else (display "Opcion incorrecta")
            (newline)
            )
      )
    
    (leer-teclado-cadena "Pulse \"Enter\" para continuar")
    (newline)
    )
  )

;;LLAMADA AL PROGRAMA
(programa-gestion-poligono)






