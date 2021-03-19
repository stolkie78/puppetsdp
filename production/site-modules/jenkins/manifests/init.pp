# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins (
    String  $ensure_version,
    Integer $admin_port,
    Array   $packages
) {
    contain jenkins::preconfig
    contain jenkins::install
    contain jenkins::postconfig
}
