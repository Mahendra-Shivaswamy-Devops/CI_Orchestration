# install git 

apt-get install git

# Clone the repo which has project to orchestrate

git clone https://github.com/Mahendra-Shivaswamy-Devops/CI_Orchestration.git

cd CI_Orchestration

# Vagrant file changes

# Comment below two lines
#  config.ssh.max_tries = 40
#  config.ssh.timeout = 120
 
# Install VirtualBoX

sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list" && wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install virtualbox-5.0


# Installing the basic components for the orchestration

# Install vagrant

wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb
dpkg -i vagrant_1.7.4_x86_64.deb

# Install chefdk
# ChefDk install components like berkshelf and others..

wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.9.0-1_amd64.deb
dpkg -i chefdk_0.9.0-1_amd64.deb


# install vagrant plugins

# install vagrant-berkshelf

vagrant plugin install vagrant-berkshelf

# install vagrant-omnibus

vagrant plugin install vagrant-omnibus


#Laucnh VM
vagrant up

#Provision with Chef-solo
vagrant provision

####################################################

#ACCESS JENKINS HTTP:://127.0.0.1:8080

###################################################
