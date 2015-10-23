default['install_jenkins']['jvm_options'] = nil
default['install_jenkins']['jenkins_args'] = nil
default['install_jenkins']['java'] = '/usr/bin/java'
default['install_jenkins']['host'] = 'localhost'
default['install_jenkins']['port'] = 8080
default['install_jenkins']['endpoint'] = "http://#{node['install_jenkins']['host']}:#{node['install_jenkins']['port']}"
default['install_jenkins']['home'] = '/var/lib/jenkins'
default['install_jenkins']['log_directory'] = '/var/log/jenkins'
default['install_jenkins']['repository'] = case node['platform_family']
                                           when 'debian' then 'http://pkg.jenkins-ci.org/debian'
                                           when 'rhel' then 'http://pkg.jenkins-ci.org/redhat'
                                           end
default['install_jenkins']['repository_key'] = case node['platform_family']
                                               when 'debian' then 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key'
                                               when 'rhel' then 'http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key'
                                               end
default['install_jenkins']['repository_keyserver'] = nil
default['install_jenkins']['user'] = "jenkins"
default['install_jenkins']['group'] = "jenkins"
default['install_jenkins']['listen_address'] = "0.0.0.0"
