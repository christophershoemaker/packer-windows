required_plugins = %w(vagrant-reload)

plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort "Installation of one or more plugins has failed. Aborting."
  end
end

boxes = {
  'windows10' => {
    'ipaddress' => '192.168.0.10',
    'ram' => '4096',
    'box' => 'windows/10',
    'synced_folder' => 'C:\Users\Christopher\Documents'
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
        vb.customize ["modifyvm", :id, "--cpus", "2"] 
        vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'dvddrive', '--medium', 'D:\en_office_professional_plus_2016_x86_x64_dvd_6962141.iso']
      end
      if "#{properties['box']}" == "windows/7" || "#{properties['box']}" == "windows/10"
        node.vm.communicator = "winrm"
        node.winrm.timeout = 2400
        node.winrm.retry_limit = 10
        node.vm.boot_timeout = 5000
        node.vm.provision "shell", path: "scripts/enable-rdp.ps1"
        #node.vm.provision "shell",
          #inline: <<-SHELL
          #  # 
          #  
          #  SHELL
        node.vm.provision "shell", path: "scripts/install-office.ps1"
        node.vm.provision :reload
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