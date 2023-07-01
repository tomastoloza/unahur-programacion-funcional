{- 1. Definir la función negarTodos :: [Bool] −> [Bool] de forma recursiva y usando map.
Ej: negarTodos [True,False,True] [False,True,False].

2. Definir sin usar recursión la función sumaOResta :: [(Int,Int )] −> [Int] que, dada una
lista de pares de enteros, devuelve la lista con la suma de las coordenadas de los pares
si la primera coordenada es par, y la resta si es impar.

3. Definir sin usar recursión la función paresCuadrados :: [Int] −> [Int] que, dada una
lista de enteros, devuelve una lista con los cuadrados de los números pares.
Ej: paresCuadrados [2,3,4] == [4,16] .
4. Redefinir la funcion filter usando concat y map.
concat : : [ [ a ] ] −> [ a ]
concat = fo ldr (++) [ ]
5. Redefinir las funciones map y filter:
a) usando foldr.
b) usando foldl.
6. Definir a partir de los esquemas de foldr y foldl la función cantidad :: [[ a ]] −> Int
que, dada una lista de listas de elementos de tipo a, devuelve la cantidad de elementos
de tipo a entre todas las listas.
Ej: cantidad [[2,3],[1,2,6],[],[3]] == 6.
7. Escribir la función (++) usando foldr.
-}

-- 1. Recursion

negarTodos :: [Bool] −> [Bool]
negarTodos [] = []
negarTodos (x:xs) = not x : negarTodos xs

-- negarTodos [True,False,True] == [False,True,False]

-- con map

negarTodos' :: [Bool] -> [Bool]
negarTodos' = map not

-- 2.
sumaOResta :: [(Int,Int)] -> [Int]
--sumaOResta = map (\(x,y) -> if even x then x + y else x - y)
sumaOResta = map f

f :: [(Int,Int)] -> Int
f (x,y) = if even x then x + y else x - y

-- 3.
paresCuadrados :: [Int] -> [Int]
paresCuadrados = map (^2) . filter even
--paresCuadrados xs = map (^2) $ filter even xs

--4. Redefinir la funcion filter usando concat y map.

--concat :: [[a]] -> [a]
--concat = foldr (++) []

--concat [[1], [], [2,3]]

--[1] ++ ([] ++ ([2,3] ++ [])) == [1,2,3]

filter :: (a -> Bool) -> [a] -> [a]
filter f = concat . map (\x -> if f x then [x] else [])

filter even [1,2,3]

[1,2,3,4] => [[], [2], [], [4]] => [2,4]

--5. Redefinir las funciones map y filter:
--a) usando foldr.
--b) usando foldl.

(map _) [] = []
(map f) (x:xs) = f x : rc
  where rc = map f xs

map :: (a -> b) -> [a] -> [b]
map f = foldr (\x rc -> f x : rc) []

map f = foldl (\acc x -> acc ++ [f x]) []

filter :: (a -> Bool) -> [a] -> [a]
filter f = foldr (\x rc -> if f x then x : rc else rc) []

filter f = foldl (\acc x -> if f x then acc ++ [x] else acc) []

-- 6.
cantidad :: [[a]] -> Int
cantidad = foldr f 0
  where f xs rc = length xs + rc

-- cantidad [[2,3],[1,2,6],[],[3]] == 6.

cantidad = foldl f 0
  where f acc xs = acc + length xs

--7. Escribir la función (++) usando foldr.

[a] -> b

(++) :: [a] -> ([a] -> [a])
(++) [] = id
(++) (x:xs) = \ys ->  x : rc ys
  where rc = (++) xs

(++) = foldr (\x rc ys ->  x : rc ys) id