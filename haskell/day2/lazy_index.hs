module Main where
  everyThird x = x:(everyThird (x+3))
  everyFifth x = x:(everyFifth (x+5))

  everyEighth x y = zipWith (+) (everyThird x) (everyFifth y)