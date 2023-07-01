-------------- Ejercicio 1 -----------------

concatenarTodas :: [[a]] -> [a]
concatenarTodas = foldr (++) []

-- Redefinir la funcion filter usando concatenarTodas y map.

filter1 f = concatenarTodas . map (\x -> if f x then [x] else [])


-------------- Ejercicio 2 -----------------

-- Definir sin usar recursión la función
-- eliminarChar :: Char -> [String] -> [String] que, dado un caracter c y una lista de strings l,
-- devuelve la lista que resulta de eliminar el caracter c de cada string.
-- Ej: eliminarChar 'e' ["esto", "es", "una", "lista", "de", "strings"] ~> ["sto","s","una","lista","d","strings"]
--eliminarChar c = map (filter (\y -> y /= c))
eliminarChar :: Char -> [String] -> [String]
eliminarChar c = map . (filter (/=) c)

-------------- Ejercicio 3 -----------------

-- Definir sin usar recursión la función
-- paridad :: [String] -> [Int] que, dada una lista de strings,
-- devuelve la lista con la paridad de cada string, es decir, un 0 si la longitud del string es par, y un 1 si es impar.
-- Ej: paridad ["esto", "es", "una", "lista", "de", "strings"] ~> [0, 0, 1, 1, 0, 1]

paridad = map(\x -> if even x then 0 else 1)

-------------- Ejercicio 4 -----------------

-- Definir sin usar recursión la función
-- filterMapPar :: (a -> Bool) -> (b -> c) -> [(a,b)] -> [(a,c)] que, dadas dos funciones f y g, y una lista de listas de pares,
-- filtra los pares cuya primer coordenada verifica f y le aplica g a la segunda.
-- Ej: filterMapPar (>0) (+1) [(2,2),(1,4),(0,3)] ~> [(2,3),(1,5)].
--     filterMapPar (==[]) not [([],True), ([1,2,3],False)] ~> [([],False)]

--filterMapPar f g =  map ((x, y) -> (x, g y)) . (filter ((x, y) -> f x))
filterMapPar :: (a -> Bool) -> (b -> c) -> [(a,b)] -> [(a,c)]
filterMapPar f g =  map (\(x, y) -> (x, g y)) . (filter (f . fst))