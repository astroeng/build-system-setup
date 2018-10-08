#!/bin/bash

if [[ "$1" == "setup" ]]; then

sudo apt update
sudo apt upgrade

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -

sudo add-apt-repository "deb https://pkg.jenkins.io/debian-stable"

sudo apt-get update

sudo apt-get install jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins

fi
