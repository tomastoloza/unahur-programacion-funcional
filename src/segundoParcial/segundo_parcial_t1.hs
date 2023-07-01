-------------- Ejercicio 1 -----------------

-- Definir sin usar recursión la función
-- filtrarPares :: [[(Int,Int)]] -> [[(Int,Int)]] que, dada una lista de listas de pares de enteros,
-- filtra los pares cuya suma es mayor a 0.
-- Ej: filtrarPares [[(1,-1)], [(-3,2),(1,5)], [(0,1),(2,-1)]] ~> [[], [(1,5)], [(0,1),(2,-1)]].


-------------- Ejercicio 2 -----------------

-- Definir, usando el esquema de fold adecuado, la función
-- restas :: [Int] -> Int que, dada una lista de enteros,
-- devuelve la resta de todos ellos asociada a derecha.
-- Ej: restas [1,2,3,4] ~> 1 - (2 - (3 - 4))

-------------- Ejercicio 3 -----------------

data Nat = Zero | Succ Nat deriving Show

-- Definir la función restaTruncada :: Nat -> Nat -> Nat
-- que dados dos naturales n y m devuelve la resta n-m si n es mayor que m,
-- y devuelve Zero en otro caso.
--Ej: restaTruncada (Succ (Succ Zero)) (Succ Zero) ~> Succ Zero
-- restaTruncada (Succ Zero) (Succ (Succ Zero)) ~> Zero

-------------- Ejercicio 4 -----------------

data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)

foldA :: (a -> b) -> (a -> b -> b -> b) -> Arbol a -> b
foldA f _ ( Hoja x) = f x
foldA f g ( Nodo x izq der) = g x ( foldA f g izq ) ( foldA f g der)

-- a) Definir, sin usar recursión explícita, una función esNodoInterno :: Int -> Arbol Int -> Bool
-- que devuelve True sii el entero está en algún nodo que no es una hoja.
-- Ej: esNodoInterno 2 (Nodo 1 (Nodo 2 (Hoja 0) (Hoja 3)) (Hoja (-3))) ~> True
--     esNodoInterno 3 (Nodo 1 (Nodo 2 (Hoja 0) (Hoja 3)) (Hoja (-3))) ~> False

-- b) Definir, sin usar recursión explícita, una función pasarALista :: Arbol Int -> [Int] 
-- que devuelve la lista de todos los elementos positivos en un árbol de números enteros.
-- Ej: pasarALista (Nodo 1 ( Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) ~> [1,2,5]
