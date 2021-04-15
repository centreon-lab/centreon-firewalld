# Centreon Firewalld service files

Set of Centreon services configuration XML files for the Firewalld daemon.

How to use
----------

Install the package

```sh
# rpm -ihv centreon-firewalld-0.0.1-1.x86_64.rpm 
Preparing...                          ################################# [100%]
Updating / installing...
   1:centreon-firewalld-0.0.1-1       ################################# [100%]
```

You can use the released files from: https://github.com/centreon-lab/centreon-firewalld/releases/download/0.0.1/centreon-firewalld-0.0.1-1.x86_64.rpm

Add firewall rules using the name of services

```sh
# firewall-cmd --zone=public --add-service=centreon-broker --permanent
success
# firewall-cmd --zone=public --add-service=centreon-gorgone --permanent
success
# firewall-cmd --reload
success
```

Example output

```sh
# firewall-cmd --list-all --zone=public                                 
public
  target: default
  icmp-block-inversion: no
  interfaces: 
  sources: 
  services: centreon-broker centreon-gorgone dhcpv6-client ssh
  ports: 
  protocols: 
  masquerade: no
  forward-ports: 
  source-ports: 
  icmp-blocks: 
  rich rules: 

```

How to build
------------

#### Using Docker

Build image:

```sh
docker build --rm -t centreon-c7-build .
```

Run building packages:

```sh
docker run -it --rm -v "$(pwd):/build" centreon-c7-build
```
