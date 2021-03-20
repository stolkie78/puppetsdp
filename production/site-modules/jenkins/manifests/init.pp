# @summary A short summary of the purpose of this class
#
# Configure and install Jenkins
#
# @example
#   include jenkins
class jenkins (
    String  $ensure_version = 'present',
    Integer $admin_port     = '8080',
    Array   $packages       = [],
) {
    case $facts['os']['family'] {
    'RedHat':  {
        contain jenkins::preconfig
        contain jenkins::install
        contain jenkins::postconfig
    }
    default:  {
        warning ('OS not supported by this module')
    }
  }
}
