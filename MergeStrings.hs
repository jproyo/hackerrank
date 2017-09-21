mergeStrings :: [Char] -> [Char] -> String
mergeStrings [] [] = []
mergeStrings [] b = b
mergeStrings a [] = a
mergeStrings (x:xs) (y:ys) = [x,y] ++ (mergeStrings xs ys)
