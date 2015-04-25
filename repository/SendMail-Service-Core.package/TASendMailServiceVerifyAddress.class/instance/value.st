actions
value
  "perform the get outside of transaction ... once we've got the result..."

  | mailServerTranscript |
  mailServerTranscript := (HTTPSocket httpGet: self url)
    throughAll: 'Europe/London - ';
    upTo: Character space.
  GRPlatform current
    doTransaction: [ 
      "abort and persist the result"
      result := mailServerTranscript ].
  ^ result