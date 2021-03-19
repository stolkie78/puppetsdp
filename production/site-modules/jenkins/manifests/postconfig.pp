# @summary A short summary of the purpose of this class
#
# Post Jenkins configuration
#
# @example
#   include jenkins::postconfig
class jenkins::postconfig
{
  # Configure Jenkins port
  file_line { "jenkins_port_${jenkins::admin_port}":
    path    => '/etc/sysconfig/jenkins',
    replace => true,
    line    => "JENKINS_PORT=\"${jenkins::admin_port}\"",
    match   => 'JENKINS_PORT=".*"',
    notify  => Service['jenkins'],
    require => Package['jenkins'],
  }
  # Disable annoying wizard
  file_line { 'jenkins_disable_wizard':
    path    => '/etc/sysconfig/jenkins',
    replace => true,
    line    => 'JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false"',
    match   => 'JENKINS_JAVA_OPTIONS=".*"',
    notify  => Service['jenkins'],
    require => Package['jenkins'],
  }
  # Open firewall port
  firewalld_port {"jenkins_admin_port":
      ensure   => 'present',
      zone     => 'public',
      port     => $jenkins::admin_port,
      protocol => 'tcp',
  }
}
