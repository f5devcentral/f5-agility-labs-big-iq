Module 3: Application Deployment via API
========================================
BIG-IQ 6.0 will offer the below Ansible module available in Ansible 2.6 (for info `Ansible F5 github`_).

.. _Ansible F5 github: https://github.com/F5Networks/f5-ansible

.. _experimental F5 Modules: http://clouddocs.f5.com/products/orchestration/ansible/devel/usage/installing-modules.html

- Create and Delete Application from Default-f5-HTTP-lb-template: **bigiq_application_http**
- Create and Delete Application from Default-f5-HTTPS-offload-lb-template: **bigiq_application_https_offload**
- Create and Delete Application from Default-f5-HTTPS-WAF-lb-template: **bigiq_application_https_waf**
- Create and Delete Application from Default-f5-fastHTTP-lb-template: **bigiq_application_fasthttp**
- Create and Delete Application from Default-f5-FastL4-TCP-lb-template: **bigiq_application_fastl4_tcp**
- Create and Delete Application from Default-f5-FastL4-UDP-lb-template: **bigiq_application_fastl4_udp**

 More information on all `F5 Ansible Modules`_.

.. _F5 Ansible Modules: https://clouddocs.f5.com/products/orchestration/ansible/devel/modules/list_of_all_modules.html

In this module, we will learn how to see create and delete an application using Ansible Playbook, also look at an example of straight API payload from BIG-IQ UI.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*

