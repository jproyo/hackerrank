import Control.Monad

takeWhileEq :: String -> String -> String
takeWhileEq (x:xs) (y:ys) 
    | x == y = x : takeWhileEq xs ys
    | otherwise = []
takeWhileEq _ _ = []

dropWhileEq :: String -> String -> [String]
dropWhileEq xss@(x:xs) yss@(y:ys) 
    | x == y =  dropWhileEq xs ys
    | otherwise = [xss, yss]
dropWhileEq xs [] = [xs, ""]
dropWhileEq [] ys = ["", ys]

splitOnDiff :: String -> String -> [String]
splitOnDiff xs ys = (takeWhileEq xs ys) : dropWhileEq xs ys


prefixComp :: String -> String -> [String]
prefixComp xs ys = map convert (splitOnDiff xs ys) 
    where convert [] = "0"
          convert xs = (show $ length xs) ++ " " ++ xs

main = do
    fstWord <- getLine
    sndWord <- getLine
    mapM putStrLn (prefixComp fstWord sndWord)