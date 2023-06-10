twice = \f x -> f (f x)
twice :: (a->a) -> (a->a)


{- 1. Dar expresiones lambda para las siguientes funciones.
suma
snd
head
twice twice
-}
suma :: Num a => a -> a -> a
suma = \x y -> x + y
--suma x = \y -> x + y


second = \(_, y) -> y

head1 = \(x, _) -> x

--twice twice = \x -> twice (twice x)



{- 2. Dar el tipo de las siguientes funciones.
-}
apply f = g
    where g x = f x
--apply :: (a -> b) -> (c -> d)
--x :: a    y   x :: c => a = c
--g x :: d, f x :: b y g x == f x => b = d
--entonces, apply :: (a -> b) -> a -> b


flip1 f = g
    where g x y = f y x

flip1 :: (a -> b -> c) -> (b -> a -> c)

--appDup f = g
--    where g x = f (x, x)

--appFork (f, g) = h
--    where h x = (f x, g x)


{- 3. Teniendo en cuenta las definiciones anteriores, dar el tipo de las siguientes expresiones y escribirlas con expresiones lambda.

apply fst :: (a -> b) -> a

twice twice

twice flip :: (a -> a -> c) -> (a -> a -> c)

appDup appFork
-}