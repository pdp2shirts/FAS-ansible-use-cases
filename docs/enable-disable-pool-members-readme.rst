Use Case Template: Application Maintenance
===========================================

OVERVIEW
--------
F5-LTM-Member-Enable-Disable.yaml is a template Ansible Playbook that demonstrates the ability to disable traffic flowing to web-server(s) within a load balancing pool.

There are times where web servers are taken offline to provide upgrades,troubleshooting, or even replacement. 

This playbook allows the ability to enable/disable 'all' pool members (web-server IP:Port configured on F5 BIG-IP) or by host name (e.g. host1:80).


RUNNING THE TEMPLATE
--------------------
Running this template assumes that a F5 BIG-IP instance, necessary webservers and Ansible node are available.  
To deploy a sandbox infrastructure in AWS users can use the `F5 Ansible Provisioner <https://github.com/f5alliances/f5_provisioner>`__

1. Login to the Ansible host and go to the '/f5_ansible_use_cases/04-enable-disable-pool-members' directory

2. Edit 'f5_vars.yml' file to customize your variables for your environment. 

3. Run the Ansible Playbook ‘F5-LTM-Member-Enable-Disable.yaml’ with the variable file ‘f5_vars.yml’:

   .. code::

      cd ~/f5_ansible_use_cases/04-enable-disable-pool-members

      # To Enable Pool Members
      ansible-playbook F5-LTM-Member-Enable-Disable.yaml -e @f5_vars.yml -e "pool_action=enable"

      # To Disable Pool Members
      ansible-playbook F5-LTM-Member-Enable-Disable.yaml -e @f5_vars.yml -e "pool_action=disable"

.. note::

   There is an addtional extra_var within the playbook call to trigger the enable or disable. 
   
TESTING AND VALIDATION
----------------------

This section assumes knowledge of how to operate BIG-IP commands and networking.

   - Login to the BIG-IP
   - Navigate to Local traffic->Pools. 
   - Click on the pool you selected while running the playbook
   - View the members of the pool and verify their state based on action choosen while running the playbook

   |
   .. image:: images/UseCase4-960.gif
   |
