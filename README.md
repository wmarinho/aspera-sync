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
## Access jenkins interface

http://ip-address:8080

There is a aspera-sync job configured. It can be used to create custom jobs using this template. For details, access http://jenkins-ci.org/
