#this will run on ubuntu

execute "run-apt-get-update-" do
  command "sudo apt-get update -y"
end

package 'nginx' do
  action :install
end

template 'default' do
  path '/etc/nginx/sites-available/default'
  source 'default.erb'
end

service 'nginx' do
	#supports :status=>true, :restart=>true, :reload=> true
	action :restart
end

#cookbook_file "/usr/share/nginx/html/index.html" do
cookbook_file "/var/www/html/index.nginx-debian.html" do
  source "index.html"
  mode "0644"
end
