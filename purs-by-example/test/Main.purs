module Test.Main where

import Prelude
import Effect (Effect)
import Euler (answer)
import Test.Assert (assert)

main :: Effect Unit
main = do
  assert (answer == 233168)
