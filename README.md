# Aspera Sync with ASCP and Jenkins

This project aims to help companies automate your transfer process using [Aspera Connect Server](http://asperasoft.com/) and [Aspera Ascp Client](http://downloads.asperasoft.com/en/downloads/50). This is a simple way to transfer large files or sync remote folders, over the LAN/WAN, with ascp client. [Jenkins](https://jenkins-ci.org/) is very useful to schedule, manage and monitor long running transfers.

Installing Aspera Sync
--

## Cloning git repository

```sh
$ cd ~/
$ git clone https://github.com/wmarinho/aspera-sync.git
$ cd aspera-sync
  
$ sudo sh bin/install-ascp.sh
$ sh bin/install-jenkins.sh
$ sh bin/init-jenkins.sh --httpPort=8080 &
```

## Edit conf/ascp.properties and change default parameters.  

```sh
ASPERA_SERVER=demo.asperasoft.com
ASPERA_USER=asperaweb
ASPERA_PASS=demoaspera
#ASPERA_PRIVATE_KEY=$HOME/.ssh/id_rsa

ASCP_MAX_RATE="-l 300M"

ASCP_OPTIONS="-d -k 3 -p --precalculate-job-size --file-checksum=md5"

```

## Command line usage

```sh
$ sh bin/transfer.sh {source_path} {target_path} {max_rate}
```

## Output log

```sh
$ sh bin/transfer.sh

Starting transfer with asperaweb@demo.asperasoft.com  ...
Syncing asperaweb@demo.asperasoft.com:/ -->> /home/user/
Running: ascp -d -k 3 -p --precalculate-job-size --file-checksum=md5 --file-manifest-path=/home/user/aspera-sync/logs --file-manifest=text -l 300M asperaweb@demo.asperasoft.com:/ /home/user/
Syncing has completed successfully!!
```

## Accessing jenkins interface

http://ip-address:8080

There is a default job configured (aspera-sync). It can be used to create custom jobs using this template. For details about how to work with jenkins, access http://jenkins-ci.org/. 
