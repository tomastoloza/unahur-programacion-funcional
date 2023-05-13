doble = \x -> 2*x

--suma = \x ->

twice = \f x -> f (f x)
--twice f  = \x -> f (f x)
--(twice f) x = f (f x)

suc x = x + 1
--suamrDos x = x + 2

sumarDos = twice suc

--    ((twice twice) doble) 3
-- ~> (twice twice doble 3)
-- ~> twice (twice doble) 3
-- ~> twice doble (twice doble 3)
-- ~> doble (doble (twice doble 3))
-- ~> 2 * (doble (twice doble 3))
-- ~> 2 * (2 * (twice doble 3))
-- ~> 2 * (2 * doble (doble 3))
-- ~> 2 * (2 * (2 * doble 3))
-- ~> 2 * (2 * (2 * (2 * 3)))



{-
*Main> :i (+)
type Num :: * -> Constraint
class Num a where
  (+) :: a -> a -> a
  ...
        -- Defined in ‘GHC.Num’
infixl 6 +
-}

{-
infix infijo
l left
-}


-- I Definir la función twice usando la función (.) (composición).

twice1 f = f.f
sumaTres = suc.suc.suc