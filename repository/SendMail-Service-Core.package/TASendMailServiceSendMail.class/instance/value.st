actions
value
  | sendResult |
  "perform the get outside of transaction ... once we've got the result..."
  sendResult := self send.
  GRPlatform current
    doTransaction: [ 
      "abort and persist the result"
      result := sendResult ].
  ^ result