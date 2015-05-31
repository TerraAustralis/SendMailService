serviceVM tasks
serviceVMTasks: vmTask
  | tasks persistentCounterValue |
  tasks := #().
  persistentCounterValue := TASendMailServiceVmTask sharedCounterValue.
  TASendMailServiceVmTask queue size > 0
    ifTrue: [ 
      vmTask state: persistentCounterValue.
      tasks := TASendMailServiceVmTask queue removeCount: 10.
      TASendMailServiceVmTask inProcess addAll: tasks ].
  ^ tasks