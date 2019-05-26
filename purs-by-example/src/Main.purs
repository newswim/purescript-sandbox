module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

thing :: String
thing = "Whyyy!"

main :: Effect Unit
main = do
  log "Hello sailor!"
  log thing
