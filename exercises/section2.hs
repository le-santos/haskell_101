module Section2 where
  {-
    ===== Item 2.1 =====
  -}

  data Month = January | February | March | April | May | June
              | July | August | September | October | November | December deriving Show

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
  nextMonth January = February
  nextMonth February = March
  nextMonth March = April
  nextMonth April = May
  nextMonth May = June
  nextMonth June = July
  nextMonth July = August
  nextMonth August = September
  nextMonth September = October
  nextMonth October = November
  nextMonth November = December
  nextMonth December = January

  -- c) que retorna a estação do ano de acordo com o mês e com o hemisfério.
  --    (Use apenas tipos criados pela palavra data aqui.)
  data Season = Spring | Summer | Autumn | Winter
  data Hemisphere = North | South

  -- season :: Month, Hemisphere -> Season
  -- season 