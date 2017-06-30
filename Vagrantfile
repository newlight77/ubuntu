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
  box_name = 'fedora/25-cloud-base'
end



Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = box_name

  # Tweak VirtualBox configuration for GUI applications
  config.vm.provider :virtualbox do |v|
    v.name = os
    v.memory = 2048
    v.cpus = 1

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

  # forwarded ports
  #config.vm.network :forwarded_port, guest: 80, host: 80, auto_correct: true
  # [8443].each do |p|
      # config.vm.network :forwarded_port, guest: p, host: p
  # end

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provision "prepare-installation", privileged: true, type: "shell", inline: <<-SHELL
    #sudo dnf upgrade -y
    sudo dnf -y install python2-dnf libselinux-python yum
    sudo dnf -y install ansible
  SHELL

  config.vm.provision "run", type: "shell", inline: <<-SHELL
    cd /vagrant/ansible
    ansible-playbook -b -u vagrant playbook.yml
  SHELL



 end
