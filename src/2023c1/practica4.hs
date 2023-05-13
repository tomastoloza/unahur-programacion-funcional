--  1. Determinar todos los redexes en las siguientes expresiones.
--  suma x y = x + y
--  producto x y = x ∗ y
--  inverso x | x /= 0 = 1/x
--  indefinido = indefinido
--  const5 x = 5

--  suma (sqrt 2) (producto 5 3)
--  sqrt 2         5 * 3
--  1.41421356237 + 15
--  16.4142135624

--  snd (3, inverso 0)
--  1/0 -> ⊥

--  1:[2] ++ reverse [3,4]
--  [1,2] ++ [4,3]
--  [1,2,4,3]


--  1 == 2 || 3 > 0
-- False || True
-- True

--  indefinido
-- ⊥

--  const5 indefinido
-- 5

--  2. Decidir si las expresiones del ejercicio 1 tienen forma normal o están indefinidas. En
--  los casos que sea posible, encontrar una reducción hasta la forma normal.
--  3. Determinar si las siguientes funciones son totales o parciales.
--  di vi d e : : Int −> Int −> Bool
--  di vi d e x y = mod x y == 0
--  di vi d e ’ : : Int −> Int −> Bool
--  di vi d e ’ x y | x == 0 = False
--  | otherwise = mod x y == 0
--  f : : Int −> Bool
--  f x = di vi d e 2 ( x^2+1)
--  li s taAPa r : : [ a ] −> ( a , a )
--  li s taAPa r [ x , y ] = ( x , y )
--  head ’ : : a −> [ a ] −> a
--  head ’ x xs = head ( xs ++ [ x ] )
--  4. Reducir las expresiones del ejercicio 1 con orden aplicativo y orden normal.