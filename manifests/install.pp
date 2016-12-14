# == Class beng_vmware::install
#
# This class is called from beng_vmware for install.
#
class beng_vmware::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }
  case $::osfamily {
    'RedHat', 'CentOs': {
      case $::operatingsystemrelease {
        /^6.*/: {
          class { 'vmwaretools': }
        }
        /^7.*/: {
          class { 'openvmtools': }
        }
        default: {
          fail("${::operatingsystemrelease} not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
