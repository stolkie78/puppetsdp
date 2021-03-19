# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins::install
class jenkins::install (
) {
  package { 'jenkins':
    ensure  => $jenkins::ensure_version,
    require => Class['jenkins::preconfig'],
  }
  service { 'jenkins':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['jenkins']
  }
}
