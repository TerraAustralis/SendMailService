actions
send
  | stream headers |
  ^ SMTPClient
    directDeliverMailFrom: email from address greaseString
    to: {(address address greaseString)}
    text: self waEmailMessageString