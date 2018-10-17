#
# Cookbook:: webserver
# Recipe:: default
# Platform:: Nginx 
# Copyright:: 2018, The Authors, All Rights Reserved.

yum_repository 'nginx' do
  description 'nginx yum repository'
  url 'http://nginx.org/packages/mainline/rhel/7/$basearch/'
  enabled true
  gpgcheck false
  action :create
end

#service 'yum' do
#  action :update
#end

package 'nginx' do
  action :install
end

#template 'default' do
#  path '/etc/nginx/sites-available/default'
#  source 'default.erb'
#end

service 'nginx' do
  action [ :enable, :restart ]
end

cookbook_file "/usr/share/nginx/html/index.html" do
#cookbook_file "/var/www/html/index.nginx-debian.html" do
  source "index.html"
  mode "0644"
end
