module Sect2 where
  {-
    2.1 Faça um tipo Caixa com um type parameter a e três construtores chamados
    Um , Dois e Tres possuindo um, dois e três campos de tipo a, respectivamente.
  -}

  data Box a = One a | Two a a | Three a a a deriving Show

  {-
    Faça uma instância de Functor para o tipo Caixa. A função deve ser aplicada
    em todas as coordenadas dos valores ( Um , Dois ou Tres ).
  -}

  -- Ex: fmap (*2) (Two 3 7)
  instance Functor Box where
    fmap :: (a -> b) -> Box a -> Box b
    fmap f (One a)       = One (f a)
    fmap f (Two a b)     = Two (f a) (f b)
    fmap f (Three a b c) = Three (f a) (f b) (f c)

{-
  Crie uma instância de Monad para o tipo Caixa.
  Seu return deve ser o value constructor de Um.

  Observação: quando definir >>= para Caixa, o valor `a` para entrar em f,
  "(>>=) :: m a -> (a -> m b) -> m b”, segue as regras:

  • Um : o único campo entra na função (análogo ao Maybe);
  • Dois : o segundo campo entra;
  • Tres : o terceiro campo entra.
-}

  instance Applicative Box where
    pure :: a -> Box a
    pure = One

    (<*>) :: Box (a -> b) -> Box a -> Box b
    (One f) <*> (One a) = One (f a)
    (One f) <*> (Two a b) = Two (f a) (f b)
    (One f) <*> (Three a b c) = Three (f a) (f b) (f c)

  instance Monad Box where
    return :: a -> Box a
    return = pure

    (>>=) :: Box a -> (a -> Box b) -> Box b
    One a >>= f       = f a
    Two a b >>= f     = f b
    Three a b c >>= f = f c

  {-
    2.2. Crie uma função mult234 :: Double -> Caixa Double que receba uma parâmetro x
    e devolva o dobro de x na primeira coordenada, o triplo na segunda
    e o quádruplo na terceira usando o operador >>=
  -}
