module Main where

import Repl (runRepl)

main :: IO ()
main = do
  putStrLn "Welcome to the PROC language!"
  runRepl
