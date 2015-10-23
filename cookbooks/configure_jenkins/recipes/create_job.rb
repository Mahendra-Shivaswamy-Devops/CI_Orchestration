template "#{Chef::Config[:file_cache_path]}/config.xml" do
  source 'config.xml.erb'
  only_if {Dir.exists?("/var/lib/jenkins/jobs")}
end

bash "create_job" do
        cwd "#{Chef::Config[:file_cache_path]}"
        code <<-EOH
        sleep 20
       #curl -X POST -H "Content-Type:application/xml" -d @config.xml "http://0.0.0.0:8080/createItem?name=roadrunner" 
       #curl -X POST -H "Content-Type:application/xml" -d @config.xml --retry 999 --retry-max-time 0  "http://0.0.0.0:8080/createItem?name=roadrunner" 
      curl -X POST -H "Content-Type:application/xml" -d @config.xml --retry 999 --retry-max-time 0  "http://0.0.0.0:8080/createItem?name=roadrunner" 
EOH
only_if {File.exists?("#{Chef::Config[:file_cache_path]}/config.xml")}
not_if {Dir.exists?("/var/lib/jenkins/jobs/roadrunner")}
end  

