module SolutionCaptianPrime where

digits :: Integer -> [String]
digits = map return . show

noZero :: Integer -> Bool
noZero = (notElem "0") . digits

isPrime :: Integer -> Bool
isPrime k = factors k == [1,k]
    where factors n = [x | x <- [1..n], mod n x == 0]

dead :: Integer -> Bool
dead nro = not (noZero nro && isPrime nro)

checkPrime :: ([Char] -> [Char]) -> [Char] -> Bool
checkPrime _ []     = True
checkPrime f [x]    = isPrime (read (f [x]))
checkPrime f (_:xs) = isPrime (read (f xs)) && checkPrime f xs

left :: Integer -> Bool
left = checkPrime id . show

right :: Integer -> Bool
right = checkPrime reverse . reverse . show

leftAndRight :: Integer -> [Bool]
leftAndRight nro = [left, right] <*> [nro]

solve :: Integer -> String
solve nro | dead nro  = "DEAD"
          | otherwise = case leftAndRight nro of
                          [True,True]  -> "CENTRAL"
                          [True,False] -> "LEFT"
                          [False,True] -> "RIGHT"
                          _            -> "DEAD"

main = interact $ unlines . map (solve . read) . tail . lines
