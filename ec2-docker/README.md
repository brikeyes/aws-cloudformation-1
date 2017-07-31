## Description

This is an example of using CF to launch an EC-2 instance and then install
docker.
It also demonstrates how to pass multiple parameters to the CF stack using a json formatted
object.

Look in the stack.sh script to see how the parameters are passed to CF.

Don't forget to delete the stack (which should terminate the ec2 instance when
you are finished with this).

Look at how the keynames and values are delimited using escaped double quotes.

Usage:

stack.sh keypairname allow-ip-address-range

Example:

    stack.sh mykeypairname 1.2.3.4/32


Note that this will launch using an ami that is applicable for at least us-east-1
and that the ec2 instance type will be m3.medium.

After the stack creation completes you should be able to ssh to the instance and then
run a docker container to confirm that it actually worked correctly.

```
$ ssh -i mykeypairname.pem ubuntu@public-ip-address

Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 4.4.0-1020-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

65 packages can be updated.
30 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

ubuntu$ docker container run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b04784fba78d: Pull complete
Digest: sha256:f3b3b28a45160805bb16542c9531888519430e9e6d6ffc09d72261b0d26ff74f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://cloud.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```

Now delete the stack and instance when you are finished.

    $ aws cloudformation delete-stack --stack-name ec2-docker

