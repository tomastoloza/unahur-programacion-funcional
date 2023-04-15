--1. Dar un tipo válido para las siguientes expresiones.
--1 + 1.0 // Float
--1/2  // Float
--div 1 2 // Int
--mod 2 3 == 0 // Bool
--(1, True) // (Int, Bool)
--2. Dar el tipo de las siguientes funciones.

sucesor x = x + 1
--    Asi no porque es una clase de tipo Num → Num
--    Seria Num a ⇒ a → a

segundo _ y = y
--a -> b -> b

suma' x = fst x + snd x
-- Num a => (a, a) -> a

repetido x = (x, x)
--a -> (a, a)

--3. Dada la siguiente función decir cuáles de las expresiones son correctas y cuáles no.
--suma :: Float -> Float ->Float
--suma x y = x + y -- ok
--suma (sqrt 2) 3 -- ok
--suma 2.0 3.0 -- ok
--suma (mod 4 3) 1.5 -- nok mod devuelve Integral
--suma 0 False -- nok segundo param es Bool

--4. Definir funciones que tengan los siguientes tipos.
f1 :: Int -> Int -> Int -> Int
f1 x y z = x
--f2 :: Bool -> a -> a -> a
f2 x y z = if x then y else z
--f3 :: (a,b) -> c -> (c,b,a)
f3 (x,y) z = (z, y, x)
