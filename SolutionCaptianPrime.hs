module SolutionCaptianPrime where

import Data.List (init, inits, tail, tails)

digits :: Integer -> [String]
digits = map return . show

noZero :: Integer -> Bool
noZero = (notElem "0") . digits

isPrime :: Integer -> Bool
isPrime k = null [ x | x <- [2..k - 1], k `mod`x  == 0]

dead :: Integer -> Bool
dead nro = not (noZero nro && isPrime nro)

left :: Integer -> Bool
left = all id . map (isPrime . read . concat) . init . tails . digits

right :: Integer -> Bool
right = all id . map (isPrime . read . concat) . tail . inits . digits

leftAndRight :: Integer -> [Bool]
leftAndRight nro = [left, right] <*> [nro]

solve :: Integer -> String
solve nro | dead nro  = "DEAD"
          | otherwise = case leftAndRight nro of
                          [True,True] -> "CENTRAL"
                          [True,False] -> "LEFT"
                          [False,True] -> "RIGHT"
                          _ -> "DEAD"

main = interact $ unlines . map (solve . read) . tail . lines
