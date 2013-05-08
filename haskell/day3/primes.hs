moarPrimes (h:t) = h:(moarPrimes $ filter (\x -> x `mod` h /= 0) t)
primes = moarPrimes [2..]
