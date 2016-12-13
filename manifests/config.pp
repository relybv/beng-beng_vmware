# == Class beng_vmware::config
#
# This class is called from beng_vmware for service config.
#
class beng_vmware::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

}
