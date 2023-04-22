factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

esPar :: Int -> Bool
esPar 0 = True
esPar 1 = False
esPar n = esPar (n-2)

esMultiplo3 :: Int -> Bool
esMultiplo3 0 = False
esMultiplo3 1 = False
esMultiplo3 2 = False
esMultiplo3 3 = True
esMultiplo3 n = esMultiplo3 (n-3)

sumaImpares :: Int -> Int
sumaImpares 0 = 0
sumaImpares n = (2*n) - 1 + sumaImpares (n-1)


--1. Implementar recursivamente las siguientes funciones.

--f(n) = 2^n
dosPorN :: Int -> Int
dosPorN 0 = 1
dosPorN 1 = 2
dosPorN n = 2 + (dosPorN (n-1))

-- f(n) = 3^n
tresALaN :: Int -> Int
tresALaN 0 = 1
tresALaN 1 = 3
tresALaN n = 3 * (tresALaN (n-1))

sumatoria :: Int -> Int
sumatoria 0 = 0
sumatoria 1 = 1
sumatoria n = sumatoria (n-1) + n

sumatoriaAlCuadrado :: Int -> Int
sumatoriaAlCuadrado 0 = 0
sumatoriaAlCuadrado 1 = 1
sumatoriaAlCuadrado n = sumatoriaAlCuadrado (n-1) + n^2

