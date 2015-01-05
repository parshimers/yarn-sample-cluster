# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
     v.memory = 1024
     v.cpus = 2
   end

   config.hostmanager.enabled = false
   config.hostmanager.manage_host = true
   config.hostmanager.ignore_private_ip = false
   config.hostmanager.include_offline = true

   config.vm.provision "shell" do |s|
    s.inline = "service iptables stop"
    s.privileged = true
   end


  config.vm.define "nc2" do |nc2|
	nc2.vm.box = "puppetlabs/centos-6.5-64-puppet"
	nc2.vm.hostname = "nc2.ics.uci.edu"
	nc2.vm.network "private_network", ip: "10.10.0.4"
    nc2.hostmanager.aliases = %w(nc2.ics.uci.edu nc2)
   nc2.vm.provision "shell" do |sh|
    sh.inline = "echo \"127.0.0.1 \t nc2\" > /etc/hosts"
    sh.privileged = true
   end
   nc2.vm.provision :puppet do |puppet|
     puppet.manifests_path = 'puppet/manifests'
     puppet.manifest_file = 'site.pp'
     puppet.module_path = 'puppet/modules'
     puppet.options = "--verbose --debug"
   end
   nc2.vm.provision :hostmanager
  end
  config.vm.define "nc1" do |nc1|
	nc1.vm.box = "puppetlabs/centos-6.5-64-puppet"
	nc1.vm.hostname = "nc1.ics.uci.edu"
	nc1.vm.network "private_network", ip: "10.10.0.3"
    nc1.hostmanager.aliases = %w(nc1.ics.uci.edu nc1)
   nc1.vm.provision "shell" do |sh|
    sh.inline = "echo \"127.0.0.1 \t nc1\" > /etc/hosts"
    sh.privileged = true
   end
   nc1.vm.provision :hostmanager
  end

  config.vm.define "cc" do |cc|
	cc.vm.box = "puppetlabs/centos-6.5-64-puppet"
	cc.vm.hostname = "cc.ics.uci.edu"
	cc.vm.network "private_network", ip: "10.10.0.2"
    cc.hostmanager.aliases = %w(cc.ics.uci.edu cc)
   cc.vm.provision "shell" do |sh|
    sh.inline = "echo \"127.0.0.1 \t cc\" > /etc/hosts"
    sh.privileged = true
   end
   cc.vm.provision :hostmanager
   cc.vm.provision :puppet do |puppet|
     puppet.manifests_path = 'puppet/manifests'
     puppet.manifest_file = 'site.pp'
     puppet.module_path = 'puppet/modules'
     puppet.options = "--verbose --debug"
   end
  end

end
