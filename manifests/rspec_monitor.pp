# == Class beng_vmware::rspec_monitor
#
# This class is included from a role for install. It makes rspec acceptance tests available to the monitor system.
#
class beng_vmware::rspec_monitor {
  include ::rspec_monitor
  rspec_monitor::add_tests { $module_name: }
}
