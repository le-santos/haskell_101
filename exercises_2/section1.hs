module Sect1 where
  {- Dado o tipo de dado algébrico: -}
  data Coisa a = UmaCoisa a | DuasCoisas a a | ZeroCoisa deriving (Show, Eq)


  {-
    (a) Faça uma instância de Functor para o tipo Coisa. A função g deve
    ”ir para dentro”em todas as coordenadas de Coisa.
    No caso de ZeroCoisa, o fmap deve retornar ZeroCoisa.
  -}

  instance Functor Coisa where
    fmap g ZeroCoisa = ZeroCoisa
    fmap g (UmaCoisa a) = UmaCoisa (g a)
    fmap g (DuasCoisas a1 a2) = DuasCoisas (g a1) (g a2)

  -- Ex: 
  -- fmap (*2) UmaCoisa 2
  -- fmap (+1) (DuasCoisas 1 5)
  -- fmap (== ZeroCoisa) (DuasCoisas ZeroCoisa (Umacoisa ZeroCoisa))

  {-
    (b) Aproveitando o exercício anterior, faça uma instância de Applicative Functor para o tipo Coisa.
  -}

  instance Applicative Coisa where
      pure :: a -> Coisa a
      pure = UmaCoisa

      (<*>) :: Coisa (a -> b) -> Coisa a -> Coisa b
      (UmaCoisa f) <*> (UmaCoisa x) = UmaCoisa (f x)
      (UmaCoisa f) <*> (DuasCoisas a b) = DuasCoisas (f a) (f b)
      _ <*> ZeroCoisa = ZeroCoisa

