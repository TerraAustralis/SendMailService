actions
waEmailMessageString
  | stream headers |
  ^ String
    streamContents: [ :stream | 
      email renderAddress: email from withHeader: 'From: ' on: stream.
      email renderAddress: address withHeader: 'To: ' on: stream.
      stream
        nextPutAll: 'Subject: ';
        nextPutAll: email subject;
        nextPut: Character cr.
      email replyTo isNil
        ifFalse: [ email renderAddress: email replyTo withHeader: 'Reply-To: ' on: stream ].
      email headers
        keysAndValuesDo: [ :key :value | 
          stream
            nextPutAll: key greaseString;
            nextPut: $:;
            nextPut: Character space;
            nextPutAll: value greaseString;
            nextPut: Character cr ].
      stream nextPut: Character cr.	"let body start"
      email writeBodyOn: stream ]