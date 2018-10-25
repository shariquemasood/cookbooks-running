#this will run on ubuntu
execute "run-apt-get-update-" do
  command "sudo apt-get update -y"
end

execute "Adding mysql 5.6 repository" do
  command "sudo add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe' "
end

execute "Running Update" do
  command " sudo apt-get update -y"
end

package "mysql-server-5.6" do
    action :install
end

service "mysqld" do
   action :nothing
end
