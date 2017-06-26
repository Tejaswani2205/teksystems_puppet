DevOps project:

High level procedure to accomplish the given project is as follows:

Created a VPC with CIDR 10.0.0.0/20 (4096 IP addresses)
Created a security group with following ports
```
SSH 22
HTTP 80
HTTPS 443
```


Configuration management:

Deployed puppet server from AWS market place
(We can also download puppet package from puppet labs and configure puppet server on ec2 instance)

Key pair - Teksystems.pem

puppetadmin@35.164.228.218

Webserver -> ec2-user@52.36.5.205

Then take root access by giving the below command
sudo su -root

Code Directory:
/etc/puppetlabs/code/environments/production

Under manifests --> site.pp node code (webserver)

Puppet modules
vcsrepo 
apache 
  
Node:

Deployed an ec2 instance and ran following command to add it to pupet master
curl -k https://ip-10-0-0-82.us-west-2.compute.internal:8140/packages/current/install.bash | sudo bash

site.pp --> node ec2 ---> puppet agent -t 
