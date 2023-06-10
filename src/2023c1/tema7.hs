twice f = \x -> f (f x)

-- I Definir la función sumarDos usando la función twice y la función succ.
suc x = x + 1
-- sumarDos x = x + 2
sumarDos x = twice.suc x
-- II Reducir la expresión ((twice twice) doble) 3.
-- ((twice twice) doble) 3
-- twice twice

