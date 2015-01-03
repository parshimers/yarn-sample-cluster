# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
     v.memory = 1024
     v.cpus = 2
   end

   config.hostmanager.enabled = true
   config.hostmanager.manage_host = true
   config.hostmanager.ignore_private_ip = false
   config.hostmanager.include_offline = true

   config.vm.provision "shell" do |s|
    s.inline = "service iptables stop"
    s.privileged = true
   end

   config.vm.provision :puppet do |puppet|
     puppet.manifests_path = 'puppet/manifests'
     puppet.manifest_file = 'site.pp'
     puppet.module_path = 'puppet/modules'
     puppet.options = "--verbose --debug"
   end

  config.vm.define "nc2" do |nc|
	nc.vm.box = "puppetlabs/centos-6.5-64-puppet"
	nc.vm.hostname = "nc2"
	nc.vm.network "private_network", ip: "10.10.0.4"
    nc.hostmanager.aliases = %w(nc2.ics.uci.edu nc2)
  end
  config.vm.define "nc1" do |nc|
	nc.vm.box = "puppetlabs/centos-6.5-64-puppet"
	nc.vm.hostname = "nc1"
	nc.vm.network "private_network", ip: "10.10.0.3"
    nc.hostmanager.aliases = %w(nc1.ics.uci.edu nc1)
  end

  config.vm.define "cc" do |cc|
	cc.vm.box = "puppetlabs/centos-6.5-64-puppet"
	cc.vm.hostname = "cc"
	cc.vm.network "private_network", ip: "10.10.0.2"
    cc.hostmanager.aliases = %w(cc.ics.uci.edu cc)
  end

end
