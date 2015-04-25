printing
printOn: aStream
  aStream nextPutAll: 'SendMail - send email '.
  aStream nextPutAll: 'to:' , email to asString.
  aStream nextPut: $ .
  self result isNil
    ifTrue: [ aStream nextPutAll: 'not sent, yet' ]
    ifFalse: [ aStream nextPutAll: self result ]