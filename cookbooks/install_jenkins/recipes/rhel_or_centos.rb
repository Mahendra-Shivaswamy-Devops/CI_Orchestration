include_recipe 'yum::default'

package 'java-1.7.0-openjdk'

  yum_repository 'jenkins-ci' do
    baseurl node['install_jenkins']['repository']
    gpgkey  node['install_jenkins']['repository_key']
  end

  package 'jenkins' do
    version node['install_jenkins']['version']
  end

  # The package install creates the Jenkins user so now is the time to set the home
  # directory permissions.
  directory node['install_jenkins']['home'] do
    owner     node['install_jenkins']['user']
    group     node['install_jenkins']['group']
    mode      '0755'
    recursive true
  end

  template '/etc/sysconfig/jenkins' do
    source   'jenkins-config-rhel.erb'
    mode     '0644'
    notifies :restart, 'service[jenkins]', :immediately
  end

service 'jenkins' do
  supports status: true, restart: true, reload: true
  action  [:enable, :start, :restart]
end

