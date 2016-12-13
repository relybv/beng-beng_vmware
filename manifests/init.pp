# == Class: beng_vmware
#
# Full description of class beng_vmware here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class beng_vmware
(
  $package_name = $::beng_vmware::params::package_name,
  $service_name = $::beng_vmware::params::service_name,
) inherits ::beng_vmware::params {

  # validate parameters here
  validate_string($package_name)
  validate_string($service_name)

  class { '::beng_vmware::install': } ->
  class { '::beng_vmware::config': } ~>
  class { '::beng_vmware::service': } ->
  Class['::beng_vmware']
}
