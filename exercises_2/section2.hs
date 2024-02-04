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
