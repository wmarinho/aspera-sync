#!/bin/bash
if [ ! -d "$HOME/aspera-sync/logs" ]; then
  mkdir -p $HOME/aspera-sync/logs
fi
nohup java -jar $HOME/aspera-sync/jenkins/jenkins.war >  $HOME/aspera-sync/logs/jenkins.log 2>&1
