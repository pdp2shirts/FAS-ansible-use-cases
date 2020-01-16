Use Case 02: Import/Apply Certificates and Keys
===============================================

Overview
--------

Being able to create and swap SSL Profiles on a BIG-IP to singular or multiple VIPs is extremly useful, especially in today’s world where SSL
keys get leaked or hacked or expire. This automated method allows a seamless process to create and change certificates based on need/demand.

This scenario will configure the BIG-IP instance to import certificates and create (if doesnt already exist) a Virtual IP (VIP), a Pool
and ClientSSL Profile and assign it to the created VIP (Use-Case-2).

This script can be modified to work on other VIPs by editing the F5_VIP_Name section inside of the f5_vars.yaml

Prerequisites
-------------

This scenario assumes that you have deployed the F5 BIG-IP instance, webservers, and Ansible node via the `F5 Sandbox Provisioner <https://github.com/f5devcentral/F5-Automation-Sandbox>`__

 
Use Case Setup
--------------

1. Login to the Ansible Host
   
2. Launching the Ansible Playbook:

   .. code::

      cd ~/f5_ansible_use_cases/02-certificate-replacement
      ansible-playbook F5-LTM-Cert-Management-Replacement.yaml -e @f5_vars.yml
   
3. Testing and Validating

Certificate Verification
- From a client browser, access the VIP on port 8081 to view the new self-signed certificate (https://VIP:8081)

BIG-IP Configuration Verification

This section is optional and for testing and verification purposes only. It assumes knowledge of how to operate BIG-IP commands and networking.
- Login to the BIG-IP
- Navigate to Local traffic->Virtual server
- View the deployed use case access VIP:port (8081)

   |
   .. image:: images/UseCase2-960.gif
   |
   
.. note::

   The browser certificate used in this scenario is a “Self Signed” UNTRUSTED Certificate.
