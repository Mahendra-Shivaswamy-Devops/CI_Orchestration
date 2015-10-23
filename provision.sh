#!/bin/bash

if [ ! -f /usr/bin/git ];
then
  echo "-------- Installing git -------------------"
  echo "---------------------------------------------"

  ## Install Git
  apt-get update
  apt-get -y install git
else
  echo "CHECK - Git already installed"
fi


if [ ! -f /usr/bin/build-essential ];
then
  echo "-------- Installing BUILD-ESSENTIAL------------------"
  echo "---------------------------------------------"

  ## Install build-essential
  apt-get update
  apt-get -y install build-essential
else
  echo "CHECK - Build-essential already installed"
fi


if [ ! -f /usr/lib/jvm/java-7-oracle/bin/java ];
then
  echo "-------- Installing JAVA ------------"
  echo "---------------------------------------"

  # Make java install non-interactive
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
    debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
    debconf-set-selections

  ## Install java 1.7
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
  apt-get update
  apt-get -y install oracle-java7-installer
else
  echo "CHECK - Java already installed"
fi

if [ ! -f /etc/init.d/jenkins ];
then
  echo "-------- Installing JENKINS ------------"
  echo "------------------------------------------"


  ## Install Jenkins
  wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
  sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
  apt-get update
  apt-get -y install jenkins
  /etc/init.d/jenkins restart
else
  echo "CHECK - Jenkins already installed"
fi

echo "-------- Installation successful ------------"
echo "-- Jenkins: http://localhost:8080      "
echo "---------------------------------------------"


if [ ! -f /usr/bin/mvn ];
then
  echo "-------- Installing MAVEN ------------"
  echo "------------------------------------------"
  ## Install MAVEN
  apt-get -y install maven
else
  echo "CHECK - maven already installed"
fi


