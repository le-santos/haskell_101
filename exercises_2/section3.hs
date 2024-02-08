{-
  import Data.Complex
-}

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

    {-
      (c) Faça um programa que calcule uma equação do segundo grau, a partir dos dados digitados pelo usuário.
    -}

  -- Função para calcular as raízes de uma equação do segundo grau
  raizesEquacaoSegundoGrau :: Double -> Double -> Double -> (Complex Double, Complex Double)
  raizesEquacaoSegundoGrau a b c
      | delta >= 0 = (x1, x2) 
      | otherwise = (x1 :+ sqrt(abs delta), x2 :+ (-sqrt(abs delta))) -- Se delta for negativo, raízes complexas
      where
          delta = b^2 - 4*a*c
          x1 = ((-b) + sqrt delta) / (2*a)
          x2 = ((-b) - sqrt delta) / (2*a)


  main :: IO ()
  main = do
      putStrLn "Digite o coeficiente 'a' da equação do segundo grau:"
      coefA <- readLn
      putStrLn "Digite o coeficiente 'b' da equação do segundo grau:"
      coefB <- readLn
      putStrLn "Digite o coeficiente 'c' da equação do segundo grau:"
      coefC <- readLn
      let (raiz1, raiz2) = raizesEquacaoSegundoGrau coefA coefB coefC
      putStrLn $ "As raízes da equação são: " ++ show raiz1 ++ " e " ++ show raiz2
