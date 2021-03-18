# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include jenkins
class jenkins () {
    include jenkins::preconfig
    include jenkins::install
    include jenkins::postconfig
}
