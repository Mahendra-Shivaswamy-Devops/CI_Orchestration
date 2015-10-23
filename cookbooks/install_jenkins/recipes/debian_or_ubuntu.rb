  include_recipe 'apt::default'

  package 'openjdk-7-jdk'

  apt_repository 'jenkins' do
    uri          node['install_jenkins']['repository']
    distribution 'binary/'
    key          node['install_jenkins']['repository_key']
    unless node['install_jenkins']['repository_keyserver'].nil?
      keyserver    node['install_jenkins']['repository_keyserver']
    end
  end

  package 'jenkins' do
    version node['install_jenkins']['version']
  end

  template '/etc/default/jenkins' do
    source   'jenkins-config-debian.erb'
    mode     '0644'
    notifies :restart, 'service[jenkins]', :immediately
  end

service 'jenkins' do
  supports status: true, restart: true, reload: true
  action  [:enable, :start, :restart]
end


