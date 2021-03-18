  #
  # Install puppet version
  #
  echo "Installing puppet-agent"
  yum install -y --nogpgcheck https://yum.puppetlabs.com/puppet6/puppet6-release-el-7.noarch.rpm
  yum install -y --nogpgcheck puppet-agent
  rpm -q git || yum install -y --nogpgcheck git