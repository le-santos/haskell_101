{-
  import Data.Monoid
-}

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

    -- ====== Item 4.3 =====
  
  {-
     rie o tipo TipoProduto que possui os values constructors Escritorio , Informatica , Livro , Filme e Total .
      O tipo Produto possui um value constructor - de mesmo nome - e os campos valor ( Double ), tp ( TipoProduto
      ) e um value constructor Nada , que representa a ausência de um Produto .
  -}

  data TipoProduto = Escritorio | Informatica | Livro | Filme | Total deriving (Show, Eq)

  data Produto = Produto { valor :: Double, tp :: TipoProduto } | Nada deriving (Show, Eq)

  instance Monoid TipoProduto where
  mempty = Total
  mappend _ _ = Total

  instance Monoid Produto where
    mempty = Nada
    mappend Nada x = x
    mappend x Nada = x
    mappend (Produto v1 tp1) (Produto v2 tp2) = Produto (v1 + v2) Total

    main :: IO ()
    main = do
      let produto1 = Produto 10.0 Livro
          produto2 = Produto 20.0 Filme
          produto3 = Produto 5.0 Informatica
          carrinho = produto1 `mappend` produto2 `mappend` produto3

      print carrinho

  -- ====== Item 4.4 ===

  {-
        Implemente os percursos pós-ordem e pré-ordem. Via comentário, faça os ”testes de mesa”para os dois
        percursos da árvore Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nula)) (Raiz 20 Nula (Raiz 22 (Folha
        21) Nula))

        Usando a estrutura de árvore vista, faça uma função que some todos os elementos de uma árvore de números.
  -}

  data Arvore a = Galho a (Arvore a) (Arvore a) | Folha a | Nulo deriving Show

  -- Percurso pré-ordem
  preOrdem :: Arvore a -> [a]
  preOrdem Nulo = []
  preOrdem (Folha x) = [x]
  preOrdem (Galho x esq dir) = [x] ++ preOrdem esq ++ preOrdem dir

  -- Percurso pós-ordem
  posOrdem :: Arvore a -> [a]
  posOrdem Nulo = []
  posOrdem (Folha x) = [x]
  posOrdem (Galho x esq dir) = posOrdem esq ++ posOrdem dir ++ [x]

  -- Raiz 15 (Raiz 11 (Folha 6) (Raiz 12 (Folha 10) Nulo)) (Raiz 20 Nulo (Raiz 22 (Folha 21) Nulo))
    arvoreTeste :: Arvore Int
    arvoreTeste =
      Galho 15
        (Galho 11 (Folha 6) (Galho 12 (Folha 10) Nulo))
        (Galho 20 Nulo (Galho 22 (Folha 21) Nulo))
  
  -- Teste de mesa para os percursos
  -- Pré-ordem: [15, 11, 6, 12, 10, 20, 22, 21]
  -- Pós-ordem: [6, 10, 12, 11, 21, 22, 20, 15]
  main :: IO ()
  main = do
    putStrLn "Percurso Pré-ordem:"
    print $ preOrdem arvoreTeste

    putStrLn "Percurso Pós-ordem:"
    print $ posOrdem arvoreTeste
