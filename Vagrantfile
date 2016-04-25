# -*- mode: ruby -*-
# vi: set ft=ruby sw=2 ts=2 :

Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/vivid64"
    config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box"

    # Tweak VirtualBox configuration for GUI applications
    config.vm.provider :virtualbox do |v|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 4048]
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--vram", "128"]
      v.customize ["setextradata", "global", "GUI/MaxGuestResolution", "any"]
      v.customize ["setextradata", :id, "CustomVideoMode1", "1024x768x32"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--rtcuseutc", "on"]
      v.customize ["modifyvm", :id, "--accelerate3d", "on"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

    # forwarded ports
    #config.vm.network :forwarded_port, guest: 80, host: 80, auto_correct: true
    [2999, 3000, 8081, 8082, 8083, 8084, 8089, 8001, 8080, 8443].each do |p|
        config.vm.network :forwarded_port, guest: p, host: p
    end

    config.vm.network :private_network, ip: "192.168.56.22"
    #config.vm.network :private_network, type: "dhcp"

    #config.vm.synced_folder ".", "/vagrant", :type => "nfs"
    config.vm.synced_folder ".", "/vagrant"

    config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install ubuntu-desktop -y"
    config.vm.provision :shell, path: "/vagrant/installToolBox.sh", :privileged => true
    config.vm.provision :shell, path: "/vagrant/customizeRoot.sh", :privileged => true
    config.vm.provision :shell, path: "/vagrant/customize.sh", :privileged => true

    #config.vm.provision "shell", inline: <<-SHELL

end
