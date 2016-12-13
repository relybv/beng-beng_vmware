# == Class beng_vmware::params
#
# This class is meant to be called from beng_vmware.
# It sets variables according to platform.
#
class beng_vmware::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'beng_vmware'
      $service_name = 'beng_vmware'
    }
    'RedHat', 'Amazon': {
      $package_name = 'beng_vmware'
      $service_name = 'beng_vmware'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
