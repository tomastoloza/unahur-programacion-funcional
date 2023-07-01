-- 1
--Definir una función esCuadrado::Figura−>Bool que devuelve true si la figura es un cuadrado. 

data Figura = Circulo Float | Rectangulo Float Float
esCuadrado::Figura -> Bool
esCuadrado (Rectangulo x y) = x == y 
esCuadrado _ = False

-- 2
--Definir una función esValida :: FiguraC -> Bool que devuelve true si la figura es  válida, sabiendo que una figura sólo puede tener color rojo si es un círculo o su área es mayor a 10.

data Color = Rojo | Azul 
data FiguraC = Circulo Float Color | Rectangulo Float Float Color
esValida :: FiguraC -> Bool
esValida (Circulo _ color) = color == Rojo
esValida (Rectangulo x y _) = (x*y) > 10
esValida _ = False

-- 3
-- Definir la función restaTruncada::Nat−>Nat−>Nat que dados dos naturales n y m devuelve la resta n - m si n es mayor que m, y devuelve Zero en otro caso. 

data Nat = Zero | Succ Nat
restaTruncada :: Nat -> Nat -> Nat
restaTruncada n Zero = n
restaTruncada Zero _ = Zero
restaTruncada (Succ n) (Succ m) = restaTruncada n m

-- 4
-- Definir la función mayor::Nat−>Nat−>Bool que dados dos naturales devuelve  true si el primero es mayor que el segundo.

mayor _ Zero = True
mayor Zero _ = False
mayor (Succ n) (Succ m) = mayor n m

-- 5 
-- Definir recursivamente una función espejar::Arbol a−>Arbol a que devuelve el  árbol espejado, es decir, todo hijo izquierdo pasa a ser el derecho y viceversa. 


data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a) 
espejar::Arbol a -> Arbol a
espejar (Hoja a) = Hoja a 
espejar (Nodo x izq der) = Nodo x (espejar (Arbol der)) (espejar (Arbol izq))

-- 6
--Definir recursivamente una función todosMenores :: Ord a => a −> Arbol a −> Bool que toma un valor x y un árbol, y devuelve True sii todos los elementos del árbol son menores a x.
--Ej: todosMenores 6 (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) == True
--todosMenores 3 (Nodo 1 (Nodo 2 ( Hoja 0) ( Hoja 5)) ( Hoja (-3))) == False

data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)
todosMenores :: Ord a => a -> Arbol a -> Bool
todosMenores _ (Hoja x) = x < x
todosMenores x (Nodo a izq der) = x > a && todosMenores x izq && todosMenores x der