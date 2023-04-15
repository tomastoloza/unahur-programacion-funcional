cuadruple :: Num a => a -> a
cuadruple a = 4*a


-- Punto 1
punto1a :: Double
punto1a = 1 + 1.0


punto1b :: Double
punto1b = 1/2

punto1c :: Integer
punto1c = div 1 2

punto1d :: Bool
punto1d = mod 2 3 == 0

punto1e :: (Integer, Bool)
punto1e = (1, True)

-- Punto 2
sucesor :: Num a => a -> a
sucesor x = x + 1

segundo :: p1 -> p2 -> p2
segundo _ y = y

suma :: Num a => (a, a) -> a
suma x = fst x + snd x


repetido :: a -> (a, a)
repetido x = (x, x)
