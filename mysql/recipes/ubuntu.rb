#this will run on ubuntu
execute "run-apt-get-update-" do
  command "sudo apt-get update -y"
end
package "mysql-server" do
    action :install
end

service "mysqld" do
   action :nothing
end
