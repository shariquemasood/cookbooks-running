#This Will Run On Ubuntu
#-------Adding TIG REpository-----------------------------

apt_repository 'telegraf_influxdb' do
  uri          'https://repos.influxdata.com/ubuntu'
  distribution 'bionic'
  components   ['stable']
  key          'https://repos.influxdata.com/influxdb.key'
end

apt_repository 'Grafana_Install' do
  uri	       'https://packagecloud.io/grafana/stable/debian/'
  distribution 'stretch'
  components   ['main']
  key          'https://packagecloud.io/gpg.key'
end


#------Updating The Repository---------------------------

apt_update 'update'


#------Installing Telegraf InfluxDb and Grafana----------

package %w(telegraf influxdb grafana) do
  action :install
end


#---------Managing COnfigurations-------------------------

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


#---------Restarting The Services-------------------------

service "telegraf" do
   action [:restart, :enable]
end

service "influxd" do
  action [:restart, :enable]
end


service "grafana-server" do
  action [:restart, :enable]
end

