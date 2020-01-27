Use-case Template: Deploy SSL enaled App-service
=================================================

OVERVIEW
--------
F5-LTM-HTTP-Redirect.yml is a templated Ansible playbook that demonstrates configuring SSL termination and SSL re-direct for your application on F5 BIG-IP with one Ansible command. 

Using this template, we will create an SSL enabled (on port 8443) application service (Virtual IP or VIP) on F5 BIG-IP and also create the associative Port 80 SSL redirect for that Virtual IP. If there is an already existing application service (VIP) that was previously deployed without SSL (a very common scenario), this template will also enable SSL (open SSL port) on that Virtual IP address.

The certificates used in this template for SSL termination are self-signed certs that are generated on the BIG-IP. Users will be able to swap out the self-signed certs very easily and we will demonstrate how in 'certificate-replacement' template that will follow.

RUN THE USE CASE TEMPLATE
-------------------------
Running this template assumes that a F5 BIG-IP instance, necessary webservers and Ansible node are available.  
To deploy a sandbox infrastructure in AWS users can use the `F5 Ansible Provisioner <https://github.com/f5alliances/f5_provisioner>`__

1. Login to the Ansible Host

2. Edit 'f5_vars.yml' file to customize your variables. For example: F5_VIP_Name: ‘Use-Case-1-VIP', F5_Admin_Port: '8443'

3. Run the Ansible Playbook ‘F5-LTM-HTTP-Redirect.yml’ with the variable file ‘f5_vars.yml’:

   .. code::
      cd ~/f5_ansible_use_cases/01-deploy-redirect
      ansible-playbook F5-LTM-HTTP-Redirect.yml -e @f5_vars.yml


In this example, the playbook looks for F5_VIP_Name: ‘Use-Case-1-VIP’ as specified in the f5_vars.yaml variable file and creates a app-service named 'Use-Case-1-VIP' with both port '80' and port '8443' enabled.

.. note::

   This will loop through the entire application list on the BIG-IP to ensure there are no duplicates. So, this could take time depending on the number of Virtual-IPs on your F5 BIG-IP

TESTING AND VALIDATION
-----------------------
**VERIFYING RE-DIRECT SERVICE:**

From a client brower, access the application through the virtual address on the F5 BIG-IP.
- If you try to access application on Virtual-IP:80 (http://VIP:80), you will be redirected to 8443. 
- The same webpage will also be accessible via VIP:443 (https://VIP:443)

.. note::

   Your browser is presented with a certificate (clientssl cert) that is built with the BIG-IP. You will therefore see an ‘unsafe’ message from your browser which is expected in this demo. Click proceed to website.

**BIG-IP CONFIGURATION VERIFICATION:**

This section is optional and for testing and verification purposes only. It assumes knowledge of how to operate BIG-IP commands and networking.

- Login to the BIG-IP instance
- Navigate to Local traffic->Virtual server
- Ensure there are 2 VIPs with same IP
  - One listening on port 443
  - One listening on port 80
  
   |
   .. image:: images/UseCase1-960.gif
   |
