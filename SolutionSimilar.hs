import Control.Monad

similarities :: String -> Int
similarities xs
  | length xs > 100000 = 0
  | otherwise = (sum[similarity x1 y1
                         | (x1, y1) <- [(x,y) | x <- [xs], y <- suffixes xs]])

suffixes :: String -> [String]
suffixes "" = []
suffixes xs = [xs] ++ suffixes (tail xs)

similarity :: String -> String -> Int
similarity xs ys = similaritySum' xs ys 0
 where similaritySum' (x:xs) (y:ys) acc
        | x == y = similaritySum' xs ys (acc+1)
        | otherwise = acc
       similaritySum' _ _ acc = acc

main = interact $ unlines . map show . map similarities . tail . words
