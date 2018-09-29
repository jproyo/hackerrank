maxDiff :: [Int] -> Int
maxDiff xs = let (leftL, rightL) = splitAt 1 xs
                 (leftR, rightR) = splitAt (length xs - 1) xs
                 in max (maximum leftL - maximum rightL) (maximum leftR - maximum leftL)

main = interact $ show . maxDiff . map read . words
