# Cookbook:: TIG Stack
# Recipe:: default
# Platform:: TIG on Centos 
# Copyright:: 2018, The Authors, All Rights Reserved.
#-------Adding Telegraf InfluxDB Repository-------------------

yum_repository 'Telegraf_Influxdb' do
  description 'TI yum repository'
  url 'https://repos.influxdata.com/rhel/$releasever/$basearch/stable'
  enabled true
  gpgcheck true
  gpgkey 'https://repos.influxdata.com/influxdb.key'
  action :create
end

yum_repository 'GRAFANA_REPO' do
  description 'Grafana yum repository'
  url 'https://packagecloud.io/grafana/stable/el/7/$basearch'
  enabled true
  gpgcheck true
  gpgkey 'https://packagecloud.io/gpg.key  https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana'
  action :create
end

#-------Updating Yum Repo-------------------------------------
execute "run-yum-clean-all" do
  command "sudo yum clean all"
end
execute "run-yum-update-" do
  command "sudo yum  update -y"
end

#---------Installing-Packages---------------------------------

package %w(telegraf influxdb grafana) do
  action :install
end

#---------Managing-Configurations----------------------------

directory '/var/lib/grafana/dashboards' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file "/etc/grafana/provisioning/datasources/datasource.yaml" do
      source "datasource.yaml"
end

cookbook_file "/etc/grafana/provisioning/dashboards/dashboard.yaml" do
      source "dashboard.yaml"
end

cookbook_file "/var/lib/grafana/dashboards/Dashboard.json" do
      source "Dashboard.json"
end



#--------Restarting and Enabling Services---------------------

service "telegraf" do
  action [:restart, :enable]
end

service "influxd" do
  action [:restart, :enable]
end

service "grafana-server" do
  action [:restart, :enable]
end




