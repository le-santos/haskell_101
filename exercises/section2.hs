module Section2 where
  {-
    ===== Item 2.1 =====
  -}

  data Month = January | February | March| April | May | June
              | July | August | September | October | November | December 

  -- a) retorna o número de dias que cada mês possui (considere fevereiro tendo 28 dias).
  checaFim :: Month -> Int
  checaFim February = 28
  checaFim April = 30
  checaFim June = 30
  checaFim September = 30
  checaFim November = 30
  checaFim _ = 31

