
data Figura = Circulo Float | Rectangulo Float Float

esCuadrado :: Figura -> Bool
esCuadrado (Rectangulo x y) = x == y
esCuadrado _ = False


data Color = Rojo | Azul
--data FiguraC = Circulo Float Color | Rectangulo Float Float Color

--esValida :: FiguraC -> Bool
-- esValida (Circulo x Rojo) = True
-- esValida (Circulo Rojo) = True


data Arbol a = Hoja a | Nodo a ( Arbol a ) ( Arbol a )

--esNodoInterno :: Int -> Arbol Int -> Bool
--esNodoInterno x (Nodo a izq der) = x == a esNodoInterno izq && esNodoInterno der


maximosPositivos :: [(Int, Int)] -> [Int]
maximosPositivos = map (\(x,y) -> max x y) . filter (\(x,y) -> x > 0 && y > 0)

primerAparicion :: Char -> String -> Int
primerAparicion z = foldl (\acc x -> if z == x then acc else acc + 1) 0



--concatenarTodas :: [[a]] -> [a]
--concatenarTodas :: foldr (++) []

--filter1 f = concatenarTodas . map (\x -> if f x then [x] else [])

eliminarChar c = map(filter (/= c))



--Definir la función many :: Int -> (a -> a) -> a -> a que dado
--un entero n una función f y un valor x, aplica n veces la
--funcion f al valor x.

many :: Int -> (a -> a) -> a -> a
many 0 _ x = x
many n f x = many (n-1) f (f x)

-- Reescribir many con el estilo point-free.
--manyPointFree :: Int -> (a -> a) -> a -> a
--manyPointFree 0 = const id
--many n f = \x -> (many (n-1) f) (f x)
--manyPointFree n f = many (n-1) f . f

-- Definir twice a partir de many de la forma más simple posible.
twice = many 2


--Calcular la suma de los cuadrados de los elementos de una lista.
sumSquares :: [Int] -> Int
-- [1,2,3] == [1^2, 2^2, 3^3] == 1+4+9
--sumSquares = (foldr (+) 0) . map (^2)
sumSquares = sum . map (^2)

--Combinar dos listas de la misma longitud en una única lista de pares.
--[1,2,3] [4,5,6] = [(1,4), (2,5), (3,6)]
combineLists :: [a] -> [b] -> [(a, b)]
--combineLists [x] [y] = [(x,y)]
--combineLists (x:xs) (y:ys) = (x,y) : combineLists xs ys
combineLists = zip
--Filtrar los elementos que cumplen cierta condición en una lista.
filterCondition :: (a -> Bool) -> [a] -> [a]
filterCondition = filter

--Convertir una lista de strings en una lista de sus longitudes.
lengths :: [String] -> [Int]
lengths = map length

--Obtener el máximo elemento de una lista de números.
maximumElement :: Ord a => [a] -> a
maximumElement = foldl1 max
----Dada una lista de funciones, aplicarlas sucesivamente a un valor inicial.
applyFunctions :: a -> [a -> a] -> a
applyFunctions = foldl(\acc x -> (f x ): acc) []