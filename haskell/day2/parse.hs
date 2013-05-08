module Main where
  import Data.Char
  strip s = filter isDigit s

  parse s =
    let (wholes, decimals) = break (== '.') s
    in read ((strip wholes) ++ "." ++ (strip decimals)) :: Float