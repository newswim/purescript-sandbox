module Chapter04 where

import Data.Array (concatMap, filter, head, null, tail, (..))
import Data.Foldable (product)
import Data.Maybe (fromMaybe)
import Prelude (map, mod, ($), (*), (+), (-), (==), (<$>), (>))

fact :: Int -> Int
fact 0 = 1
fact n = n * (fact (n - 1))


length :: forall a. Array a -> Int
length arr =
  if null arr
    then 0
    else 1 + (length $ fromMaybe [] $ tail arr)


-- 4.1.1 (Easy) Write a recursive function which returns true if and only if 
--            its input is an even integer.
isEven :: Int -> Boolean
isEven 0 = true
isEven 1 = false
isEven n = isEven (mod n 2)


-- 4.1.2 (Medium) Write a recursive function which counts the number of even 
--              integers in an array. Hint: the function head (also available
--              in Data.Array) can be used to find the first element in a
--              non-empty array.
-- TODO: refactor
numEvenInts :: Array Int -> Int
numEvenInts arr = 
  if length arr == 0
    then 0
    else
      let act = numEvenInts $ fromMaybe arr (tail arr)
      in if isEven $ fromMaybe 1 (head arr)
          then 1 + act
          else act


-- 4.2.1 (Easy) Use the map or <$> function to write a function which 
--              calculates the squares of an array of numbers.
squareArrayInts :: Array Int -> Array Int
squareArrayInts arr = (\n -> n * n) <$> arr


-- 4.2.2 (Easy) Use the filter function to write a function which removes
--              the negative numbers from an array of numbers.
filterArrayNegs :: Array Int -> Array Int
filterArrayNegs arr = filter (\n -> n > 0) arr


-- 4.2.3 (Medium) Define an infix synonym <$?> for filter. Rewrite your answer
--                to the previous question to use your new operator. Experiment
--                with the precedence level and associativity of your operator
--                in PSCi.
-- 
-- same precendence level as <$>, 4
infix 4 filter as <$?>

useFancyInfixOperator :: Array Int → Array Int
useFancyInfixOperator arr = (\n -> n > 0) <$?> arr


pairs'' :: Int → Array (Array Int)
pairs'' n = concatMap (\i -> map (\j -> [i, j]) (i..n)) (1..n)


factors :: Int → Array (Array Int)
factors n = filter (\pair -> product pair == n) $ pairs'' n
