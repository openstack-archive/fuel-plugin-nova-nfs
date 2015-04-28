class nova_nfs::params {
  $nova_conf = '/etc/nova/nova.conf'

  if $::osfamily == 'Debian' {
  
    $required_packages      = [ 'rpcbind', 'nfs-common', 'libevent-2.0',
                                'libgssglue1', 'libnfsidmap2', 'libtirpc1' ]
    $package_name           = 'nova-compute'
    $service_name    		= 'nova-compute'
	$nfs_service_name 		= undef

  } elsif($::osfamily == 'RedHat') {
  
    $required_packages      = [ 'rpcbind', 'nfs-utils', 'nfs-utils-lib',
                                'libevent', 'libtirpc', 'libgssglue' ]
    $package_name           = 'openstack-nova-compute'
    $service_name    		= 'openstack-nova-compute'
	$nfs_service_name 		= ['rpcbind']

  } else {
    fail("unsuported osfamily ${::osfamily}, currently Debian and Redhat are the only supported platforms")
  }
}
