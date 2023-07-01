--data Color = Negro | Azul | Rojo | Blanco deriving (Eq, Show)
data Color = Negro | Azul | Rojo | Blanco deriving Show
instance Eq Color where
    Negro == Negro = True
    Azul == Azul = True
    Blanco == Blanco = True
    Rojo == Rojo = True
    Colorado == Colorado = True
    Rojo == Colorado = True
    _ = False
--pattern matching
esClaro :: Color -> Bool
esClaro Rojo = True
esClaro Blanco = True
esClaro _ = False

--igualdad
--esClaro x = x == Rojo | x == Blanco


-- definicion de producto de naturales
data Nat = Z | S Nat

suma :: Nat -> Nat -> Nat
suma Z m = m
suma (S n) m = S (suma n m)

producto :: Nat -> Nat -> Nat
producto Z = 0
producto (S n) m = suma (producto n m) m

-- size arbol
data Arbol a = Hoja a | Nodo a (Arbol a) (Arbol a)

size :: Arbol a -> Int
size (Hoja _) = 1
size (Nodo _ izq der) = 1 + size izq + size der