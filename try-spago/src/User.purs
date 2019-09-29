module User where

import Prelude as Pr

import Data.Semigroup

data Person = Person { age :: Int, name :: String }

showPerson :: Person -> String
showPerson (Person p) = p.name <>  " is " <> Pr.show p.age