baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Network-Protocols'
        with: [ spec repository: 'github://TerraAustralis/Network-Protocols/repository' ].
      spec
        baseline: 'ServiceVM'
        with: [ spec repository: 'github://GsDevKit/ServiceVM/repository' ].
      spec
        package: 'SendMail-Service-Core'
          with: [ spec requires: #('Network-Protocols' 'ServiceVM') ];
        package: 'SendMail-Service-Component'
          with: [ spec requires: #('SendMail-Service-Core') ];
        package: 'SendMail-Service-Tests'
          with: [ spec requires: #('SendMail-Service-Core') ];
        yourself.
      spec
        group: 'default' with: #('Core' 'Tests');
        group: 'Core'
          with: #('SendMail-Service-Core' 'SendMail-Service-Component');
        group: 'Tests' with: #('SendMail-Service-Tests');
        group: 'CI' with: #('Core' 'Tests');
        yourself ]