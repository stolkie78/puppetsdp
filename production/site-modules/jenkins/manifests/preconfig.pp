# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
class jenkins::preconfig(
  Array $packages
) {
  case $facts['os']['name'] {
    'RedHat', 'CentOS':  {
      yumrepo { 'jenkins':
        enabled  => 1,
        descr    => 'Jenkins Yum Repo',
        baseurl  => 'http://pkg.jenkins.io/redhat',
        gpgcheck => 0,
      }
    }
    /^(Debian|Ubuntu)$/:  {
        notify{'setup apt':}
    }
    default:  {
        warning ('OS not supported by this module')
    }
  }
  $packages.each | $package | {
    package { $package:
      ensure => present
    }
  }
}
