Fuel Nova-nfs plugin for Fuel
=============================

Nova-nfs plugin
---------------

Overview
--------
nova-nfs uses nfs backend to store ephemeral volumes (intances.) This plugin allow to mount a nfs volume
annd use it as storage backend for Nova.

This repo contains all necessary files to build nova-nfs Fuel plugin.

Requirements
------------

| Requirement                      | Version/Comment                                         |
|----------------------------------|---------------------------------------------------------|
| Mirantis Openstack compatibility | 7.0                                                     |
|----------------------------------|---------------------------------------------------------|
| NFS Server                       | an NFS server with volume accessible from compute nodes |

Recommendations
---------------

None.

Limitations
-----------

Only on nfs volume can be defined. So in HA deployment compute node will share the same
storage backend for instances.

Installation Guide
==================

Nova-nfs plugin installation
----------------------------

1. Clone the fuel-plugin repo from: https://github.com/stackforge/fuel-plugin-nova-nfs.git

    ``git clone``

2. Install the Fuel Plugin Builder:

    ``pip install fuel-plugin-builder``

3. Build nova-nfs Fuel plugin:

   ``fpb --build fuel-plugin-nova-nfs/``

4. The nova_nfs-<x.x.x>.rpm file will be created in the plugin folder (fuel-plugin-nova-nfs)

5. Move this file to the Fuel Master node with secure copy (scp):

   ``scp nova_nfs-<x.x.x>.rpm root@:<the_Fuel_Master_node_IP address>:/tmp``
   ``cd /tmp``

6. Install the nova-nfs plugin:

   ``fuel plugins --install nova_nfs-<x.x.x>.rpm``
   
7.  Verify that the plugin is installed correctly:
   ``fuel plugins --list``
   
8. Plugin is ready to use and can be enabled on the Settings tab of the Fuel web UI.

User Guide
==========

Nova-nfs plugin configuration
-----------------------------

1. Create a new environment with the Fuel UI wizard

2. Add a node with the "Compute" role.

3. Click on the settings tab of the Fuel web UI

4. Scroll down the page, select the "Nova-nfs plugin" checkbox
   and fill-in the requiered fields
    - the nfs volume to store instances
    - the mount point for the nfs volume

Here is a screenshot of the fields

![nova-nfs fields](./figures/nova-nfs-plugin.png "nova-nfs-fields")

Deployment details
------------------

Create mountpoint directory
Edit Fstab to add auto mount of NFS volume on the mountpoint
Configure Nova to use it as backend for instances
Restart nova services

Known issues
------------

The deployment  failed if the NFS volume is not available during the deployment

Release Notes
-------------

**1.0.0**

* Initial release of the plugin

**2.0.0**

* Update plugin to Fuel 6.1 release

**3.0.0**

* Update plugin to Fuel 7.0 release
