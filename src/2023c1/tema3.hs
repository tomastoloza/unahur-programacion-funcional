--1. sumaTerna: dada una terna de enteros, calcula la suma de sus
--tres elementos.
sumaTerna :: Num a => (a, a, a) -> a
sumaTerna (x,y,z) = x + y + z
--2. todoMenor: dadas dos ternas de números reales, decide si es
--cierto que cada coordenada de la primera es menor a la
--coordenada correspondiente de la segunda.

todoMenor :: Ord a => (a,a) -> (a, a) -> Bool
todoMenor x y = fst x < fst y && snd x < snd y

--3. posicPrimerPar: dada una terna de enteros, devuelve la
--posición del primer número par si es que hay alguno, y
--devuelve 4 si son todos impares.


posicPrimerPar :: (Int, Int, Int) -> Int
posicPrimerPar (x, y, z)
    | x `mod` 2 == 0  = 1
    | y `mod` 2 == 0  = 2
    | z `mod` 2 == 0  = 3
    | otherwise       = 4

--4. crearPar :: a -> b -> (a, b): crea un par a partir de sus dos
--componentes dadas por separado (debe funcionar para
--elementos de cualquier tipo).
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)
--5. invertir :: (a, b) -> (b, a): invierte los elementos del par
--pasado como parámetro (debe funcionar para elementos de
--cualquier tipo).

invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)
