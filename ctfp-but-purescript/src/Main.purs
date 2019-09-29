module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "🍝"
  log $ show foo


wat :: Int
wat = 1 + 2

foo :: Int
foo = wat + 3