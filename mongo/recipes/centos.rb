# Cookbook:: mysql
# Recipe:: default
# Platform:: Mysql on Centos 
# Copyright:: 2018, The Authors, All Rights Reserved.
yum_repository 'mongodb-org' do
  description 'mongo yum repository'
  url 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.4/x86_64/'
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

package 'mongodb-org' do
  action :install
end

service 'mongod' do
  action :nothing
end
