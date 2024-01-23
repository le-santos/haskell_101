module Section2 where
  {-
    ===== Item 2.1 =====
  -}

  data Month = January | February | March | April |
               May | June | July | August |
               September | October | November | December deriving (Show, Enum)

  -- a) retorna o número de dias que cada mês possui (considere fevereiro tendo 28 dias).
  monthLastDay :: Month -> Int
  monthLastDay February = 28
  monthLastDay April = 30
  monthLastDay June = 30
  monthLastDay September = 30
  monthLastDay November = 30
  monthLastDay _ = 31

  -- b) recebe um mês atual e retorna o próximo mês
  nextMonth :: Month -> Month
  nextMonth December = January
  nextMonth month = succ month

  -- c) retorna a estação do ano de acordo com o mês e com o hemisfério.
  --    (Use apenas tipos criados pela palavra data aqui.)
  data Season = Spring | Summer | Autumn | Winter deriving Show
  data Hemisphere = North | South deriving Show

  -- season :: Hemisphere -> Month -> Season
  -- season North month = Winter

    -- matchForMonth = [(x,y,z) | x <-[North, South] ,y <- [December, January, February], z <- [Summer, Winter]]
