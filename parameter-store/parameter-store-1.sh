aws cloudformation create-stack --stack-name parameter-store-1 --template-body="`cat parameter-store-1.yaml`" --parameters ParameterKey=name,ParameterValue=test-1 ParameterKey=value,ParameterValue=test-2