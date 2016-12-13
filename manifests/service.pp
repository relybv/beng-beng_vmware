# == Class beng_vmware::service
#
# This class is meant to be called from beng_vmware.
# It ensure the service is running.
#
class beng_vmware::service {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { $::beng_vmware::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
