/* PRACTICA 6. PROGRAMACIÓN DECLARATIVA 
Carlos Lucena Robles
-----------------------------------
*/




pertenece(X,[X|_]).
pertenece(X,[_|Cola]):- pertenece(X,Cola).

/* ---------------------------------- */



/*
 izquierdaDe(Imagen1,Imagen2)
 
 Predicado que indica si a la izquierda de Imagen1 está Imagen2
 
 Argumentos
 + Imagen1:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
 + Imagen2:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
*/

izquierdaDe(lapiz,grifo).
izquierdaDe(pez,lapiz).
izquierdaDe(televisor,pez).
izquierdaDe(tijeras,pizarra).





/*
 encimaDe(Imagen1,Imagen2)
 
 Predicado que indica si encima de Imagen1 está Imagen2
 
 Argumentos
 + Imagen1:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
 + Imagen2:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
*/

encimaDe(grifo,cuaderno).
encimaDe(pez,pizarra).
encimaDe(televisor,tijeras).





/*
 derechaDe(I1,I2)
 
 Predicado que indica si a la derecha de I1 está I2
 
 Argumentos
 + I2:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
 + I2:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
	 
 Predicados relacionados
 	+ izquierdaDe
*/

derechaDe(I1,I2) :- izquierdaDe(I2,I1).




/*
 debajoDe(I1,I2)
 
 Predicado que indica si debajo de I1 está I2
 
 Argumentos
 + I2:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
 + I2:
	 - Significado: nombre de la imagen
	 - Tipo: entrada y salida
	 
 Predicados relacionados
 	+ encimaDe
*/

debajoDe(I1,I2) :- encimaDe(I2,I1).





/*
 lector(Nombre,Sexo,Edad)
 
 Predicado que indica si Nombre es un lector con el sexo Sexo y la edad Edad
 
 Argumentos
 + Nombre:
	 - Significado: estructura con el nombre de una persona
	 - Tipo: entrada y salida
 + Sexo:
	 - Significado: sexo de una persona (mujer u hombre)
	 - Tipo: entrada y salida
 + Edad:
	 - Significado: número natural que representa la edad de una persona
	 - Tipo: entrada y salida 	
*/

lector(nombre("Ana", "Garrido", "Aguirre"),mujer,31).
lector(nombre("Marta", "Cantero", "Lasa"),mujer,20).
lector(nombre("Rodrigo", "Luna", "Soto"),hombre,30).
lector(nombre("Marta", "Siles", "Parra"),mujer,30).




/*
 haylectores
 
 Predicado que comprueba si hay algún lector
*/

hayLectores :- lector(_,_,_),!.





/*
 quienesLectores(N,A1,A2)
 
 Predicado que indica si el nombre N y los apellidos A1 y A2 es un lector (idependientemente de edad y sexo)
 
 Argumentos
 + N:
	 - Significado: nombre de una persona
	 - Tipo: entrada y salida
 + A1:
	 - Significado: primer apellido de una persona
	 - Tipo: entrada y salida
 + A2:
	 - Significado: segundo apellido de una persona
	 - Tipo: entrada y salida
*/

quienesLectores(N,A1,A2) :- lector(nombre(N,A1,A2),_,_).





/*
 lectoras(N,A1,A2)
 
 Predicado que indica si el nombre N, el primer apellido A1 y el segundo apellido A2 es un lectora (idependientemente edad)
 
 Argumentos
 + N:
	 - Significado: nombre de una persona
	 - Tipo: entrada y salida
 + A1:
	 - Significado: primer apellido de una persona
	 - Tipo: entrada y salida
 + A2:
	 - Significado: segundo apellido de una persona
	 - Tipo: entrada y salida
*/

lectoras(N,A1,A2) :- lector(nombre(N,A1,A2),mujer,_).





/*
 lectores(N,A1,A2)
 
 Predicado que indica si el nombre N, el primer apellido A1 y el segundo apellido A2 es un lector (idependientemente edad)
 
 Argumentos
 + N:
	 - Significado: nombre de una persona
	 - Tipo: entrada y salida
 + A1:
	 - Significado: primer apellido de una persona
	 - Tipo: entrada y salida
 + A2:
	 - Significado: segundo apellido de una persona
	 - Tipo: entrada y salida
*/

lectores(N,A1,A2) :- lector(nombre(N,A1,A2),hombre,_).





/*
 lectoresIgualNombre
 
 Predicado que comprueba si existen lectores con el mismo nombre (los apellidos pueden ser diferentes)
	 
 Variables locales
	 + Nombre:
	 	- Significado: nombre del lector
	 + Lista:
	 	- Significado: lista con los nombres de todos los lectores
	 + A1:
	 	- Significado: primer apellido del lector
	 + A2:
	 	- Significado: segundo apellido del lector
	 + S:
	 	- Significado: sexo del lector (hombre o mujer)
	 + E:
	 	- Significado: número natural que representa la edad de un lector
	 	
 Predicados relacionados
 	+ bagof
 	+ hayDuplicados
*/
lectoresIgualNombre :- 
                     bagof(Nombre, A1^A2^S^E^lector(nombre(Nombre,A1,A2),S,E), Lista), /* Se obtienen los nombres */
                     hayDuplicados(Lista). /* Si hay nombres duplicados -> existen lectores con el mismo nombre */



/*
 hayDuplicados([X|Cola])
 
 Predicado que comprueba si en una lista hay elementos duplicados
 
 Argumentos
 + X:
	 - Significado: cabeza de la lista
	 - Tipo: entrada
 + Cola:
	 - Significado: cola de la lista
	 - Tipo: entrada
	 	
 Predicados relacionados
 	+ pertenece
*/

hayDuplicados([]) :- false.
hayDuplicados([X|Cola]) :-
                        pertenece(X,Cola), /* Comprobar si la cabeza pertenece a la cola */
                        !; 
                        hayDuplicados(Cola). /* Comprobar recursivamente en la cola */



/*
 contarLectoresEdad(E,R)
 
 Predicado que indica cuantos lectores R hay con una edad E
 
 Argumentos
 + E:
	 - Significado: numero natural que representa la edad de un lector
	 - Tipo: entrada
 + R:
	 - Significado: numero natural que representa el numero de lectores
	 - Tipo: salida
	 
 Variables locales
	 + N:
	 	- Significado: nombre del lector
	 + Lista:
	 	- Significado: lista con los nombres de todos los lectores
	 + A1:
	 	- Significado: primer apellido del lector
	 + A2:
	 	- Significado: segundo apellido del lector
	 + S:
	 	- Significado: sexo del lector (hombre o mujer)
	 + E:
	 	- Significado: número natural que representa la edad de un lector
	 	
 Predicados relacionados
 	+ contar
*/

contarLectoresEdad(E,R) :- bagof(E, N^A1^A2^S^lector(nombre(N,A1,A2),S,E), Lista), /* Generar lista con edades */
                           contar(Lista,R). /* Longitud de la lista */
       
/*
 contar(L,N)
 
 Predicado que indica indica la longitud N de una lista L
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada
 + N:
	 - Significado: numero natural que representa la longitud de la lista L
	 - Tipo: salida
	 
 Variables locales
	 + Cola:
	 	- Significado: cola de la lista L
	 + M:
	 	- Significado: variable contador
*/
 
                     
contar([],0). /* Caso base */   
contar([_|Cola],N):-
                  contar(Cola,M),
                  N is M + 1.




/*
 suma(A,B,R)
 
 Predicado que 
 
 Argumentos
 + A:
	 - Significado: numero entero
	 - Tipo: entrada
 + B:
	 - Significado: numero entero
	 - Tipo: entrada
 + R:
	 - Significado: numero entero
	 - Tipo: salida
	 
 Variables locales
	 + A1:
	 	- Significado: numero entero para incrementar desde A hasta B
	 + R1:
	 	- Significado: numero entero (acumulador)
*/

/* Caso base */
suma(A,A,A):-!. 

/* Suma ascendente para numeros A < B*/
suma(A,B,R) :- A < B, 
			A1 is A + 1, 
			suma(A1,B,R1), 
			R is A + R1,!.
			
/* Suma descendente para numeros A > B*/	
suma(A,B,R) :- A1 is A - 1,
			   suma(A1,B,R1), 
			   R is A + R1.





/*
 mediaAritmetica(A,B,R)
 
 Predicado que calcula la media aritmetica entre dos numeros enteros A y B
 
 Argumentos
 + A:
	 - Significado: numero entero
	 - Tipo: entrada
 + B:
	 - Significado: numero entero
	 - Tipo: entrada
 + R:
	 - Significado: numero real
	 - Tipo: salida
	 
 Variables locales
	 + T:
	 	- Significado: numero entero (suma total desde A hasta B)
	 	
 Predicados relacionados
 	+ suma
 	+ abs
*/

mediaAritmetica(A,B,R) :- suma(A,B,T), /* Suma total desde A hasta B*/
                       R is T/(abs(B-A)+1). /* Suma total / nº elementos */




/*
 doblar_lista(L,R)
 
 Predicado que devuelve una lista R con cada elemento de la lista L repetido
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada y salida
 + R:
	 - Significado: lista con los elementos doblados de L
	 - Tipo: entrada y salida
	 
 Variables locales
	 + X:
	 	- Significado: cabeza de la lista L
	 + Cola:
	 	- Significado: cola de la lista L
     + Resto:
	 	- Significado: cola de la lista R
*/

/* Caso base */
doblar_lista([],[]). 

/* Doblar cada elemento de la lista y hacerlo recursivamente en la de la lista */
doblar_lista([X|Cola], [X, X|Resto]) :- doblar_lista(Cola, Resto).





/*
 eliminarRepetidos(L,R)
 
 Predicado que devuelve una lista R sin elementos duplicados de L
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada
 + R:
	 - Significado: lista sin elementos duplicados de L
	 - Tipo: salida
	 
 Variables locales
	 + X:
	 	- Significado: cabeza de la lista L
	 + Cola:
	 	- Significado: cola de la lista L
	 + R:
	 	- Significado: lista sin duplicados de L
	 + Resto:
	 	- Significado: cola de la lista R
	 	
 Predicados relacionados
 	+ pertenece
*/

/* Caso base */
eliminarRepetidos([],[]).

/* Si hay duplicados en la Cola, se forma una lista sin ese elemento */
eliminarRepetidos([X|Cola],R) :-
                        pertenece(X,Cola), 
                       !, 
                        eliminarRepetidos(Cola,R).

/* Si no hay duplicados, se forma la lista con el elemento */
eliminarRepetidos([X|Cola],[X|Resto]) :-
                                      eliminarRepetidos(Cola,Resto).




/*
 invertir(L,R)
 
 Predicado que indica si una lista R es invertida de una lista L
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada
	 
  + R:
	 - Significado: lista invertida L
	 - Tipo: salida
	 
 Variables locales
	 + Cabeza:
	 	- Significado: cabeza de la lista L
	 + Cola:
	 	- Significado: cola de la lista L
	 + Cola2:
	 	- Significado: cola de una sublista
	 + Cola1:
	 	- Significado: resto de la cola de la lista L
	 	
 Predicados relacionados
 	+ es_lista
 	+ concatenar
*/

/* Caso base */
invertir([],[]).

/* Si un elemento es una sublista, se concatena el resto de la lista con la sublista invertidas */
invertir([Cabeza|Cola],R):-
            es_lista(Cabeza),
            invertir(Cabeza, Cola2),
			invertir(Cola,Cola1),
			concatenar(Cola1,[Cola2],R),!.

/* Si el elemento no es una sublista, se concatena el resto de la lista con su cabeza */
invertir([Cabeza|Cola],R):-
			invertir(Cola,Cola1),
			concatenar(Cola1,[Cabeza],R).





/*
  es_lista(X).

  Predicado que comprueba si X es una lista

  Argumentos
  + X:
    - Significado: lista de elementos
    - Tipo: entrada 

  Variables locales
  + Cola:
    - Significado: lista de elementos
*/


es_lista([]).

es_lista([_|Cola]):- es_lista(Cola).




/*
 concatenar(L1,L2,L)
 
 Predicado que indica que L es la concatenación de las listas L1 y L2
 
 Argumentos
 + L1:
	 - Significado: lista
	 - Tipo: entrada
 + L2:
	 - Significado: lista
	 - Tipo: entrada
 + L:
	 - Significado: lista resultante de la concatenación de L1 y L2
	 - Tipo: salida
	 
 Variables locales
	 + X:
	 	- Significado: cabeza de la lista
*/

concatenar([],L,L).

concatenar([X|L1],L2,[X|L]):- concatenar(L1,L2,L).




/*
 localidad(Nombre, Provincia, Habitantes)
 
 Predicado que indica si nombre es una localidad en la provincia Provincia y con un numero de habitantes Habitantes
 
 Argumentos
 + Nombre:
	 - Significado: nombre de la localidad
	 - Tipo: entrada y salida
 + Provincia:
	 - Significado: nombre de la provincia
	 - Tipo: entrada y salida
 + Habitantes:
	 - Significado: numero de habitantes de la localidad
	 - Tipo: entrada y salida
*/

localidad("Aguilar de la Frontera", "Cordoba", 13500).
localidad("Espiel", "Cordoba", 2400).
localidad("Montoro", "Cordoba", 9200).
localidad("Brenes", "Sevilla", 12700).
localidad("Lora del Rio", "Sevilla", 18700).
localidad("Marchena", "Sevilla", 19400).





/*
 contarLocalidadesProvincia(Provincia,N)
 
 Predicado que indica el nombre de la provincia Provincia que tiene N numero de localidades
 
 Argumentos
 + Provincia:
	 - Significado: nombre de la pronvincia
	 - Tipo: entrada y salida
 + N:
	 - Significado: numero de localidades de la provincia
	 - Tipo: entrada y salida
	 
 Variables locales
	 + Nombre:
	 	- Significado: nombre de la localidad
	 + Habitantes:
	 	- Significado: numero de habitantes de la localidad
	 + Lista:
	 	- Significado: lista (sin repeticiones) con el nombre de las localidades de la provincia dada
	 	
	 	
 Predicados relacionados
    + setof
 	+ contar
*/

contarLocalidadesProvincia(Provincia,N) :- 
                                      setof(Nombre, Habitantes^localidad(Nombre,Provincia,Habitantes), Lista), /* Generar lista con los nombres de las localidades */
                                      contar(Lista,N),!. /* Longitud de la lista */
                                      
                                      
                                      
    
/*
 sumarHabitantesProvincia(Provincia,N)
 
 Predicado que indica el nombre de la provincia Provincia que tiene N numero habitantes
 
 Argumentos
 + Provincia:
	 - Significado: nombre de la pronvincia
	 - Tipo: entrada y salida
 + N:
	 - Significado: numero de habitantes de la provincia
	 - Tipo: entrada y salida
	 
 Variables locales
	 + Nombre:
	 	- Significado: nombre de la localidad
	 + Habitantes:
	 	- Significado: numero de habitantes de la localidad
	 + Lista:
	 	- Significado: lista (sin repeticiones) con el numero de habitantes de cada localidad de la provincia dada
	 	
	 	
 Predicados relacionados
    + setof
 	+ contar
*/
                                  
sumarHabitantesProvincia(Provincia,N) :- 
                                      setof(Habitantes, Nombre^localidad(Nombre,Provincia,Habitantes), Lista), /* Generar lista con el numero de habitantes de cada localidad */
                                      sumarElementos(Lista, N),!. /* Sumar los elementos de la lista */




/*
 sumarElementos(L,R)
 
 Predicado que suma los elementos de una lista L
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada
 + R:
	 - Significado: suma de los elementos de la lista L
	 - Tipo: salida
	 
 Variables locales
	 + X:
	 	- Significado: cabeza de la lista L
	 + Cola:
	 	- Significado: cola de la lista L
     + R1:
	 	- Significado: acummulador
*/

sumarElementos([],0).
sumarElementos([X|Cola], R) :- sumarElementos(Cola, R1), R is X + R1.




/*
 separar(L,P,I)
 
 Predicado que separa la lista L en dos listas P e I
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada
 + P:
	 - Significado: lista formada por elementos de la lista L en la posicion par
	 - Tipo: salida
 + L:
	 - Significado: lista formada por elementos de la lista L en la posicion impar
	 - Tipo: salida	 	 
	 
	 
 Variables locales
	 + X:
	 	- Significado: elemento de la lista
	 + Y:
	 	- Significado: otro elemento de la lista
	 + Cola:
	 	- Significado: cola de la lista L
	 + ColaP:
	 	- Significado: cola de la lista P
	 + ColaI:
	 	- Significado: cola de la lista I
	 	
*/

/* Caso base */
separar([],[],[]).

/* Lista con un solo elemento */
separar([X], [X], []).

/* Si hay mas de dos elementos, los elementos de la posicion par se guardan en la primera lista, los de la posicion impar en la segunda lista */
separar([X, Y|Cola], [X|ColaP], [Y|ColaI]) :- separar(Cola, ColaP, ColaI),!.





/*
 unir(P,I,R)
 
 Predicado que indica en una lista R la unión ordenada de dos listas P e I
 
 Argumentos
 + P:
	 - Significado: lista de elementos
	 - Tipo: entrada
+ I:
	 - Significado: lista de elementos
	 - Tipo: entrada
+ R:
	 - Significado: lista formada por la unión ordenada de los elementos de P e I
	 - Tipo: salida
	 	 	 
 Variables locales
	 + X:
	 	- Significado: cabeza de la lista P
	 + Y:
	 	- Significado: cabeza de la lista I
	 + ColaP:
	 	- Significado: cola de la lista P
	 + ColaI:
	 	- Significado: cola de la lista I
	 + Cola:
	 	- Significado: cola de la lista R
*/

/* Caso base */
unir([],[],[]).

/* Una de las listas esta vacía */
unir(P,[],P):-!.
unir([],I,I):-!.

/* Unir las listas de tal forma los elementos menores o iguales se posicionan al principio */
unir([X|ColaP], [Y|ColaI], [X|Cola]) :- X @=< Y, unir(ColaP, [Y|ColaI], Cola),!.
unir([X|ColaP], [Y|ColaI], [Y|Cola]) :- X @> Y, unir([X|ColaP], ColaI, Cola),!.





/*
 mergesort(L,R)
 
 Predicado que ordena la lista L 
 
 Argumentos
 + L:
	 - Significado: lista
	 - Tipo: entrada
+ R:
	 - Significado: lista ordenada L
	 - Tipo: salida
 Variables locales
	 + X:
	 	- Significado: elemento de la lista
	 + Y:
	 	- Significado: otro elemento de la lista
	 + Cola:
	 	- Significado: cola de la lista
	 + P:
	 	- Significado: lista de los elementos de la posicion par de la lista L
	 + I:
	 	- Significado: lista de los elementos de la posicion impar de la lista L
	 + R1:
	 	- Significado: lista con los elementos ordenados de la lista P
	 + R2:
	 	- Significado: lista con los elementos ordenados de la lista I
	 	
 Predicados relacionados
 	+ separar
 	+ unir
*/

mergesort([],[]).
mergesort([X],[X]).
mergesort([X,Y|Cola],R) :-
                        separar([X,Y|Cola],P,I),
                        mergesort(P,R1),
                        mergesort(I,R2),
                        unir(R1,R2,R),!.





/*
 donante(persona,Grupo,Factor)
 
 Predicado que indica si e un donante dado su nombre, grupo y factor
 
 Argumentos
 + persona:
	 - Significado: estructura con el nombre, primer apellido y segundo apellido de una persona
	 - Tipo: entrada y salida
+ Grupo:
	 - Significado: representa el grupo sanguineo (0,a,b o ab)
	 - Tipo: entrada y salida
+ Factor:
	 - Significado: representa el factor RH (positivo o negativo)
	 - Tipo: entrada y salida
*/

donante(persona(juan,campos,ruiz),a,positivo).
donante(persona(ana,lara,silva),ab,negativo).
donante(persona(luis,luna,pachecho),ab,negativo).




/*
 puedeDonar(Donante, Receptor)
 
 Predicado que comprueba si un Donante puede donar sangre al Receptor
 
 Argumentos
 + Donante:
	 - Significado: estructura con el nombre y apellidos de la persona donante
	 - Tipo: entrada y salida
 + Receptor:
	 - Significado: estructura con el nombre y apellidos de la persona receptora
	 - Tipo: entrada y salida
	 
 Variables locales
	 + GrupoDonante:
	 	- Significado: grupo sanguíneo de la persona donante (a, b, ab, 0)
	 + GrupoReceptor:
	 	- Significado: grupo sanguíneo de la persona receptora (a, b, ab, 0)
	 + FactorDonante:
	 	- Significado: factor RH de la persona receptora (positivo o negativo)
	 + FactorReceptor:
	 	- Significado: factor RH de la persona receptora (positivo o negativo)
*/

puedeDonar(Donante, Receptor) :-
			donante(Donante, GrupoDonante, FactorDonante),
			donante(Receptor, GrupoReceptor, FactorReceptor),
			(
				/* Donante universal */
				GrupoDonante = 0, FactorDonante = negativo;
				
				/* Donante universal de los grupos positivos */
				GrupoDonante = 0, FactorDonante = positivo, FactorReceptor = positivo;
				
				/* Donante A negativo */
				GrupoDonante = a, FactorDonante = negativo, 
				(GrupoReceptor = a; GrupoReceptor = ab);
				
				/* Donante A positivo */
				GrupoDonante = a, FactorDonante = positivo, 
				(GrupoReceptor = a; GrupoReceptor = ab), FactorReceptor = positivo;
				
				/* Donante B negativo */
				GrupoDonante = b, FactorDonante = negativo,
				(GrupoReceptor = b; GrupoReceptor = ab);
				
				/* Donante B positivo */
				GrupoDonante = b, FactorDonante = positivo, 
				(GrupoReceptor = b; GrupoReceptor = ab), FactorReceptor = positivo;
				
				/* Donante AB negativo */
				GrupoDonante = ab, FactorDonante = negativo, 
				GrupoReceptor = ab;
				
				/* Donante AB positivo */
				GrupoDonante = ab, FactorDonante = positivo, 
				GrupoReceptor = ab,FactorReceptor = positivo
			),!.
			
			
			
	
/*
 contar_por_grupo_y_factor(Grupo, Factor, N)
 
 Predicado que devuelve el numero de donantes con un determinado Grupo y Factor
 
 Argumentos
+ Grupo:
	 - Significado: representa el grupo sanguineo (0,a,b o ab)
	 - Tipo: entrada y salida
+ Factor:
	 - Significado: representa el factor RH (positivo o negativo)
	 - Tipo: entrada y salida
	 
 Variables locales
     + Nombre:
	 	- Significado: nombre de una persona
	 + A1:
	 	- Significado: primer apellido de una persona
	 + A2:
	 	- Significado: segundo apellido de una persona
	 + Lista:
	 	- Significado: lista con los nombres de los donantes
	 	
 Predicados relacionados
 	+ bagof
 	+ contar
*/
			
contar_por_grupo_y_factor(Grupo,Factor,N) :- 
				  bagof(Nombre, A1^A2^donante(persona(Nombre,A1,A2), Grupo, Factor), Lista), /* Generar lista con los nombres de los donantes  */
                           contar(Lista,N). /* Longitud de la lista */





/*
 donantesFichero
 
 Predicado que genera un fichero con los nombres de los donantes a partir de los datos pedidos por teclado
	 
 Variables locales
	 + Grupo:
	 	- Significado: representa el grupo sanguineo (0,a,b o ab)
     + Factor:
	 	- Significado: representa el factor RH (positivo o negativo)
	 + Fichero:
	 	- Significado: nombre del fichero
	 	
 Predicados relacionados
 	+ write
 	+ read
 	+ escribirDonantesFichero
*/
                           
donantesFichero :- 
				write('Introduce el grupo sanguineo del donante -->'),
				read(Grupo), nl,
			    write('Introduce el factor RH del donante -->'),
			    read(Factor), nl,
			    write('Introduce el nombre del fichero -->'),
			    read(Fichero), nl,
			    escribirDonantesFichero(Fichero, Grupo, Factor).
			    



/*
 escribirDonantesFichero(Fichero, Grupo, Factor)
 
 Predicado que escribe la lista de donantes con el Grupo y Factor en el Fichero
 
 Argumentos
     + Grupo:
	 	- Significado: representa el grupo sanguineo (0,a,b o ab)
	 	- Tipo: entrada y salida
     + Factor:
	 	- Significado: representa el factor RH (positivo o negativo)
	 	- Tipo: entrada y salida
	 + Fichero:
	 	- Significado: nombre del fichero
	 	- Tipo: entrada y salida
	 
 Variables locales
 	 + OutputStream:
 	 	- Significado: stream de salida
     + Nombre:
	 	- Significado: nombre de una persona
	 + A1:
	 	- Significado: primer apellido de una persona
	 + A2:
	 	- Significado: segundo apellido de una persona
	 + Lista:
	 	- Significado: lista con los nombres de los donantes
	 	
 Predicados relacionados
 	+ 
*/

escribirDonantesFichero(Fichero, Grupo, Factor) :- 
	
	/* Abrir fichero */
	open(Fichero,write,OutputStream),
	
	/* Obtener una lista de los nombres de donantes */       
	bagof(Nombre, A1^A2^donante(persona(Nombre,A1,A2), Grupo, Factor), Lista),
	
	/* Escribir en el fichero la lista */
	write(OutputStream,Lista),

	/* Cerrar el fichero */
	close(OutputStream).

  
			    
			    
			    
			    
			    
			    
			    
			    	
