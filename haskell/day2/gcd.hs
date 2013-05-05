module Main where
  myGcd a b = last [x | x <- [1..(min a b)], a `mod` x == 0, b `mod` x == 0]