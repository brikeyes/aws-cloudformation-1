#!/bin/sh

# example of using cloudformation to launch an ec2 instance and have docker installed as a part of user data,
# note that this also uses parameters to pass the keypair name and allowed ip address range to the CF template

# run this with an already created keypair for the instance and ip address to allow for access

# note that you can delete the stack and associated resources (such as the ec2 instance) with this:
# aws cloudformation delete-stack --stack-name ec2-docker


function usage() {
cat <<EOF
    usage: stack.sh keypair-name ip-address-range-allowed
    Example: stack.sh mykeypairname 1.2.3.4/32
EOF
}

if [ $# -ne 2 ]
then
    usage
    exit 1
fi

aws cloudformation create-stack \
    --stack-name ec2-docker \
    --template-body file://$PWD/stack.yml --region us-east-1 \
    --parameters "[{\"ParameterKey\":\"mykeyname\",\"ParameterValue\":\"$1\"}, {\"ParameterKey\":\"sgipaddress\",\"ParameterValue\":\"$2\"}]"

