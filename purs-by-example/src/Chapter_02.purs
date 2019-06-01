module Chapter02 where

import Prelude

import Effect (Effect)
import Effect.Console (logShow)
import Math (pi, pow, sqrt)

diagonal :: Number → Number → Number
diagonal w h = sqrt (w * w + h * h)

circleArea :: Number -> Number
circleArea r = pi * (pow r 2.0)

main :: Effect Unit
main = logShow (diagonal 3.0 4.0)
