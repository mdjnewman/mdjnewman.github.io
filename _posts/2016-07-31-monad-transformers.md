---
title: Monad transformers
layout: post
---

I've been spending some time working through [Haskell Programming From First
Principles](http://haskellbook.com/ recently) which is a very comprehensive
introduction to functional programming and Haskell.

One of the exercises to implement a simplified command line version of
[Morra](https://en.wikipedia.org/wiki/Morra_(game)), which involves keeping
track of scores and reading user input.

My initial method to play a round looked something like this:

```haskell
playRound :: Config -> Scores -> IO (Bool, Scores)
  playRound config scores = do
  putStr "P1: "
  p1HandMaybe <- getHumanHand
  case p1HandMaybe of
    Nothing -> return (True, scores)               -- error case 1
    Just x -> do
      putStr "P2: "
      p2HandMaybe <- getHumanHand
      case p2HandMaybe of
        Nothing -> return (True, scores)           -- error case 2
        Just y -> do
          let evenWins = (x + y) `mod` 2 == 0
          return (False, updateScores config evenWins scores)
```

`playRound` takes the configuration for the game and the current score, and
returns a side effecting computation that will return a tuple with the new
scores and a boolean indicating if the game is finished.

The method `getHumanHand` used above returns a `IO (Maybe Int)`, which can be
interpreted as a side effecting action that might return an integer (in this
case, the side effect is reading from the console and we can't trust the user
to enter an integer, hence the `Maybe`).

The problem then is that we're then manually unpacking these `Maybe Int`
values, which leads to the ugly nesting and case statements. However, we can
see on the lines marked 'error case' above that the handling for both cases is
the same - we assume that if the user has entered something other than an `Int`
that they want to end the game.

I recently learned about Monad transformers, which allow you to compose monads.
In this case, we want to compose the Maybe monad with the IO monad, so we will
use [`MaybeT`](https://www.stackage.org/haddock/lts-6.2/transformers-0.4.2.0/Control-Monad-Trans-Maybe.html#g:1).

Rewriting `getHumanHand` to return a `MaybeT IO Int` and rewriting `playRound`
results in the following:

```haskell
playRound' :: Config -> Scores -> IO (Bool, Scores)
playRound' config scores = do

  newScores <- runMaybeT $ do
    liftIO $ putStr "P1: "
    p1Hand <- getHumanHand'
    liftIO $ putStr "P2: "
    p2Hand <- getHumanHand'
    let evenWins = (p1Hand + p2Hand) `mod` 2 == 0
    return $ updateScores config evenWins scores

  return $ case newScores of
    Nothing -> (True, scores)
    Just x -> (False, x)
```

The nice thing about this implementation is that we've avoided the need for
pattern matching, as the `do` block above where we're dealing with the
potentially failing computations will immediately short circuit and return a
`Nothing` if either user fails to provide a legitimate value.

This is the first time I've actually used a Monad transformer, and it was good
to see how it cleans up the implementation of `playRound`.
