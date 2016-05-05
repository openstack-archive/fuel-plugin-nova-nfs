notice('PLUGIN nova-nfs: create_user.pp')

$nova_nfs_hash = hiera_hash('nova_nfs', {})

if $nova_nfs_hash['create_nova_user'] {
    user { 'nova':
        uid           => 499,
        gid           => 499,
        home          => '/var/lib/nova',
        shell         => '/bin/bash',
    }

    group { 'nova':
        gid           => 499,
    }
}
