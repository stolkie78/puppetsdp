# @summary A short summary of the purpose of this class
#
# Install Jenkins package and service
#
# @example
#   include jenkins::install
class jenkins::install (
) {
  # Install Jenkins package
  package { 'jenkins':
    ensure  => $jenkins::ensure_version,
    require => Class['jenkins::preconfig'],
  }
  # Install Jenkins server
  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['jenkins']
  }
}
