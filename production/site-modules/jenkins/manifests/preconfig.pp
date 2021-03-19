# @summary A short summary of the purpose of this class
#
# Configure Jenkins requirements
#
# @example
# include jenkins::preconfig
class jenkins::preconfig
{
  # Add Jenkins repo
  yumrepo { 'jenkins':
    enabled  => 1,
    descr    => 'Jenkins Yum Repo',
    baseurl  => 'http://pkg.jenkins.io/redhat',
    gpgcheck => 0,
  }
  # Install package dependencies
  $jenkins::packages.each | $package | {
    package { $package:
      ensure => present
    }
  }
}
