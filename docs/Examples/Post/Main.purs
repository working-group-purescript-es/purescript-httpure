module Examples.Post.Main where

import Prelude
import Effect.Console (log)
import HTTPure
  ( Request
  , ResponseM
  , ServerM
  , Method(Post)
  , serve
  , ok
  , notFound
  , toString
  )

-- | Route to the correct handler
router :: Request -> ResponseM
router { body, method: Post } = toString body >>= ok
router _ = notFound

-- | Boot up the server
main :: ServerM
main =
  serve 8080 router do
    log " ┌───────────────────────────────────────────┐"
    log " │ Server now up on port 8080                │"
    log " │                                           │"
    log " │ To test, run:                             │"
    log " │  > curl -XPOST --data test localhost:8080 │"
    log " │    # => test                              │"
    log " └───────────────────────────────────────────┘"
