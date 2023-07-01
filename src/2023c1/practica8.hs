--Definir una función esCuadrado :: Figura −> Bool que devuelve true sii la figura es un cuadrado.
data Figura = Circulo Float | Rectangulo Float Float
esCuadrado :: Figura -> Bool
esCuadrado (Circulo _) = False
esCuadrado (Rectangulo x y) = x == y

--Definir una función esValida :: FiguraC −> Bool que devuelve true sii la figura es
--válida, sabiendo que una figura sólo puede tener color rojo si es un círculo o su área es
--mayor a 10.
data Color = Rojo | Azul
data FiguraC = Circ Float Color | Rect Float Float Color

esValida :: FiguraC -> Bool
esValida (Rect x y Rojo) = x*y>10
esValida _ = True

-- Definir la función restaTruncada :: Nat −> Nat −> Nat que dados dos naturales n y m
-- devuelve la resta n-m si n es mayor que m, y devuelve Zero en otro caso.
data Nat = Zero | Succ Nat

restaTruncada :: Nat -> Nat -> Nat
restaTruncada Zero _ = Zero
restaTruncada n Zero = n
restaTruncada (Succ n) (Succ m) = restaTruncada n m

--Definir la función mayor :: Nat -> Nat -> Bool que dados dos naturales devuelve
--true si el primero es mayor que el segundo.

mayor :: Nat -> Nat -> Bool
mayor Zero _ = False
mayor _ Zero = True
mayor (Succ n) (Succ m) = mayor n m

--Definir recursivamente una función espejar :: Arbol a −> Arbol a que devuelve el
--árbol espejado, es decir, todo hijo izquierdo pasa a ser el derecho y viceversa.
data Arbol a = Hoja a | Nodo a ( Arbol a ) ( Arbol a )
--Ej: espejar (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) == Nodo 1 (Hoja (-3))
--(Nodo 2 (Hoja 5) (Hoja 0))

espejar :: Arbol a -> Arbol
espejar (Hoja a) = (Hoja a)
espejar (Nodo n izq der) = (Nodo n (espejar der) (espejar izq))

--Definir recursivamente una función todosMenores :: Ord a => a −> Arbol a −> Bool
--  que toma un valor x y un árbol, y devuelve True sii todos los elementos del árbol son
--  menores a x.
--  Ej: todosMenores 6 (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) == True
--  todosMenores 3 (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) == False

todosMenores :: Ord a => a -> Arbol a -> Bool
todosMenores x (Hoja y) = y < x
todosMenores x (Nodo y izq der) = y < x && (todosMenores x izq) && (todosMenores x der)
--Dado el siguiente tipo de datos algebraico:
--data Polinomio = Monomio Int Int | Suma Polinomio Polinomio
--donde (Monomio a n) representa el monomio "a*X^n".

--Ej: p = Suma (Monomio 1 2) (Monomio 2 0) representa el polinomio "X^2 + 2"
--q = Suma (Monomio (-1) 3) (Monomio 1 0) representa el polinomio "−X^3 + 1"
--   a) Hacer que los polinomios se muestren por pantalla como el string que representan.
--   b) Definir recursivamente la función coeficiente :: Polinomio −> Int −> Int que
--dado un polinomio p y un índice, devuelve el valor del coeficiente de p correspondiente al índice. Ej: coeficiente p 0 == 2, coeficiente p 2 == 1 y coeficiente p x
--== 0 para cualquier x distinto de 0 y 2.
--   c) Definir recursivamente la función evaluar :: Int −> Polinomio −> Int que toma
--un entero x y un polinomio p y devuelve el resultado de p(x).
--   d) Definir recursivamente la funcion producto :: Polinomio −> Polinomio −> Polinomio
--que caclula el producto de polinomios.
--Ej: producto p q == Suma (Suma (Monomio (-1) 5) (Monomio 1 2)) (Suma
--(Monomio (-2) 3) (Monomio 2 0))
--o cualquier polinomio equivalente a "−X^5 − 2X^3 + X^2 + 2".

data Polinomio = Monomio Int Int | Suma Polinomio Polinomio

-- a
instance Show Polinomio where
show :: Polinomio -> String
show (Monomio a n) = show a ++ "*X^" ++ show n
show (Suma p q) = show p ++ "+" ++ show q

-- b
coeficiente :: Polinomio −> Int −> Int
coeficiente (Monomio a n) i = if i == n then a else 0
coeficiente (Suma p q) i = coeficiente p i + coeficiente q i

-- c

evaluar :: Int -> Polinomio -> Int
evaluar x (Monomio a n) = a * x ^ n
evaluar x (Suma p q) = evaluar x p + evaluar x q

--d
producto :: Polinomio -> Polinomio -> Polinomio
producto (Monomio a n) (Monomio b m) = Monomio (a*b) (n+m)
producto p (Suma q r) = Suma (producto p q) (producto p r)
producto (Suma p q) r = Suma (producto p r) (producto q r)


