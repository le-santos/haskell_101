module Section1 where

{--
    ===== Item 1.1 =====
--}

  -- a) taboada do 5
  multiplesFive :: [Int]
  multiplesFive = [ x | x <- [0..50], mod x 5 == 0]

-- b) Retorna o alfabeto sem as consoantes
  stringHasChar :: String -> Char -> Bool
  stringHasChar text char
    | null text = False
    | char == head text = True
    | otherwise = stringHasChar (tail text) char

  onlyConsonants :: [[Char]]
  onlyConsonants = [ [x] | x <- ['a'..'z'], not (stringHasChar "aeiou" x) ]

  -- c) lista de 0 a 50 sem os numeros 2, 7, 13, 35 e 42
  listHasInt :: [Int] -> Int -> Bool
  listHasInt [] _ = False
  listHasInt (x:xs) z
    | x == z = True
    | otherwise = listHasInt xs z

  customIntList :: [Int]
  customIntList = [ x | x <- [0..50], not (listHasInt [2, 7, 13, 35, 42] x) ]

  -- d) retorna as coordenadas de um tabuleiro de damas 8x8 no formato (a, 1)
  checkersCoordinates :: [(Char, Int)]
  checkersCoordinates = [ (x,y) | x <- ['a'..'h'], y <- [1..8] ]


{--
    ===== Item 1.2 =====
--}

  -- a) retorna se uma string é par ou não

  stringIsEven :: String -> Bool
  stringIsEven text = even (length text)

-- b) retorna um vetor de Strings e retorna lista com todos os elementos em ordem reversa
-- explicit version
  -- customReverseString :: [Char] -> [[Char]]
  -- customReverseString = []

-- short version
  customReverseShort :: [Char] -> [[Char]]
  customReverseShort text = reverse [ [x] | x <- text ]
