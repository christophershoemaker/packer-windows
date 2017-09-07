boxes = {
  'windows7' => {
    'ipaddress' => '192.168.44.33',
    'ram' => '2048',
    'box' => 'windows/7',
    'synced_folder' => '.'
  },
  'windows10' => {
    'ipaddress' => '192.168.44.34',
    'ram' => '2048',
    'box' => 'windows/10',
    'synced_folder' => '.'
  }
}

Vagrant.configure("2") do |config|
  boxes.each do |key,properties|
    config.vm.define "#{key}" do |node|
      node.vm.hostname = "#{key}"
      node.vm.synced_folder "#{properties['synced_folder']}", "/vagrant", type: "virtualbox"
      node.vm.box = "#{properties['box']}"
      node.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "#{properties['ram']}"]
        vb.customize ["modifyvm", :id, "--name", "#{key}"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
        vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'dvddrive', '--medium', 'C:\Users\example.iso']
      end
      if "#{properties['box']}" == "windows/7" || "#{properties['box']}" == "windows/10"
        node.vm.communicator = "winrm"
        node.winrm.timeout = 2400
        node.winrm.retry_limit = 10
        node.vm.boot_timeout = 5000
        node.vm.provision "shell",
          inline: "cd d: ; Start-Process D:/setup.exe -NoNewWindow -Wait"
      end
      node.vm.network "private_network", 
        ip: "#{properties['ipaddress']}",
        netmask: "255.255.255.0"
      # if "#{properties['box']}" == "windows/7" || "#{properties['box']}" == "christophershoemaker/windows10"
      #   node.vm.provision "shell", path: "#{properties['provision_script']}"
      # end
    end
  end
end