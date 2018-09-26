# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"


os = ENV['OS'] || 'fedora'
if os == 'ubuntu'
  box_name = 'ubuntu/xenial64'
# elsif os == 'redhat'
#   box_name = 'rhel/7.2'
# elsif os == 'centos'
#   box_name = 'centos/7'
else
  box_name = 'fedora/28-cloud-base'
end



Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = box_name

  # Tweak VirtualBox configuration for GUI applications
  config.vm.provider :virtualbox do |v|
    v.name = os
    v.memory = 2048
    v.cpus = 2

    # v.gui = true
    # v.customize ["modifyvm", :id, "--memory", 3072]
    # v.customize ["modifyvm", :id, "--cpus", 1]
    # v.customize ["modifyvm", :id, "--vram", "128"]
    # v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
    # v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
    # v.customize ["modifyvm", :id, "--ioapic", "on"]
    # v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
    # v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    # v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  config.vm.synced_folder ".", "/vagrant"

  if os == 'ubuntu'
    config.vm.provision "prepare-installation", privileged: true, type: "shell", inline: <<-SHELL
      sudo apt-add-repository ppa:ansible/ansible
      sudo apt-get -y update
      sudo apt-get -y install software-properties-common ansible
    SHELL
    config.vm.provision "run", type: "shell", inline: <<-SHELL
      cd /vagrant/ansible
      su -c "ansible-playbook -u ubuntu playbook.yml" ubuntu
    SHELL
  else
    config.vm.provision "prepare-installation", privileged: true, type: "shell", inline: <<-SHELL
      #sudo dnf upgrade -y
      sudo dnf -y install python2-dnf libselinux-python yum
      sudo dnf -y install ansible
    SHELL

    config.vm.provision "run", type: "shell", inline: <<-SHELL
      cd /vagrant/ansible
      su -c "ansible-playbook -u vagrant playbook.yml" vagrant
    SHELL
  end


 end
