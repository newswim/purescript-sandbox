module Main where

import Prelude

import Chapter02 (diagonal)
import Effect (Effect)
import Effect.Console (log, logShow)
import Euler (answer)

main :: Effect Unit
main = do
  log ("The answer is: " <> show answer)
  logShow (diagonal 3.0 4.0)
