-- Ejercicio 1
-- Definir sin usar recursión la función verificanEn :: Int −> [Int −> Bool] −> [Int −> Bool]
--que, dado un entero x y una lista de predicados, devuelve la lista con los predicados que son
--verdaderos en x. Ej: verificanEn 3 [(>2), (>5), (<3), (==3)] == [(>2), (==3)]

verificanEn :: Int -> [Int -> Bool] -> [Int -> Bool]
verificanEn x = filter (\f -> f x)

-- Ejercicio 2
-- Definir sin usar recursión la función dobleDeTrue :: [( Int ,Bool)] −> [Int] que, dada una lista
--de pares, devuelve la lista con los dobles de los enteros de los pares cuya segunda coordenada
--es True. Ej: dobleDeTrue [(5,True), (7,False), (-2,False), (3,True)] == [10, 6]

dobleDeTrue :: [(Int, Bool)] -> [Int]
dobleDeTrue = map (\(x,y) -> 2*x) . filter snd

-- Ejercicio 3
-- Usando el esquema de fold adecuado implementar componerTodas :: [a −> a] −> a −> a que
--dada una lista de funciones fs, devuelve la composición de las funciones de fs en orden. Ej:
--componerTodas [(+1), (*3), (^2)] 5 == 5^2 ∗ 3 + 1

componerTodas :: [a -> a] -> a -> a
componerTodas = foldr1 (.)
--otra opcion:
--componerTodas = foldr (.) id

--Ejercicio 4
--dado el tipo de datos algebraico que representa los números naturales
data Nat = Cero | S Nat
--Definir la función maximo :: Nat -> Nat -> Nat que dados dos números naturales devuelve el
--máximo entre ellos.

maximo :: Nat -> Nat -> Nat
maximo Cero m = m
maximo n Cero = n
maximo (S n) (S m) = S (maximo n m) -- esta igualdad equivale a "max(n+1, m+1) = 1 + max(n,m)"

--Ejercicio 5
--Dado el siguiente tipo de datos algebraico para representar las fórmulas de la lógica proposi-
--cional que usan los conectivos ¬ y ∨:

data Prop = Var Int | Not Prop | Or Prop Prop

--Por ejemplo, la fórmula α = (¬p ∨ q) se representa de la siguiente forma:
alpha = Not (Var 0) `Or` Var 1
--Escribir el esquema de fold en Prop y usarlo para definir la función
--reemplazar :: Int −> Prop −> Prop −> Prop que dado el índice de una variable y dos
--fórmulas f y g, devuelve la fórmula que resulta de reemplazar todas las apariciones de la
--variable en g por f.
--Ej: reemplazar 1 (Not (Var 2)) (Not (Var 0 `Or` Var 1)) == Not (Var 0 ‘Or‘ Not (Var 2))

foldP :: (Int -> a) -> (a -> a) -> (a -> a -> a) -> Prop -> a
foldP f _ _ (Var x) = f x
foldP f g h (Not p) = g (foldP f g h p)
foldP f g h (Or p1 p2) = h (foldP f g h p1) (foldP f g h p2)

reemplazar :: Int -> Prop -> Prop -> Prop
reemplazar x f = foldP (\y -> if x==y then f else Var y) Not Or


reemplazarR x _ (Var x) = Var x
reemplazarR x v1 (Not p) = Not (reemplazar x v1)
reemplazarR x v1 (Then p q) = Then (reemplazar x v p) (reemplazar x v q)