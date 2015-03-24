# Aspera Sync with ASCP and Jenkins

This project intend to help companies automate your transfer process using [Aspera Connect Server](http://asperasoft.com/) and [Aspera Ascp Client](http://downloads.asperasoft.com/en/downloads/50). This is a simple way to transfer large files over the WAN, faster then FTP and HTTP.

[Jenkis](https://jenkins-ci.org/) is very useful to schedule, manage and monitor long running transfers.

Installing Aspera Sync
--

## Cloning Git repository

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
$ sh/transfer.sh {source_path} {target_path} {max_rate}
```

## Access jenkins interface

http://ip-address:8080

There is a aspera-sync job configured. It can be used to create custom jobs using this template. For details, access http://jenkins-ci.org/
