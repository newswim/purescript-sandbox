module Main where

import Prelude

import Effect (Effect)
import Effect.Console (logShow)
import Simple.JSON (readJSON)


json :: String
json = """
  {
    "foo": "bar",
    "baz": "a"
  }
"""

main :: Effect Unit
main = do
  let a = map (\n -> n + 1) [ 1, 2, 3 ]
  let
    j :: _ { foo :: Int, bar :: String }
    j = readJSON json
  logShow j


data Rating = Okay | PrettyGood | Good | Great

showRating :: Rating -> String
showRating r = case r of
  Okay -> "Okay"
  PrettyGood -> "PrettyGood"
  Good -> "Good"
  Great -> "Great"

