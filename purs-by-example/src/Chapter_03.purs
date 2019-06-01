-- Code samples from chapter 3, not including project code
module Chapter03 where


import Prelude (flip, show)
import Data.Semigroup ((<>))

example :: String
example = flip (\n s -> show n <> s) "Ten" 10