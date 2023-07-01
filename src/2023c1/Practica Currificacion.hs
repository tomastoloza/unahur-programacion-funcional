-- repaso

-- currificada
suma :: Int -> Int -> Int
suma x y = x + y

succ = suma 1

-- succ x = suma 1 x

-- no currificada
--suma' :: (Int, Int) -> Int
--suma' (x,y) = x + y

succ' x = suma' (1,x)

--suma = curry suma'

suma' = uncurry suma

-----

1. Verificar las siguientes propiedades:

a) Para toda f :: a -> b -> c vale que curry (uncurry f) = f
b) Para toda f :: (a,b) -> c vale que uncurry (curry f) = f

a) Sea x :: a, y  :: b,
curry (uncurry f) x y ==(C) uncurry f (x,y) ==(U) f x y

Por lo tanto curry (uncurry f) == f

curry g x y = g (x,y) -- (C)
uncurry g (x,y) = g x y -- (U)

b) Sea x :: a, y :: b
uncurry (curry f) (x,y) ==(U) curry f x y ==(C) f (x,y)

Por lo tanto uncurry (curry f) == f



2. Reescribir las siguientes definiciones sin utilizar where o expresiones lambda, y utilizando
la menor cantidad de paréntesis posible.

id :: a -> a
id x = x

apply :: (a -> b) -> a -> b

apply f = g
 where g x = f x

apply f = f

flip f = g
 where g x y = f y x

flip f x y = f y x

id = \x -> x

id x = x

const :: a -> b -> a

const = \x -> (\y -> x)

const x = \y -> x

const x y = x

compose = \f -> (\g -> (\x -> f (g x)))

compose f g x = f (g x)

compose f g = f . g

compose = (.)

3. Indicar el tipo de cada una de las funciones del ejercicio anterior, utilizando también
la menor cantidad posible de paréntesis.

4. Reescribir las siguientes funciones en estilo point-free 
usando aplicación parcial de alguna función adecuada.

antecesor x = x + (-1)

antecesor = (+(-1))

const5 x = 5
const5 = \_ -> 5

--const5 = curry fst 5

const5 = const 5

componerConDoble g = g . (\x -> 2*x)

componerConDoble = (.(\x -> 2*x))

agregar3 xs = xs ++ [3]
agregar3 = (++ [3])
