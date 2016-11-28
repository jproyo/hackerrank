import Data.List

split :: String -> Char -> [String]
split [] delim = [""]
split (c:cs) delim
   | c == delim = "" : rest
   | otherwise = (c : head rest) : tail rest
   where
       rest = split cs delim

fillUntilBase :: [[Int]] -> [Int] -> Int -> [[Int]]
fillUntilBase (x:xs) ys base
    | sum x > base = fillUntilBase xs ys base
    | sum x == base = x : fillUntilBase xs ys base 
    | otherwise = fillUntilBase ((map (:x) ys) ++ fillUntilBase xs ys base) ys base
fillUntilBase _ _ _ = []

coinChange :: [Int] -> Int -> [[Int]]
coinChange xs base = nub $ map sort (fillUntilBase (map (:[]) xs) xs base)

convertToInt :: String -> [Int]
convertToInt xs = map (\x -> read x :: Int) (split xs ' ')

main = do
    change <- getLine
    coins <- getLine
    putStrLn . show . length $ (coinChange (convertToInt coins) (head $ convertToInt change))
