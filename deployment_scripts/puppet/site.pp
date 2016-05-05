notice('PLUGIN nova-nfs: site.pp')

$nova_nfs_hash            = hiera_hash('nova_nfs', {})
$nfs_volume_for_nova      = pick($nova_nfs_hash['nfs_volume_for_nova'])
$nfs_mount_point_nova     = pick($nova_nfs_hash['nfs_mount_point_nova'], '/mnt/nova')

class { 'nova_nfs':
    nfs_volume_for_nova            => $nfs_volume_for_nova,
    nfs_mount_point_nova           => $nfs_mount_point_nova,
}
