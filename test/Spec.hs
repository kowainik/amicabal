module Main (main) where

import Amicabal (projectName)


main :: IO ()
main = putStrLn ("Tests for " ++ projectName)
