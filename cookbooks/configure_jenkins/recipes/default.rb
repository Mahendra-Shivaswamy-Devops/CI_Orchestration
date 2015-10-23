#
# Cookbook Name:: configure_jenkins
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service 'jenkins' do
action :restart
end

case node['platform_family']
when 'debian'
maven_home = "/usr/share/maven"
  package 'maven'
when 'rhel'
maven_home = "/usr/share/apache-maven"
bash "install_maven" do
        code <<-EOH
      wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo 
      yum install -y apache-maven
 EOH
end


 

else
  fail "`#{node['platform_family']}' is not supported!"
end

package "git"

template '/var/lib/jenkins/hudson.tasks.Maven.xml' do
  source 'hudson.tasks.Maven.xml.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '0644'
  only_if {Dir.exists?("/var/lib/jenkins")}
  variables ({
        :maven_home => "#{maven_home}"
    })
  #notifies :restart, 'service[jenkins]', :immediately
 # notifies :restart, 'service[jenkins]', :immediately
end

#service 'jenkins' do
#  supports status: true, restart: true, reload: true
#  action  [:enable, :start]
#end

service 'jenkins' do
action :restart
end

bash "clone_source_remote" do
        cwd "#{Chef::Config[:file_cache_path]}"
        code <<-EOH
        git clone https://github.com/rlab-mahendra/cassandra_app.git
  EOH
end

bash "clone_source_local" do
        cwd "/home"
        code <<-EOH
        git clone file://#{Chef::Config[:file_cache_path]}/cassandra_app
  EOH
end

xml = File.join(Chef::Config[:file_cache_path], 'config.xml')




include_recipe "configure_jenkins::install_plugins"
include_recipe "configure_jenkins::create_job"
