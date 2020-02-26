Use Case Template: Replace Application Certificates
===================================================

OVERVIEW
--------
F5-LTM-Cert-Management-Replacement.yaml is a templated Ansible playbook that is used to demonstrate automation for managing certificates and keys used by your application services.

Being able to create and swap SSL Profiles on a BIG-IP to singular or multiple VIPs is extremely useful, especially in today’s world where SSL keys get leaked, systems and applications get hacked, certificates become stale or expire. This automated method allows a seamless process to create and change certificates based on need/demand.

This use case template will create a new application service (VIP) on the F5 BIG-IP that will use a custom key and certificate to terminate client's SSL connection. 

RUNNING THE TEMPLATE
--------------------
Running this template assumes that a F5 BIG-IP instance, necessary webservers and Ansible node are available.  
To deploy a sandbox infrastructure in AWS users can use the `F5 Ansible Provisioner <https://github.com/f5alliances/f5_provisioner>`__

1. Login to the Ansible host
   
2. Change Directory in the Ansible Host to the use-cases repo previously downloaded

   .. code::
   
      cd ~/FAS-ansible-use-cases/02-certificate-replacement


3. (Optional) Edit 'f5_vars.yml' file to customize your variables.

4. Run the Ansible Playbook ‘F5-LTM-Cert-Management-Replacement.yaml’ with the variable file ‘f5_vars.yml’:

   .. code::

      ansible-playbook F5-LTM-Cert-Management-Replacement.yaml -e @f5_vars.yml

In this example, the playbook will configure the BIG-IP instance to import certificates and create (if it doesnt already exist) a Virtual IP (VIP), a Pool and ClientSSL Profile and assign it to the created VIP (Use-Case-2).
The playbook will look for the SSL key and certificates from the path mentioned in the 'f5_vars.yml' file and import those into the BIG-IP. For the sake of this demo, the key and cert are also located in the same folder as the playbook. However, you can provide any path/URI in the variable file. 
As Ansible automation is idempotent, the same use-case template can be used to modify certs in an existing application service (VIP already exists on BIG-IP). 

.. note::

   This script can be modified to work on other VIPs and with other key/cert pairs by editing the f5_vars.yaml file. 

TESTING AND VALIDATION
-----------------------
**CERTIFICATE VERIFICATION**
- From a client browser, access the VIP on port 8081 to view the new self-signed certificate (https://VIP:8081)

**BIG-IP CONFIGURATION VERIFICATION**

This section is optional and for testing and verification purposes only. It assumes knowledge of how to operate BIG-IP commands and networking.

- Login to the BIG-IP
- Navigate to Local traffic->Virtual server
- View the deployed use case access VIP:port (8081)
   
   |
   .. image:: images/UseCase2-960.gif
   |
   

