#!/bin/bash
if [ ! -d "$HOME/aspera-sync/logs" ]; then
  mkdir -p $HOME/aspera-sync/logs
fi
if [ "$1" ]; then
  JENKINS_OPTIONS=$1
fi
nohup java -jar $HOME/aspera-sync/jenkins/jenkins.war ${JENKINS_OPTIONS} >  $HOME/aspera-sync/logs/jenkins.log 2>&1
