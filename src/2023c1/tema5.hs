{-
Definir recursivamente la función sum :: Num a => [a] -> a que
suma todos los elementos de una lista de números. Ej:
sum [1,3,5] 1+3+5 9.
-}

sumatoria :: Num a => [a] -> a
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--Decir cuáles de las siguientes expresiones son válidas y dar un tipo válido para ellas.
{-
[] -- ok [a]
[3, 1.0, 2] -- Num a => [a]
[2 :: Int, 1.0 , 2] -- no
[True, [False]] -- no [a, [a]]
-}


-- 2. Implementar recursivamente las siguientes funciones.
-- sumaLista :: [ Int] −> Int que calcula la suma de todos los elementos de la lista.
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista (x:xs) = x + sumaLista xs

-- prodLista :: [ Int] −> Int que calcula el producto de todos los elementos de la lista.
prodLista :: [Int] -> Int
prodLista [x] = x
prodLista (x:xs) = x * prodLista xs

-- todosPares :: [ Int] −> Bool que devuelve True si y solo si todos los elementos de la lista son pares.
todosPares :: [Int] -> Bool
todosPares [] = False
todosPares [x] = even x
todosPares (x:xs) = todosPares [x] && todosPares xs

-- todosIguales :: [ Int] −> Bool que devuelve True si y solo si todos los elementos de la lista son iguales.
todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales [_] = True
todosIguales (x:xs) = x == head xs && todosIguales xs

-- pertenece :: Eq a => a −> [a] −> Bool
-- que toma un elemento x y una lista xs y devuelve True si y solo si x pertenece a xs.
pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece x (y:ys) = x == y || pertenece x ys
