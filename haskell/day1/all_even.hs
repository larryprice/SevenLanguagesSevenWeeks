module Main where
  allEven :: [Integer] -> [Integer]
  allEven [] = []
  allEven (h:t) = if even h then h:allEven t else allEven t

  allEven2 :: [Integer] -> [Integer]
  allEven2 l = filter even l