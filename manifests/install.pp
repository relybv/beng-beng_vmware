# == Class beng_vmware::install
#
# This class is called from beng_vmware for install.
#
class beng_vmware::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package { $::beng_vmware::package_name:
    ensure => present,
  }
}
