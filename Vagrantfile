Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  config.vm.synced_folder ".", "/vagrant", create: true

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y docker.io

    sudo chmod 666 /var/run/docker.sock
    sudo ufw allow 80/tcp
    sudo ufw allow 8080/tcp
    sudo ufw allow 3306/tcp
    sudo ufw reload
  SHELL

  config.vm.define "nginx-server" do |nginx|
    nginx.vm.hostname = "nginx-server"
    nginx.vm.network "public_network", ip: "192.168.1.21"
    
    nginx.vm.provider "vmware_desktop" do |v|
      v.vmx['displayname'] = "nginx-server"
      v.gui = true 
      v.memory = 6144
      v.cpus = 3
    end
    
    nginx.vm.provision "shell", inline: <<-SHELL
      docker build -t nginxweb /vagrant/nginxweb
      docker run -d --name nginx --network host nginxweb
    SHELL
  end

  config.vm.define "tomcat-server" do |tomcat|
    tomcat.vm.hostname = "tomcat-server"
    tomcat.vm.network "public_network", ip: "192.168.1.22"
    
    tomcat.vm.provider "vmware_desktop" do |v|
      v.vmx['displayname'] = "tomcat-server"
      v.gui = true 
      v.memory = 4096
      v.cpus = 2
    end
    
    tomcat.vm.provision "shell", inline: <<-SHELL
      docker build -t tomcatwas /vagrant/tomcatwas
      docker run -d --name tomcat --network host tomcatwas
    SHELL
  end  

  config.vm.define "db-server" do |db|
    db.vm.hostname = "db-server"
    db.vm.network "public_network", ip: "192.168.1.30"
    
    db.vm.provider "vmware_desktop" do |v|
      v.vmx['displayname'] = "db-server"
      v.gui = true 
      v.memory = 4096
      v.cpus = 2
    end
    
    db.vm.provision "shell", inline: <<-SHELL
      docker volume create mysql_data
      docker build -t mariadb /vagrant/mariadb
      docker run -d --name mariadb --network host -v mysql_data:/var/lib/mysql mariadb
    SHELL
  end
end
