baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
        with: [ 
          spec
            loads: #('Core' 'Email');
            repository: 'github://GsDevKit/Seaside31/repository' ].
      spec
        baseline: 'ServiceVM'
          with: [ spec repository: 'github://GsDevKit/ServiceVM/repository' ];
        yourself.
      spec
        package: 'SendMail-Service-Core'
          with: [ spec requires: #('Seaside3' 'ServiceVM') ];
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