#!/bin/sh

# example of using cloudformation to launch an ec2 instance and have docker installed as a part of user data,
# note that this also uses a parameter to pass the keypair name to the CF template

# run this with an already created keypair for the instance

# note that you can delete the stack and associated resources (such as the ec2 instance) with this:
# aws cloudformation delete-stack --stack-name ec2-docker


function usage() {
cat <<EOF
    usage: stack.sh keypair-name
EOF
}

if [ $# -ne 1 ]
then
    usage
    exit 1
fi

aws cloudformation create-stack --stack-name ec2-docker --template-body file://$PWD/stack.yml --region us-east-1 --parameters ParameterKey=mykeyname,ParameterValue=$1

