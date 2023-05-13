{- 1.
f(n) = 2n, n natural

2*n = 2 + 2 + ... + 2 (n veces)
      = 2 + 2*(n-1)

f(n) = 2 + f(n-1)

f(0) = 0
f(1) = 2
f(2) = 4
f(3) = 6
f(4) = 8
...
f(n-1) = x
f(n)   = x + 2

RECURSION:
f(0) = 0     (CB)
f(n) = f(n-1) + 2, si n > 0


a = b y b = c => a = c (transitividad)

-}

doble :: Int -> Int
doble 0 = 0                --(D1)
doble n = doble (n-1) + 2  --(D2)

{-
2. doble es correcta:

P(n): doble n == 2*n, donde n es un numero natural

CB) P(0): doble 0 == 2*0

Por un lado, doble 0 ==(D1) 0

Por otro lado, 2*0 == 0

Por lo tanto, vale P(0).

PI) P(n) => P(n+1)

HI) P(n): doble n == 2*n (ya lo sé, es un dato)

T) P(n+1): doble (n+1) == 2*(n+1) (es lo que quiero probar)

Por un lado, doble (n+1) ==(D2) doble ((n+1)-1) + 2 == doble n + 2 ==(HI) 2*n + 2

Por otro lado, 2*(n+1) == 2*n + 2*1 == 2*n + 2

Por lo tanto, vale P(n+1).

}

{-
P(n): factorial n > 2n si n>=4

--------------------------------------

Cambio de variable (no es necesario)
m = n-4
m+4 = n

m+4 >= 4
m >= 0
m es un natural

P(m): factorial (m+4) > 2*(m+4) para todo m natural

P(n): factorial (n+4) > 2*(n+4) para todo n natural

--------------------------------------

Demostracion por induccion:

CB) P(4): factorial 4 > 2*4

PI) P(n) => P(n+1), donde n>=4

(terminar)
--------------------------------------

P(1): factorial 1 > 2*1

factorial 1 == 1
2*1 == 2

P(1): 1 > 2 (es falso)

No vale P(1)

-}

---------------------------------------
4.

Maximo comun divisor (mcd)

12 -> 1, 2, 3, 4, 6, 12
8  -> 1, 2,    4, 8

divisores comunes: 1, 2, 4 => mcd(12,8) = 4


5 -> 1, 5
0 -> 1, 2, 3, 4, 5, 6, 7, ...
divisores comunes: 1, 5
mcd(5,0) = 5

mcd(n,0) = n para todo n natural mayor que 0
mcd(0,0) = 0

Entonces mcd(n,0) = n para todo n natural (CB)

mcd(12,8) = mcd(8,4) = mcd(4,0) = 4

12 = 8*1 + 4
8 = 4*2 + 0

mcd(n,m) = mcd(m, n `mod` m), m>0 (Recursion)

mcd(0,n) = mcd(n,0), n>0

n = m*q + r

q = n `div` m
r = n `mod` m

Recursion:

mcd(n,0) = n para todo n natural (CB)
mcd(n,m) = mcd(m, n `mod` m), m>0

-}

mcd :: Int -> Int -> Int
mcd n 0 = n
mcd n m = mcd m (n `mod` m)


{- Escribir una funcion que, dado un entero x mayor a 0, 
calcule el exponente de la mayor potencia de 2 que divide a x.

Ejemplos:

40 = 8*5 = 2^3 * 5 => maxPotencia2QueDivide 40 = 3


potencias de 2: 2^0, 2^1, 2^2, 2^3, ...
                1  , 2  , 4  , 8

maxPotencia2QueDivide 1 = 0
maxPotencia2QueDivide 2 = 1
maxPotencia2QueDivide 3 = 0
maxPotencia2QueDivide 4 = 2
maxPotencia2QueDivide 5 = 0
maxPotencia2QueDivide 6 = 1
maxPotencia2QueDivide 7 = 0
maxPotencia2QueDivide 8 = 3
...


40 -> 20 -> 10 -> 5 (40 se puede dividir 3 veces por 2 de forma entera)
maxPotencia2QueDivide 40 = 3
maxPotencia2QueDivide 20 = 2
maxPotencia2QueDivide 10 = 1
maxPotencia2QueDivide 5  = 0

maxPotencia2QueDivide n = maxPotencia2QueDivide (n `div` 2) + 1      (si n es par)

casos base:
maxPotencia2QueDivide n = 0     (si n es impar)


-}

maxPotencia2QueDivide :: Int -> Int
maxPotencia2QueDivide n | even n    = maxPotencia2QueDivide (n `div` 2) + 1
                        | otherwise = 0

{-
Correctitud:

P(n): "maxPotencia2QueDivide n" calcula el exponente de la mayor potencia de 2
que divide a n.

CB) n impar => even n == False => maxPotencia2QueDivide n == 0

Por otro lado, n impar => 2 no divide a n => la mayor potencia de 2
que divide a n es 0.

PI) n par, P(n) => P(2*n)
HI) "maxPotencia2QueDivide n" calcula el exponente de la mayor potencia de 2
que divide a n.

T) "maxPotencia2QueDivide (2*n)" calcula el exponente de la mayor potencia de 2
que divide a 2*n.

even (2*n) == True => maxPotencia2QueDivide (2*n) == maxPotencia2QueDivide ((2*n) `div` 2) + 1
== maxPotencia2QueDivide n + 1

Por otro lado, 
el exponente de la mayor potencia de 2 que divide a 2*n 
== (el exponente de la mayor potencia de 2 que divide a n) + 1 
==(HI) maxPotencia2QueDivide n + 1

-}                        