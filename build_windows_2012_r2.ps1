$env:PACKER_LOG=1
packer build --only=virtualbox-iso `
  windows_2012_r2.json