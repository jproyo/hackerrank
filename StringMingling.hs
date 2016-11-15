mingling = (foldr (++) []) . (map (\(x,y) -> x:y:[]))

main = do 
    inputP <- getLine
    inputQ <- getLine
    putStrLn $ mingling $ zip inputP inputQ