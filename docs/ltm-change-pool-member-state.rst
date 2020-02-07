Use Case Template: Application Maintenance
===========================================

OVERVIEW
--------
ltm-change-pool-member-state.yaml is a template Ansible Playbook that demonstrates the ability to change the state (enable/disable/offline) of a singluar, array or "All" of the member(s) in an F5 Pool and that state would reflect to the traffic flowing to web-server(s) in a load balancing pool.

There are times where web servers are taken offline to provide upgrades, troubleshooting, or even replacement. 

This playbook allows the ability to enable, disable or offline specific pool members (e.g. host1:80 or ip address:port) or even affect "All" of the members of a selected pool.


RUNNING THE TEMPLATE
--------------------
Running this template assumes that a F5 BIG-IP instance, necessary webservers and Ansible node are available.  
To deploy a sandbox infrastructure in AWS users can use the `F5 Ansible Provisioner <https://github.com/f5alliances/f5_provisioner>`__

1. Login to the Ansible host and go to the '/f5_ansible_use_cases/04-ltm-change-pool-member-state' directory

2. Edit 'f5_vars.yml' file to customize your variables for your environment. 

3. Run the Ansible Playbook ‘ltm-change-pool-member-state.yaml’ with the variable file ‘f5_vars.yml’:

   .. code::

      cd ~/f5_ansible_use_cases/04-ltm-change-pool-member-state

      # to execute the playbook with the variables file
      ansible-playbook ltm-change-pool-member-state.yaml -e @f5_vars.yml

.. note::

   By default the pool will disable a single node which can be modified within the f5_vars.yml. 
   
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
