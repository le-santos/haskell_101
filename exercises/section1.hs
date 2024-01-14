module Section1 where
  -- a)
  multiplesFive :: [Int]
  multiplesFive = [ x | x <- [0..50], mod x 5 == 0]

  -- b) (MELHORAR os predicados)
  onlyConsonants :: [[Char]]
  onlyConsonants = [ [x] | x <- ['a'..'z'], x /= 'a', x /= 'e', x /= 'i', x /= 'o', x/= 'u' ]

  -- c)

  -- d) 
  checkersCoordinates :: [(Char, Int)]
  checkersCoordinates = [ (x,y) | x <- ['a'..'h'], y <- [1..8]]

  -- e) 
  stringIsEven :: String -> Bool
  stringIsEven text = even (length text)

