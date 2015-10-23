chef-jenkins-example
====================

automation scripts for setting up a CI server."

Description:
Using orchestration tool setup a CI server and provide us with reference to your init script. This CI server should listen to commits on a local git repository present at a specific location in the same machine. Since you will NOT be sharing the server image (you will be sharing only the automation scripts) please keep in mind that NO MANUAL setup will get reflected to our end image. Below are certain parameters for you to consider.

VCS: git (this repository is a local repo inside the machine)
CI: jenkins/go/teamcity/Bamboo (any other of your choice)
Orchestration tool: Chef/ansible/puppet/SaltStack (any other of your choice)
Server: VirtualBox(vagrant preferably), Docker

------------------------------------------

Tools used:
1. Vagrant
2. jenkins
3. chef-solo
4. git


----------------------------------------------------------------------

init_script.sh

Assuming your development machine is ubuntu provided the init_script.sh to prepare orchestration environment.
Prepares development box to install necessary tools.
Installs git, vagrant, chefdk, vegrant plugins, virtual box

Do not use this script if you already have these setup.
just run below commands

git clone https://github.com/Mahendra-Shivaswamy-Devops/CI_Orchestration.git
cd CI_*
vagrant up --provision

------------------------------------------------------------------------














