Lab 3.2: Delete Application via API  (Ansible)
----------------------------------------------
In this lab, we are going to delete an application using Ansible.

While still logged into the same SSH session you opened in the previous lab.

Execute the playbook::

    # cd /home/f5/f5-ansible-demo
    # ansible-playbook -i notahost, delete_http_app.yaml -vvvv

Connect as **david** (select Auth Provider local) and check on BIG-IQ the application (site22.example.com) has been deleted.
