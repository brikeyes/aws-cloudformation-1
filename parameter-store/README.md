## Description
An issue that I regularly encounter is how to store things like passwords and tokens
in a manner that allows access to them across ec2 instances and desktops.

One way is to use the AWS SSM parameter store. (admin console->ec2->Parameter Store).
All you need to do is use the `create parameter` function with a name and value.
Retrieving it will return a json object that includes the value.

Accessing it via the cli is then done like this:

    $ aws ssm get-parameters --names "test-parameter-1"
    {
        "Parameters": [
        {
            "Name": "test-parameter-1",
            "Type": "String",
            "Value": "test value 1"
            }
        ],
        "InvalidParameters": []
    }

An example of getting a specific value using jq follows

    $ aws ssm get-parameters --names "test-parameter-1" | jq .Parameters[].Value "test value 1"

Finding what parameters are available can be done like this:

    $ aws ssm describe-parameters
    {
        "Parameters": [
        {
            "LastModifiedDate": 1499869122.618,
            "Name": "test-parameter-1",
            "Description": "experimenting with parameter store stuff",
            "Type": "String",
            "LastModifiedUser": "arn:aws:iam::xxx:user/xxx"
            }
        ]
    }

Creating a parameter via the aws cli would look like this

    $ aws ssm put-parameter --name test-parameter-2 --type String  --value test-value-2




### parameter-store-1.yaml

Example of creating 2 values in the parameter store with cloud formation using the cli.

#### How to

Note that the AWS cli must already be configured and working for your account.


```aws cloudformation create-stack --stack-name parameter-store-1 --template-body="`cat parameter-store-1.yaml`" --parameters ParameterKey=name,ParameterValue=test-1 ParameterKey=value,ParameterValue=test-2```

