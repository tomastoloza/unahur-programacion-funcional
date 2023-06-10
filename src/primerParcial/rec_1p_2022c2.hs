--Ejercicio 1

--Decidir cuales de las siguientes expresiones son validas y cuales no. En caso que sean
--validas, inferir el tipo mas general.

-- [length [1,2], sqrt 4]
-- length :: [a] -> Int
-- sqrt :: Floating a => a -> a
-- []:[]
-- [] ++ []
-- undefined ++ [1]
-- undefined :: a
-- [1] :: Num a => [a]

-- Ejercicio 2
-- Implementar recursivamente la funcion ultimosN :: Int −> [a] −> [a] que dado un
-- natural n y una lista xs, devuelve la lista con los ultimos n elementos de xs. Si la lista
-- tiene menos de n elementos, devuelve la lista entera.
-- Ej : ultimosN 2 [ 1 , 2 , 3 , 4 ] == [ 3 , 4 ]
--     ultimosN 4 [ 1 , 2 , 3 ] == [ 1 , 2 , 3 ]

-- ultimosN 2 [ 1 , 2 , 3 , 4 ]
-- ultimosN 1 [ 2 , 3 , 4 ]
-- ultimosN 0 [ 3 , 4 ]

ultimosN :: Int -> [a] -> [a]
ultimosN n [] = []
ultimosN n (x:xs) | n <= 0 = x:xs
                  | otherwise = ultimosN (n-1) xs

-- Ejercicio 3
-- Probar por induccion la siguiente propiedad:
-- P(xs): para toda lista ys, sumatoria (xs ++ ys) == sumatoria xs + sumatoria ys

-- sumatoria [ ] = 0 (S1)
-- sumatoria (x:xs) = x + sumatoria xs (S2)

-- [ ] ++ ys = ys (C1)
-- x:xs ++ ys = x:(xs ++ ys) (C2)

-- P(xs): para toda lista ys, sumatoria (xs ++ ys) == sumatoria xs + sumatoria ys

-- P([]): sumatoria ([] ++ ys) == sumatoria [] + sumatoria ys (C1)
-- P([]): sumatoria ys == sumatoria [] + sumatoria ys (S1)
-- P([]): sumatoria ys == 0 + sumatoria ys (S1)
-- P([]): sumatoria ys == sumatoria ys

-- P((x:xs)): para toda lista ys, sumatoria ((x:xs) ++ ys) == sumatoria (x:xs) + sumatoria ys
-- P((x:xs)): sumatoria ((x:xs) ++ ys) == sumatoria (x:xs) + sumatoria ys (C2)
-- P((x:xs)): sumatoria (x:(xs ++ ys)) == sumatoria (x:xs) + sumatoria ys (S2)
-- P((x:xs)): x + sumatoria (xs ++ ys) == x + sumatoria xs + sumatoria ys (S2)
-- P((x:xs)): x + sumatoria (xs ++ ys) == x + sumatoria xs + sumatoria ys (HI)
-- P((x:xs)): x + sumatoria (xs ++ ys) == x + sumatoria (xs ++ ys)
