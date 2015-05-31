accessing
exampleEmail
  ^ (WAMultiPartEmailMessage
    from:
      (WAEmailAddress address: '"The Punters Guide" <doNotReply@thePuntersGuide.com>')
    to: (WAEmailAddress address: 'jupiter.jones@mail.com')
    subject: 'Unit Test Email')
    addCc: (WAEmailAddress address: 'jodimo42@gmail.com');
    addBcc: (WAEmailAddress address: 'phil@nextround.co');
    addTo: (WAEmailAddress address: 'terra.australis@icloud.com');
    addCc: (WAEmailAddress address: 'badAddress@nextround.co');
    setHtmlBody: [ :canvas | canvas paragraph: 'This is the HTML version of the email' ];
    setStringBody:
        'Unit Test Email
===============

This is the plain text email.';
    yourself