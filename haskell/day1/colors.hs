module Main where
  colorCombos l = [(a, b) | a <- l, b <- l, a < b]