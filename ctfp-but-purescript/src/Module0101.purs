module Module0101 where

import Prelude
import Data.Int (pow)
import Effect.Class (class MonadEffect)
import Effect.Class.Console (log)

sqDist :: Int -> Int -> Int
sqDist x y = pow x 2 + pow y 2

someSqDist :: Int
someSqDist = sqDist 5 6

{-
  Topics covered in this lecture:
  - Beta Reduction
-}
main :: forall a. MonadEffect a => a Unit
main = do
  log $ show $ someSqDist
  log "Printing stuff"
