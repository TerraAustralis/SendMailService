printing
printOn: aStream
  aStream nextPutAll: 'SendMail - verify address:'.
  aStream nextPutAll: emailAddress greaseString.
  aStream nextPut: $ .
  self result isNil
    ifTrue: [ aStream nextPutAll: 'not verified, yet.' ]
    ifFalse: [ aStream nextPutAll: self result printString ]