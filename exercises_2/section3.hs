module Sect3 where
    -- Mônada I.O.
  {-
    (a) Faça um programa que faça o usuário digitar um número,
    e mostre na saı́da padrão se ele é par ou ı́mpar.
  -}

  data EvenOdd = Even | Odd deriving Show

  checkNum :: IO ()
  checkNum = do
    putStrLn "Enter a number to check if it is even or odd:"
    number <- getLine
    putStrLn $ "Number " ++ number ++ " is " ++ show (checkEvenOdd (read number))
      where
        checkEvenOdd :: Int -> EvenOdd
        checkEvenOdd x
          | even x = Even
          | otherwise = Odd

  {-
    (b) Faça um programa que mostre uma palavra em ordem reversa a
    partir de uma digitada pelo usuário.
  -}

  reverseInput :: IO ()
  reverseInput = do
    putStrLn "Enter a word to reverse"
    input <- getLine
    putStrLn $ reverse input
