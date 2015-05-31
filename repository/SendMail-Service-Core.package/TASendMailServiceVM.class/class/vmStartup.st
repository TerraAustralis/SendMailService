operations
vmStartup
  "take all inProcess tasks and put them back in the queue"

  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        debug: 'SendMailService STATS: Startup [1]'
        object:
          'queue: ' , TASendMailServiceVmTask queue size asString , ' scv: '
            , TASendMailServiceVmTask sharedCounterValue asString , ' hw: '
            , TASendMailServiceVmTask idHighWater asString , ' inprocess: '
            , TASendMailServiceVmTask inProcess size asString)
        addToLog.	"' insts: ', TASendMailServiceVmTask instances size asString,"
      TASendMailServiceVmTask queue addAll: TASendMailServiceVmTask inProcess.
      TASendMailServiceVmTask inProcess
        removeAll: TASendMailServiceVmTask inProcess.
      (ObjectLogEntry
        debug: 'SendMailService STATS: Startup [2]'
        object:
          'queue: ' , TASendMailServiceVmTask queue size asString , ' scv: '
            , TASendMailServiceVmTask sharedCounterValue asString , ' hw: '
            , TASendMailServiceVmTask idHighWater asString , ' inprocess: '
            , TASendMailServiceVmTask inProcess size asString)
        addToLog	"' insts: ', TASendMailServiceVmTask instances size asString," ].	"prime the pump"
  TASendMailServiceVmTask setSharedCounterValue: self tasks first state + 1