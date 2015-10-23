remote_file "/var/lib/jenkins/plugins/git.hpi" do
  action :create_if_missing
  owner "jenkins"
  group "jenkins"
  mode "0644"
  source "http://updates.jenkins-ci.org/download/plugins/git/2.4.0/git.hpi"
 #only_if {Dir.exists?("/var/lib/jenkins/plugins")}
 retries 3
 retry_delay 10
end

remote_file "/var/lib/jenkins/plugins/git-client.hpi" do
  action :create_if_missing
  owner "jenkins"
  group "jenkins"
  mode "0644"
  source "http://updates.jenkins-ci.org/download/plugins/git-client/1.19.0/git-client.hpi"
 retries 3
 retry_delay 10 
#only_if {Dir.exists?("/var/lib/jenkins/plugins")}
end

remote_file "/var/lib/jenkins/plugins/scm-api.hpi" do
  action :create_if_missing
  owner "jenkins"
  group "jenkins"
  mode "0644"
  source "http://updates.jenkins-ci.org/download/plugins/scm-api/0.2/scm-api.hpi"
 retries 3
 retry_delay 10 
#only_if {Dir.exists?("/var/lib/jenkins/plugins")}
end

service 'jenkins' do
action :restart
end

