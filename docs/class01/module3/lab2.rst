Lab 3.2: Delete Application via API  (Ansible)
----------------------------------------------
In this lab, we are going to delete an application using Ansible.

.. warning :: **david** is used to execute Ansible playbooks, make sure it has the correct permission and is a LOCAL user (c.f. Class 1 Module 1)

Open a SSH session to *Ubuntu Lamp Server* in UDF.

**david** user is used to execute the playbook:

Execute the playbook::

    # cd /home/f5/f5-ansible-demo
    # ansible-playbook -i notahost, delete_http_app.yaml -vvvv

Connect as **david** (select Auth Provider local) and check on BIG-IQ the application has been correctly deleted.

.. note :: If you have time, you can try to deploy another application type using other Ansible modules (e.g. bigiq_application_fasthttp, bigiq_application_fastl4_tcp, bigiq_application_https_offload, bigiq_application_https_waf)
