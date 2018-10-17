# Cookbook:: mysql
# Recipe:: default
# Platform:: Mysql on Centos 
# Copyright:: 2018, The Authors, All Rights Reserved.
yum_repository 'mysql-server' do
  description 'mysql yum repository'
  url 'http://repo.mysql.com/yum/mysql-5.7-community/el/7/$basearch/'
  enabled true
  gpgcheck false
  action :create
end

execute "run-yum-clean-all" do
  command "sudo yum clean all"
end
execute "run-yum-update-" do
  command "sudo yum  update -y"
end

package 'mysql-community-server' do
  action :install
end

service 'mysqld' do
  action :nothing
end
