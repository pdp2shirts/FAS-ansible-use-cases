Use Case 04: Enable/Disable pool member for maintenance
=======================================================
 

Overview
--------

There are times where web servers are taken offline to provide upgrades,troubleshooting, or even replacement. This script allows the ability to
enable or disable members within a load balancing pool. This playbook allows the ability to enable/disable all pool members (all) or by host name
(e.g. host1:80).
This use case will configure the BIG-IP to enable or disable pool members within the load balancer.


Prerequisites
-------------

This scenario assumes that you have deployed the F5 BIG-IP instance, webservers, and Ansible node via the `F5 Sandbox Provisioner <https://github.com/f5devcentral/F5-Automation-Sandbox>`__


Use Case Setup
--------------

1. Login to the Ansible host

2. Launch the Ansible playbook:

   .. code::

      cd ~/f5_ansible_use_cases/04-enable-disable-pool-members

      # To Enable Pool Members
      ansible-playbook F5-LTM-Member-Enable-Disable.yaml -e @f5_vars.yml -e "pool_action=enable"

      # To Disable Pool Members
      ansible-playbook F5-LTM-Member-Enable-Disable.yaml -e @f5_vars.yml -e "pool_action=disable"

.. note::

   There is an addtional extra_var within the playbook call to trigger the enable or disable
   
3. Testing and Validating

This section assumes knowledge of how to operate BIG-IP commands and networking.

   - Login to the BIG-IP
   - Navigate to Local traffic->Pools. 
   - Click on the pool you selected while running the playbook
   - View the members of the pool and verify their state based on action choosen while running the playbook

   |
   .. image:: images/UseCase4-960.gif
   |
