module Section3 where
  {- ===== Item 3.1 ===== -}
  -- a) Implemente uma função que filtre os números pares e outra
  -- que filtre os ímpares de uma lista recebida via parâmetro.

  filterEven :: [Int] -> [Int]
  filterEven xs = filter even xs

  filterOdd :: [Int] -> [Int]
  filterOdd xs = filter odd xs

  {- ===== Item 3.2 ===== -}
  -- Implemente o tipo Dinheiro que contenha os campos valor e correncia
  -- ( Real ou Dolar ), e uma função que converta todos os ”dinheiros” de uma
  -- lista para dólar (e outra para real).

  data Currency = Dolar | Real deriving (Show, Eq)
  data Money = Money { value :: Double, currency :: Currency } deriving Show

  -- Ex: convertMoney Dolar [ Money 2.0 Real, Money 3.0 Dolar ]
  -- Ex: convertMoney Real [ Money 2.0 Real, Money 3.0 Dolar ]
  convertMoney :: Currency -> [Money] -> [Money]
  convertMoney _ [] = []
  convertMoney c ms = map (copyMoney c) ms
    where
      copyMoney :: Currency -> Money -> Money
      copyMoney currency (Money v _) = Money v currency

  -- (a) Filtrar todos os Dolares de uma lista de Dinheiro
  -- Ex: filterDolar [ Money 2.0 Real, Money 3.0 Dolar ]
  filterDolar :: [Money] -> [Money]
  filterDolar [] = []
  filterDolar (Money _ Real : []) = []
  filterDolar ((Money v Dolar) : []) = [Money v Dolar]
  filterDolar ((Money _ Real) : ms ) = filterDolar ms
  filterDolar ((Money v Dolar) : ms ) = (Money v Dolar) : filterDolar ms

  -- Filter mais genérico (qualquer moeda)
  -- Ex: filterMoney Real [ Money 2.0 Real, Money 3.0 Dolar ]
  filterMoney :: Currency -> [Money] -> [Money]
  filterMoney _ [] = []
  filterMoney a ((Money val b) : ms)
    | a == b = (Money val a) : filterMoney a ms
    | otherwise = filterMoney a ms

  -- (b) Somar todos os Dolares de uma lista.
  -- De forma mais explícita com Recursion
  -- Ex: sumDolar [ Money 2.0 Real, Money 3.0 Dolar, Money 2.5 Dolar ]
  sumDolar :: [Money] -> Double
  sumDolar [] = 0
  sumDolar (Money _ Real : []) = 0.0
  sumDolar ((Money value Dolar) : []) = value 
  sumDolar ((Money _ Real) : ms ) = sumDolar ms
  sumDolar ((Money value Dolar) : ms ) = value + sumDolar ms

  -- De forma mais breve, compondo funções
  -- Ex: sumDolarShort [ Money 2.0 Real, Money 3.0 Dolar, Money 2.5 Dolar ]
  sumDolarShort :: [Money] -> Double
  sumDolarShort ms = sum $ map value (filterDolar ms)

  -- (c) Aumentar a quantidade do valor dos reais em uma [Dinheiro].
  -- Ex: increaseRealValue 2.0 [Money 3.0 Dolar, Money 2.5 Real]
  increaseRealValue :: Double -> [Money] -> [Money]
  increaseRealValue amount [] = []
  increaseRealValue amount ((Money v Real) : ms ) = (Money (v + amount) Real) : (increaseRealValue amount ms)
  increaseRealValue amount ((Money v Dolar) : ms ) = (Money v Dolar) : (increaseRealValue amount ms)
