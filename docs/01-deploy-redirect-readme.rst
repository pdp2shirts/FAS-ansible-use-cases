Use Case 01: Redirect HTTP to HTTPS traffic
===========================================

Overview
--------

Organizations often want to enforce the use of SSL secured connections, redirecting users who inadvertently specify HTTP in their browsers rather than HTTPS.
This gets more complex when multiple Virtual IPs (VIPs) have been configured, and it can be tedious to implement the redirect for each Virtual IP.

The F5-LTM-HTTP-Redirect.yml playbook will create an SSL (port 443) VIP then create the associative port 80 SSL redirect for that VIP.

In this example, the playbook looks for F5_VIP_Name: ‘Use-Case-1-VIP’ as specified in the f5_vars.yaml variable file.
Users can modify this variable file to create redirect service for any other VIP.

.. note::

   This will loop through the entire VIP list so this could take time depending on the number of VIPs within your BIG-IP


Prerequisites
-------------

This scenario assumes that you have deployed the F5 BIG-IP instance, webservers, and Ansible node via the `F5 Sandbox Provisioner <https://github.com/f5devcentral/F5-Automation-Sandbox>`__


Use Case Setup
--------------

1. Login to the Ansible Host

2. Run the Ansible Playbook ‘F5-LTM-HTTP-Redirect.yml’ with the variable file ‘f5_vars.yml’ :

   .. code::

      cd ~/f5_ansible_use_cases/01-deploy-redirect
      ansible-playbook F5-LTM-HTTP-Redirect.yml -e @f5_vars.yml

3. Testing and Validating

This section is optional and for testing and verification purposes only. It assumes knowledge of how to operate BIG-IP commands and networking.

BIG-IP Configuration Verification

- Login to the BIG-IP instance
- Navigate to Local traffic->Virtual server
- Ensure there are 2 VIPs with same IP
  - One listening on port 443
  - One listening on port 80

Redirect Verification

- From a client browser on a device, access the VIP on port 80, you will be redirected to 443 (http://VIP:80)
- The same webpage will also be accessible via VIP:443 (https://VIP:443)

.. note::

    The Public IP address shown will differ from your lab's Public IP address, make sure to use the IP address from your own inventory file.

    While accessing the Virtual IP, your browser is presented with a certificate (clientssl cert) that is built with the BIG-IP.
    You will see an ‘unsafe’ message from your browser which is expected in this demo. Click proceed to website.

   |
   .. image:: images/UseCase1-960.gif
   |
