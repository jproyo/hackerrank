maxDiff :: [Int] -> Int
maxDiff xs = maximum [ diff |
       i <- [1..((length xs) - 1)]
     , let (left, right) = splitAt i xs
           diff          = abs (maximum left - maximum right) ]

main = interact $ show . maxDiff . map read . words
