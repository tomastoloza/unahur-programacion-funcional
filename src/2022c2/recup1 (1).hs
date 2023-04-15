--Ejercicio 1

--Decidir cuales de las siguientes expresiones son validas y cuales no. En caso que sean
--validas, inferir el tipo mas general.

--[length [1,2], sqrt 4]
-- length :: [a] -> Int
-- sqrt :: Floating a => a -> a
-- es invalida porque length devuelve un Int y sqrt devuelve un tipo en la clase Floating, que no es
-- compatible con Int.

--[]:[]
-- es valida, []:[] == [[]], por lo tanto tiene tipo [[a]]

--[] ++ []
-- es valida, []++[] == [], por lo tanto tiene tipo [a]

--undefined ++ [1]
-- es valida, 
--undefined :: a
--[1] :: Num a => [a]
-- por lo tanto la expresion tiene tipo Num a => [a]

--Ejercicio 2
--Implementar recursivamente la funcion ultimosN :: Int −> [a] −> [a] que dado un
-- natural n y una lista xs, devuelve la lista con los ultimos n elementos de xs. Si la lista
-- tiene menos de n elementos, devuelve la lista entera.
--Ej : ultimosN 2 [ 1 , 2 , 3 , 4 ] == [ 3 , 4 ]
--     ultimosN 4 [ 1 , 2 , 3 ] == [ 1 , 2 , 3 ]

ultimosN :: Int -> [a] -> [a]
ultimosN n xs | length xs <= n = xs
ultimosN n (x:xs) = ultimosN n xs

--Ejercicio 3
--Probar por induccion la siguiente propiedad:
--P(xs): para toda lista ys, sumatoria (xs ++ ys) == sumatoria xs + sumatoria ys

--sumatoria [ ] = 0 (S1)
--sumatoria (x:xs) = x + sumatoria xs (S2)

--[ ] ++ ys = ys (C1)
--x:xs ++ ys = x:(xs ++ ys) (C2)

--CB) P([]): sumatoria ([] ++ ys) == sumatoria [] + sumatoria ys

--sumatoria ([] ++ ys) ==(C1) sumatoria ys

--sumatoria [] + sumatoria ys ==(S1) 0 + sumatoria ys == sumatoria ys

--PI) P(xs) => P(x:xs)

--P(x:xs): sumatoria (x:xs ++ ys) == sumatoria (x:xs) + sumatoria ys

--sumatoria (x:xs ++ ys) ==(C2) sumatoria (x:(xs ++ ys)) ==(S2) x + sumatoria (xs ++ ys) ==(HI)
--  == x + sumatoria xs + sumatoria ys ==(S2) sumatoria (x:xs) + sumatoria ys


--Ejercicio 4
--Dar el tipo de la siguiente funcion. Justificar.

f g x y z = uncurry g (head x , y || z )

-- head :: [t] -> t => x :: [t]
-- (||) :: Bool -> Bool -> Bool => y :: Bool, z :: Bool
-- uncurry :: (a -> b -> c) -> (a, b) -> c => g :: a -> b -> c, a = t, b = Bool

-- f :: (a -> Bool -> c) -> [a] -> Bool -> Bool -> c

--Ejercicio 5

--Reescribir la funcion f x y = (x > 0 && y < 2) || x < 3 usando composicion, aplica-
--cion parcial y el estilo point-free en una de las variables.

--f x y = (x>0 && y<2) || x<3
-- f x y = (|| x<3) ((x>0 &&) ((<2) y))
-- f x y = ((|| x<3) . (x>0 &&) . (<2)) y
-- f x = (|| x<3) . (x>0 &&) . (<2)
