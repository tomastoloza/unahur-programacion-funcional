pasosHasta1 :: (Int -> Int) -> Int -> Int
pasosHasta1 _ 1 = 0
pasosHasta1 f x = 1 + pasosHasta1 f (f x)

