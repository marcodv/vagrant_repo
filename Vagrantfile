nodes_config = (JSON.parse(File.read("nodes.json")))['nodes']
Vagrant.configure(2) do |config|

  config.vm.box = "centos5"
  config.vm.box_url = "centos5.box"

nodes_config.each do |node|
    node_name   = node[0] # name of node
    node_values = node[1] # content of node
	  config.vm.define node_name do |config|    
      # configures all forwarding ports in JSON array
      ports = node_values['ports']
      ports.each do |port|
        config.vm.network :forwarded_port,
          host:  port[':host'],
          guest: port[':guest'],
          id:    port[':id']
      end
      config.vm.hostname = node_values[':node']
      #=========questa direttiva da l'ip per il server
	  config.vm.network :public_network, ip: node_values[':ip']
	  #":ip": "192.168.33.21",
	  
	  config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", node_values[':memory']]
        vb.customize ["modifyvm", :id, "--name", node_values[':node']]
      end
end
config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
	puppet.manifests_path = "manifests"
	puppet.manifest_file = "default.pp"
	puppet.options = '--verbose --debug '
	#--hiera_config=hiera/hiera.yaml' 
  end
end
end