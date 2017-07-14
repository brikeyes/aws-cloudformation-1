# aws-cloudformation
Examples of using AWS CloudFormation

Automating cloud provisioning is always a useful and necessary activity.
It can be tempting to use the AWS admin console to create various resources or take quick actions.
The drawback of doing that is if you need to document the process to be repeated later by yourself
or someone else it can be very time consuming to note, or even potentially remember, what and how you did it.
Frequently that sort of documentation will include numerous screen shots which are probably large and contain
much more detail that is required and can be confusing as to what actions to take.

Instead of using the console the AWS cli can be used for automation but that can also lead to a number of problems
in terms of error checking and testing the actions taken as well as being complete.
Along with that when you need to delete resources, particularly while testing your script,
it can be challenging to determine the correct order
necessary to completely remove everything related because of the dependencies between the resources.

A useful alternative to make use of is the AWS CloudFormation service.
This service provides the facilities to fully create and delete the resources that you need.
Once a CF stack has been created and confirmed to work it will likely do a much better job of creating and then deleting
your AWS resources.

This repo is intended to provide examples of using CloudFormation by including templates and also how to use the cli to invoke them.
Learning to effectively use CloudFormation can require some time and numerous attempts at various levels but the result
will be worth the effort.

Some of the examples will include templates in json and in yaml to provide
a useful comparison between the two formats.
One advantage of using yaml is that comments can be included in the template itself.




