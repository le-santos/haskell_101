module Rec where

data Nat = Z | Suc Nat deriving Show

natToInt :: Nat -> Int
natToInt Z = 0
natToInt (Suc n) = 1 + natToInt n

somar :: Nat -> Nat -> Nat
somar x Z = x
somar x (Suc n) = Suc (somar x n)

mult :: Nat -> Nat -> Nat
mult x Z = Z
mult x (Suc Z) = x
mult x (Suc n) = somar x (mult x n)

fat :: Int -> Int
fat n
  | n <= 0 = 1
  | otherwise = n * fat (n - 1)

fatt :: Nat -> Nat
fatt Z = Suc Z
fatt (Suc n) = mult (Suc n) (fatt n)

-- Implementação da função fibb
fibb :: Nat -> Nat
fibb Z = Z
fibb (Suc Z) = Suc Z
fibb (Suc (Suc n)) = fibb (Suc n) `somar` fibb n

-- Testes
main :: IO ()
main = do
  putStrLn "Fibonacci de 0: " 
  print $ natToInt (fibb Z)

  putStrLn "Fibonacci de 1: " 
  print $ natToInt (fibb (Suc Z))

  putStrLn "Fibonacci de 5: " 
  print $ natToInt (fibb (Suc (Suc (Suc (Suc (Suc Z))))))

  putStrLn "Fibonacci de 8: " 
  print $ natToInt (fibb (Suc (Suc (Suc (Suc (Suc (Suc (Suc (Suc Z)))))))))
