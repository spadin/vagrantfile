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

    apt-get update
    apt-get install -y git tmux vim-nox
    apt-get install -y libffi-dev zlib1g-dev libssl-dev libreadline-dev
    apt-get install -y build-essential g++
    apt-get install -y libcurl3 libcurl3-gnutls libcurl4-openssl-dev
    apt-get install -y redis-server

    curl -sL https://deb.nodesource.com/setup | sudo bash -
    apt-get install -y nodejs

    echo "mysql-server mysql-server/root_password password ''" | sudo debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password ''" | sudo debconf-set-selections

    apt-get install -y mysql-server mysql-client libmysqlclient-dev

  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    source "$HOME/.homesick/repos/homeshick/homeshick.sh"

    homeshick clone jimeh/git-aware-prompt
    homeshick clone gmarik/vundle.vim
    homeshick clone spadin/dotbashrc
    homeshick clone spadin/dotvimrc
    homeshick clone spadin/dotfilesdeux
    homeshick link -f

    vim -u ~/.vimrc.d/plugins.vim +PluginInstall +qall

  SHELL

  # CHANGEME: Add project-specific setup here.
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
  SHELL

end
