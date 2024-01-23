module Section3 where
    {-
      ===== Item 3.1 =====
    -}

  -- a) Implemente uma função que filtre os números pares e outra
  -- que filtre os ímpares de uma lista recebida via parâmetro.
  filterEven :: [Int] -> [Int]
  filterEven [] = []
  filterEven xs = filter even xs
  
  filterOdd :: [Int] -> [Int]
  filterOdd [] = []
  filterOdd xs = filter odd xs
