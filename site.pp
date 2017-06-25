## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node "ip-10-0-0-104.us-west-2.compute.internal" {
  # This is where you can declare classes for all nodes.
  # Example:
  class { 'apache': }

  apache::vhost { '*-http':    
    servername      => 'ec2-52-36-5-205.us-west-2.compute.amazonaws.com',    
    port            => '80',    
    ssl      => true,
    ssl_cert => '/etc/ssl/com.cert',
    ssl_key  => '/etc/ssl/com.key',
    docroot         => '/var/www/html',    
    redirect_status => 'permanent',    
    redirect_dest   => 'https://ec2-52-36-5-205.us-west-2.compute.amazonaws.com',  
  }  
  apache::vhost { '*-https':
    servername => 'ec2-52-36-5-205.us-west-2.compute.amazonaws.com',
    port     => '443',
    docroot  => '/var/www/html',
    ssl      => true,
    ssl_cert => '/etc/ssl/com.cert',
    ssl_key  => '/etc/ssl/com.key',
}

  vcsrepo { '/var/www/html':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/Tejaswani2205/teksystems.git',
  }
}
