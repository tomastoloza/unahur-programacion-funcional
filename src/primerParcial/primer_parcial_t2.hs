-- Programación Funcional - Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: (Eq a, Num b) => a -> (b -> a) -> (a, a)
f1 bool x = (bool, bool)
-------------- Ejercicio 2 -----------------

-- a) Definir recursivamente una función "repetir" que dado un par de enteros (n,m)
-- devuelve la lista que tiene el entero m repetido n veces.
-- Ej: repetir (3,1) == [1,1,1]

repetir :: (Int, Int) -> [Int]
repetir (0, _) = [] -- R1
repetir (n, m) = m : repetir (n-1, m) -- R2

-- b) Probar por inducción la siguiente propiedad:
-- P(n): length (repetir (n,m)) == n

-- length :: [a] -> Int
-- length [] = 0                 (L1)
-- length (_:xs) = 1 + length xs (L2)

-- P(0): length (repetir (0,m)) == 0
-- P(0): length ([]) == 0 (R1)
-- P(0): 0 == 0 (L1)

-- P(n+1): length (repetir (n+1,m)) == n+1 (R2)
-- P(n+1): length (m : repetir (n, m)) == n+1 (L2)
-- P(n+1):  1 + length (repetir (n, m)) == n+1 (HI)
-- P(n+1):  1 + n == n + 1


-------------- Ejercicio 3 -----------------

f :: [Int] -> Int
f []                    = 1
f [_]                   = 1
f (x:_:xs)              = div x (f xs)

-- reducir la expresión f [1,f [3],4,2] con orden normal.
-- f [1,f [3],4,2]
-- div 1 (f [4,2])
-- div 1 (div 4 (f []))
-- div 1 (div 4 1)
-- div 1 4
-- 1/4


-------------- Ejercicio 4 -----------------

-- verificar la siguiente igualdad: uncurry (+) . (\x -> (x,1)) == (+1)