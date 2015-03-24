#!/bin/bash

JENKINS_DIR="$HOME/aspera-sync/jenkins"
if [ ! -d ${JENKINS_DIR} ]; then
  mkdir -p ${JENKINS_DIR}
  wget -nv http://mirrors.jenkins-ci.org/war/latest/jenkins.war -O ${JENKINS_DIR}/jenkins.war
  chmod 644 ${JENKINS_DIR}/jenkins.war
  cp -r $HOME/aspera-sync/.jenkins $HOME/
fi
