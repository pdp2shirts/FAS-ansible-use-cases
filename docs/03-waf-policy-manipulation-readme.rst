Use Case 03: WAF Policy Manipulation
====================================

Overview
--------

Web Application Firewalls work to protect web applications by inspecting incoming traffic, blocking bots, SQL injection, Cross Site Scripting and a host of other attacks. 
This playbook was designed to demonstrate a basic WAF scenario to block a URL or an IP address or both. It also supports integration with other security vendors or even ticketing based solutions like Service NOW to create a start to finish automated solution based on when attacks can occur.

This use case will configure the BIG-IP to provision the `BIG-IP WAF <https://www.f5.com/products/security/advanced-waf>`__, create a Virtual IP (VIP) including a Pool and nodes, a WAF policy for the use
case, then modify the policy to block IP’s and URL’s.

.. note::

   This Playbook will also detect if Blocked URL or IP already exists and only add what is new.

   This script can be modified to work on other URLs or IP’s by editing the
   Blocked_URLs and/or Blocked_IPs section inside of the f5_vars.yaml

Prerequisites
-------------

This scenario assumes that you have deployed the F5 BIG-IP instance, webservers, and Ansible node via the `F5 Sandbox Provisioner <https://github.com/f5devcentral/F5-Automation-Sandbox>`__


Use Case Setup
--------------

1. Login to the Ansible Host 

2. Launching the Ansible Playbook:

   .. code::

      cd ~/f5_ansible_use_cases/03-waf-policy-manipulation
      ansible-playbook F5-ASM-URL-IP-Blocking.yaml -e @f5_vars.yml

3. Testing and Validating

   - Login to the BIG-IP
   - Navigate to Security->Application security to view the WAF policy deployed
   - Navigate to Local traffic->Virtual server
   - View the deployed use case access VIP:port (8082)
   - Access the VIP on port 8082 (https://VIP:8082)
   - Access the URL's present in the f5_vars.yml file to see the WAF policy in action
	 - https://VIP:8082/blocked.html 
	 - https://VIP:8082/hacked.html
	 - https://VIP:8082/robot.html 

   |
   .. image:: images/UseCase3-960.gif
   |
