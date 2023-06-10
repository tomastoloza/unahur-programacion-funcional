-- Programación Funcional - Primer Parcial
-- Modificar nombre del archivo por "nombre-apellido.hs"

-------------- Ejercicio 1 -----------------

-- Definir una función con el siguiente tipo
f1 :: Num a => (a -> b, a -> c) -> a -> (c,b)
f1 (f, g) x = (g x, f x)
-------------- Ejercicio 2 -----------------

-- a) Definir recursivamente una función "repetir" que dado un caracter c y un entero n
-- devuelve el string que tiene el caracter c repetido n veces.
-- Ej: repetir 'a' 3 == "aaa"
repetir :: Char -> Int -> String
repetir _ 0 = ""
repetir c n = c : repetir c (n-1)

-- b) Probar por inducción la siguiente propiedad:
-- P(n): length (repetir 'a' n) == n

-- length :: [a] -> Int
-- length [] = 0                 (L1)
-- length (_:xs) = 1 + length xs (L2)

--By the definition of repetir,
-- repetir 'a' (k+1) = 'a' : repetir 'a' k.
-- By L2, length ('a' : repetir 'a' k) = 1 + length (repetir 'a' k).
-- By the inductive hypothesis, length (repetir 'a' k) == k.
-- Therefore, length ('a' : repetir 'a' k) = 1 + k = (k+1).

-------------- Ejercicio 3 -----------------

f :: [Int]  -> Int
f []                    = 0
f [_]                   = 0
f (_:y:xs)              = max (f xs) y

-- reducir la expresión f [f [1],3,4,2] con orden normal.

-- f [f [1],3,4,2]
-- max (f [4,2]) 3
-- max (max (f []) 2) 3
-- max (max 0 2) 3
-- max 2 3
-- 3

-- f [f [1],3,4,2]
-- f (_:3:[4,2]) == max (f [4,2]) 3
-- f (_:2:[]) == max (max (f []) 2) 3
-- max (max 0 2) 3
-- max 2 3
-- 3

-------------- Ejercicio 4 -----------------

-- verificar la siguiente igualdad: uncurry (*) . (\x -> (2,x)) == (2*)
