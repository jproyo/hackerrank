solve :: Double -> Double
solve x = resolve x 9

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

resolve :: Double -> Integer -> Double
resolve x 1 = 1 + x
resolve x i = ( (x^i) / (fromInteger (factorial i)) ) + (resolve x (i-1))

main :: IO ()
main = getContents >>= mapM_ print. map solve. map (read::String->Double). tail. words
