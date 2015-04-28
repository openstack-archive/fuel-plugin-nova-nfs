$fuel_settings = parseyaml(file('/etc/astute.yaml'))
class { 'nova_nfs':
    nfs_volume_for_nova            => $fuel_settings['nova_nfs']['nfs_volume_for_nova'],
    nfs_mount_point_nova           => $fuel_settings['nova_nfs']['nfs_mount_point_nova'],
}
