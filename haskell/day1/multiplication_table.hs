module Main where
  multiplicationTable max = [(a,b,a*b) | a <- [0..max], b <- [0..max]]