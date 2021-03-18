# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins::config
class jenkins::postconfig(
  Integer $port = '8080'
) {

  file_line { "jenkins_port_${port}":
    path    => '/etc/sysconfig/jenkins',
    replace => true,
    line    => "JENKINS_PORT=\"${port}\"",
    match   => 'JENKINS_PORT=".*"',
    notify  => Service['jenkins'],
    require => Package['jenkins'],
  }
}
