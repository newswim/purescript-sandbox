module Chapter01 where

import Prelude
import Effect (Effect)
import Effect.Console (log)

{-

Type annotations, though not required, are treated as
warnings by the compiler when missing on top-level values.

Commenting out the type annotation of "iAmANumber" should render
the following warning:

  No type declaration was provided for the top-level declaration of iAmANumber.

  It is good practice to provide type declarations as a form of documentation.
  The inferred type of iAmANumber was:

    Number

-}

-- To squelch this warning, simply add the appropriate type annotation.
iAmANumber :: Number
iAmANumber =
  let square x = x * x
  in square 42.0


-- Again, the compiler is able to infer types, even when a type
-- is unknown by the compiler. Try commenting out this annotation.
iterate :: ∀ a. (a → a) → Int → a → a
iterate f 0 x = x
iterate f n x = iterate f (n - 1) (f x)


main :: Effect Unit
main =
  let
    -- since "message" is not a top-level value, we're not required
    -- to provide a type annotation.
    message = "Hello, world!"
  in
    log message