module Main where
  myReverse [] = []
  myReverse (h:t) = concat [myReverse t, [h]]