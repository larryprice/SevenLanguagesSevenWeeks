-- http://c2.com/cgi/wiki?QuickSortInHaskell

module Main where
  mySort [] = []
  mySort (x:xs) = mySort small ++ (x : mySort large)
    where small = [y | y <- xs, y <= x]
          large = [y | y <- xs, y > x]