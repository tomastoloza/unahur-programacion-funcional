-- 1

--Definir sin usar recursión la función sumaOResta :: [(Int,Int )] -> [Int] que, dada una
--lista de pares de enteros, devuelve la lista con la suma de las coordenadas de los pares
--si la primera coordenada es par, y la resta si es impar.
--Ej: sumaOResta [(2,5), (3,7), (6,-2), (0, 3)] == [7, -4, 4, 3]

sumaOResta :: [(Int, Int)] -> [Int]
sumaOResta = map (\(x,y) -> if even x then x + y else x - y)

-- 2

--Usando el esquema de fold adecuado implementar mapMany :: [a -> a] -> [a] -> [a]
--que dada una lista de funciones fs y una lista de elementos xs, aplica las funciones de
--fs en orden (de izquierda a derecha) a todos los elementos de xs.
--Ej: mapMany [(+1), (*3)] [1,2,3] == [6,9,12]

mapMany :: [a -> a] -> [a] -> [a]
mapMany fs xs = foldl (\acc f -> map f acc) xs fs


--3

--Completar la definición de la función sumaYProd :: [Int] -> (Int, Int) que dada una
--lista de enteros devuelve el par con la suma de los elementos de la lista en la primera
--coordenada y el producto de los elementos en la segunda.
--Ej: sumaYProd [1,3,5] == (9, 15)

sumaYProd :: [Int] -> (Int, Int)
sumaYProd xs = ((foldl (+) 0 xs), (foldl (*) 1 xs))

--4

--Dados los siguientes tipos de datos algebraicos.

data N = Uno | S N
data Z = Cero | Pos N | Neg N
data Q = Fraccion Z Z

--donde un numero racional se representa como el cociente entre dos números enteros, por
--ejemplo: una representación posible de -1/3 es 
-- Fraccion (Pos Uno) (Neg (S (S Uno)))

--Definir la función esValida :: Q -> Bool que devuelve True sii la fracción no
--tiene denominador nulo.

esValida :: Q -> Bool
esValida (Fraccion _ Cero) = False
esValida _ = True


--Definir la función esPositiva :: Q -> Bool que devuelve True sii la fracción representa
--un número positivo.

esPositiva :: Q -> Bool
esPositiva (Fraccion (Pos _) (Pos _)) = True
esPositiva (Fraccion (Neg _) (Neg _)) = True
esPositiva _ = False

--5

--Dado el tipo de árboles ternarios estrictos:
data Arbol a = Hoja a | Nodo a ( Arbol a ) ( Arbol a ) ( Arbol a )

--Escribir el esquema de fold en árboles y usarlo para definir una función maximo :: Arbol Int -> Int
--que devuelve el máximo entero en un árbol de enteros no vacío.

--foldA :: (a -> b) -> (a -> b -> b -> b -> b) -> Arbol a -> b

--maximo :: Arbol Int -> Int