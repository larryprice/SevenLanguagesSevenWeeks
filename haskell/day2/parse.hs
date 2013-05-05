module Main where
  import Data.Char
  strip s = filter isDigit s

  parse s =
    let (wholes, decimals) = break (== '.') s
    in (fromIntegral (foldl addUpWholes 0 (strip wholes)) :: Float) + addUpDecimals (strip decimals)

  addUpWholes carry x = 10*carry + digitToInt x
  addUpDecimals a = read ("0." ++ a) :: Float