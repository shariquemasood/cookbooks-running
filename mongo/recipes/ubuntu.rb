#this will run on ubuntu

execute "adding apt-key" do
  command "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4"
end

execute "Adding deb repo" do
  command "echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list"
end

execute "run-apt-get-update-" do
  command "sudo apt-get update -y"
end
package "mongodb-org" do
    action :install
end

service "mongod" do
   action :nothing
end
