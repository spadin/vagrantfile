# -*- mode: ruby -*-
# vi: set ft=ruby :

VM_NAME = "vagrant" # CHANGEME: Change box name.

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = VM_NAME

  config.ssh.forward_agent = true

  config.vm.network "private_network", ip: "192.168.50.101"

  config.vm.provider 'virtualbox' do |virtualbox|
    virtualbox.name = VM_NAME
    virtualbox.memory = 16384
    virtualbox.cpus = 8
  end

  config.vm.provision "shell", inline: <<-SHELL
    echo "Installing essentials"
    /vagrant/scripts/install_essentials.sh > /dev/null 2>&1

    echo "Installing Redis"
    /vagrant/scripts/install_redis.sh > /dev/null 2>&1

    echo "Installing Nodejs"
    /vagrant/scripts/install_nodejs.sh > /dev/null 2>&1

    echo "Installing MySQL"
    /vagrant/scripts/install_mysql.sh > /dev/null 2>&1

    echo "Installing Google Chrome"
    /vagrant/scripts/install_google_chrome.sh > /dev/null 2>&1
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo "Installing Heroku Toolbelt"
    /vagrant/scripts/install_heroku_toolbelt.sh > /dev/null 2>&1

    echo "Installing rbenv"
    /vagrant/scripts/install_rbenv.sh > /dev/null 2>&1

    echo "Installing Homeshick, cloning dotfiles and installing Vim plugins"
    /vagrant/scripts/install_homeshick.sh > /dev/null 2>&1
  SHELL

  # CHANGEME: Add project-specific setup here.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
  SHELL

end
