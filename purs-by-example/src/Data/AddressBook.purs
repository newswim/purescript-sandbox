module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head, nubBy, null)
import Data.Maybe (Maybe)


type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }


type Address =
  { street :: String
  , city   :: String
  , state  :: String
  }


type AddressBook = List Entry


showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <>
                  entry.firstName <> ", " <>
                  showAddress entry.address

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <>
                   addr.city <> ", " <>
                   addr.state


emptyBook :: AddressBook
emptyBook = empty


-- witness the /eta conversion/; becoming Point-Free!
-- insertEntry entry book = Cons entry book
-- insertEntry entry = Cons entry
-- insertEntry = Cons
insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons


findEntry :: String -> String -> AddressBook -> Maybe Entry
-- V1:
-- '$' is just an alias for /apply/, with an infixr of 0
-- findEntry first last book = head $ filter filterEntry book
-- V2:
-- we can also use the '>>>' or '<<<' operators to express composition
findEntry first last = head <<< filter filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == first && entry.lastName == last

{-
 Exercises:

 1. (Easy) Test your understanding of the findEntry function by writing down 
    the types of each of its major subexpressions. For example, the type of 
    the `head` function as used is specialized to AddressBook -> Maybe Entry.

    A. We already know the type of filterEntry, Entry -> Boolean
    B. `filter` then is `(filterEntry :: Entry -> Boolean) -> AddressBook -> AddressBook`

 2. (Medium) Write a function which looks up an Entry given a street address, 
    by reusing the existing code in findEntry. Test your function in PSCi.

 3. (Medium) Write a function which tests whether a name appears in a AddressBook, 
    returning a Boolean value. Hint: Use PSCi to find the type of the Data.List.null function,
    which tests whether a list is empty or not.

 4. (Difficult) Write a function removeDuplicates which removes duplicate address book 
    entries with the same first and last names. Hint: Use PSCi to find the type of the 
    Data.List.nubBy function, which removes duplicate elements from a list based on an 
    equality predicate.

-}

-- Answer for exercise #2
findByAddress :: String → AddressBook → Maybe Entry
findByAddress address = head <<< filter filterEntry
  where
    filterEntry entry = entry.address.street == address


-- Answer for exercise #3
inAddressBook :: String -> String -> AddressBook -> Boolean
inAddressBook first last = not null <<< filter filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == first && entry.lastName == last


-- Answer for exercise #4
removeDupes :: AddressBook -> AddressBook
removeDupes = nubBy (\e1 e2 -> e1.firstName == e2.firstName && e1.lastName  == e2.lastName)
