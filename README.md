
created a VPC with cidr 10.0.0.0/20 (4096 IP address)
created a security group with following ports
```
SSH 22
HTTP 80
HTTPS 443
```


Configuration management
Deployed puppet server from aws market place
We can also download puppet package from puppet labs and configure puppet server on ec2 instance.

code directory:
/etc/puppetlabs/code/environments/production/modules

Puppet modules
vcsrepo 
apache 
  
Node:

Deployed an ec2 instance and ran following command to add it to pupet master
curl -k https://ip-10-0-0-82.us-west-2.compute.internal:8140/packages/current/install.bash | sudo bash

site.pp --> node ec2 ---> puppet agent -t 
