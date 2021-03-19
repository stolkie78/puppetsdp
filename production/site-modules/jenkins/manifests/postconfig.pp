# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins::config
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
  file_line { "jenkins_disable_wizard":
    path    => '/etc/sysconfig/jenkins',
    replace => true,
    line    => 'JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true -Djenkins.install.runSetupWizard=false"',
    match   => 'JENKINS_JAVA_OPTIONS=".*"',
    notify  => Service['jenkins'],
    require => Package['jenkins'],
  }
}
