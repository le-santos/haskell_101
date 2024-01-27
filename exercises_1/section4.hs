module Section4 where
  {-
    ===== Item 4.1 =====
    Implemente a função removerElemento que recebe um elemento ”a”
    qualquer, uma Lista a e retorne uma Lista a com o elemento removido.
  -}

  data Lista a = Nulo | a :>: (Lista a) deriving (Show, Eq)

  {-
    EX:
    removeElement 1 Nulo
    removeElement 1 (1 :>: Nulo)
    removeElement 1 (3 :>: (1 :>: Nulo))
  -}
  removeElement :: Eq a => a -> Lista a -> Lista a
  removeElement _ Nulo = Nulo
  removeElement x ( y :>: list)
    | x == y = list
    | otherwise = y :>: removeElement x list

  {-
    `Lista a` é um Tipo Recursivo, com 2 value constructors:
    -- Nulo
    -- a :>: (Lista a)

    Podemos combinar, por exemplo em:
    4 :>: ( 1 :>: Nulo )

    Obs: o tipo do operador infix (:>:) definido acima combina qualquer (a) com (Lista a)
    :type (:>:)
    (:>:) :: a -> Lista a -> Lista a

    Podemos usar na forma prefix também:
    (:>:) '1' Nulo
  -}

    -- ===== Item 4.2 =====

  data Parity = Even | Odd deriving Show

  class EvenOdd a where
    decideParity :: a -> Parity

  -- Ex: decideParity True
  instance EvenOdd Bool where
    decideParity False = Even
    decideParity True = Odd

  -- Ex: decideParity (2 :: Int)
  instance EvenOdd Int where
    decideParity x = decideParity (odd x :: Bool)

  -- Ex: decideParity [1,2,3]
  instance EvenOdd [a] where
    decideParity list = decideParity (length list)
