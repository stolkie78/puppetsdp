# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include role::jenkins
class role::jenkins {
  include firewalld
  include jenkins
}
