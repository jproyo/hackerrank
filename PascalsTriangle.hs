import Control.Monad

fact :: Int -> Int
fact 0 = 1
fact n = n*(fact (n-1))

pascalTringleAlg :: Int -> Int -> Int
pascalTringleAlg row col = fromIntegral ((fact row) `div` ((fact col)*(fact (row-col))))

calculateRow :: Int -> [Int]
calculateRow row = map (pascalTringleAlg row) [0..row]

pascalTringle :: Int -> [[Int]]
pascalTringle row = map calculateRow [0..row-1]

showTriangle :: [[Int]] -> IO ()
showTriangle triangle = mapM_ (putStrLn . (foldr ((++) . (++ " ") . show) "")) triangle

main = do
  rows <- getLine
  showTriangle $ pascalTringle (read rows :: Int)



