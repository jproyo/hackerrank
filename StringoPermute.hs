import Control.Monad

strOrPermute :: String -> String
strOrPermute [] = []
strOrPermute (s1:s2:rs) = s2 : s1 : (strOrPermute rs)

main = do
  testCases <- getLine
  replicateM_ (read testCases :: Int) $ getLine >>= return . strOrPermute >>= putStrLn
