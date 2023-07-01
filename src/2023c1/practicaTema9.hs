negarTodos :: [Bool] -> [Bool]
negarTodos = map not

-- Definir sin usar recursión la función sumaOResta :: [(Int,Int )] −> [Int] que, dada una
-- lista de pares de enteros, devuelve la lista con la suma de las coordenadas de los pares
-- si la primera coordenada es par, y la resta si es impar.

sumaOResta :: [(Int,Int)] -> [Int]
--sumaOResta = if even fst xs then map (+) xs else map (-) (xs)
sumaOResta = map (\(x, y) -> if even x then x + y else x - y)

-- Definir sin usar recursión la función paresCuadrados :: [Int] −> [Int] que, dada una
-- lista de enteros, devuelve una lista con los cuadrados de los números pares.
-- Ej: paresCuadrados [2,3,4] == [4,16] .

paresCuadrados :: [Int] -> [Int]
paresCuadrados = map (^2) . filter even

-- Redefinir la funcion filter usando concat y map.
-- concat :: [[a]] -> [a]
-- concat = foldr (++) []

filtrar :: (a -> Bool) -> [a] -> [a]
filtrar f = concat . map (\x -> if f x then [x] else [])

-- 5. Redefinir las funciones map y filter:
-- a) usando foldr.
-- b) usando foldl.

mapear :: (a -> b) -> [a] -> [b]
mapear f = foldr (\x rc -> f x : rc) []

mapeal :: (a -> b) -> [a] -> [b]
mapeal f = foldl (\acc x -> (++) [f x]) []


filtrarFoldr :: (a -> Bool) -> [a] -> [a]
filtrarFoldr f = foldr (\x rc -> if f x then x : rc else rc) []

filtrarFoldl :: (a -> Bool) -> [a] -> [a]
filtrarFoldl f = foldl (\acc x -> if f x then acc ++ [x] else acc) []

{-
6. Definir a partir de los esquemas de foldr y foldl la función cantidad :: [[ a ]] −> Int
que, dada una lista de listas de elementos de tipo a, devuelve la cantidad de elementos
de tipo a entre todas las listas.
Ej: cantidad [[2,3],[1,2,6],[],[3]] == 6.
-}

cantidadFoldr :: [[ a ]] -> Int
cantidadFoldr f = foldr (\xs rc -> length xs + rc) 0

cantidadFoldl :: [[ a ]] -> Int
cantidadFoldl f = foldl (\acc xs -> length xs + acc) 0

--7. Escribir la función (++) usando foldr.
concatFoldr :: [a] -> ([a] -> [a])
concatFoldr = foldr (\x rc ys -> x : rc ys) id

