tests
testSendMail
  | gemServer recount email tasks |
  recount := 0.
  email := self exampleEmail.
  tasks := Dictionary new.
  gemServer := self gemServer.
  [ 
  gemServer restartGems.
  (Delay forSeconds: 3) wait.
  email to , email cc , email bcc
    do: [ :emailAddress | 
      tasks
        at: emailAddress
        put:
          (TASendMailServiceVmTask
            valuable:
              (TASendMailServiceSendMail email: email address: emailAddress)) ].
  tasks values do: [ :task | task addToQueue ].
  System commitTransaction.
  [ 
  System abortTransaction.
  Transcript
    cr;
    show: tasks printString.
  System commitTransaction.
  (tasks values select: [ :task | task hasValue ]) size = tasks values size
    or: [ recount > 30 ] ]
    whileFalse: [ 
      recount := recount + 1.
      (Delay forSeconds: 1) wait ].
  self deny: tasks values first hasError.
  self assert: tasks values first value ~~ nil ]
    ensure: [ 
      gemServer stopGems.
      (Delay forSeconds: 3) wait ]