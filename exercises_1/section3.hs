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

  {-
      ===== Item 3.2 =====
    Implemente o tipo Dinheiro que contenha os campos valor e correncia
    ( Real ou Dolar ), e uma função que converta todos os ”dinheiros” de uma
    lista para dólar (e outra para real).
  -}
  data Currency = Dolar | Real deriving Show
  data Money = Money { value :: Double, currency :: Currency} deriving Show

  -- convertMoney :: [Money] -> [Money]
  -- convertMoney [] = []
  -- convertMoney ms = map copyMoney ms
  --   where
  --     copyMoney :: Money -> Money
  --     copyMoney (Money v Real) = Money v Dolar
  --     copyMoney (Money v Dolar) = Money v Real

  -- Com isso, implemente funções para:
  -- (a) Filtrar todos os Dolares de uma lista de Dinheiro

