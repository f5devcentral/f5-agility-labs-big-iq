Lab 2: Working with custom AS3 Templates in BIG-IQ
---------------------------------------------------

.. include:: ./accesslab.rst

Exercise 2.1 – Create Custom AS3 template via BIG-IQ GUI
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We imported the default “out-of-the-box” AS3 templates (available
on https://github.com/f5devcentral/f5-big-iq) that can be used for
deploying an application service. However, it is a good practice to
clone the default AS3 templates and use them for your custom needs.

1. From within the LAMP server RDP/noVNC session, logon on **BIG-IQ** as **david** *(david\\david)*
    by opening a browser and go to: ``https://10.1.1.4`` or directly via
    the TMUI as shown above.
    Go to the Applications > Application Templates and select AS3-F5-HTTPS-WAF-existing-lb-template-big-iq-default-v1 and
    click on **Clone**.

2. Name the cloned template: AS3-LAB-HTTPS-WAF-custom-template and click
   Clone.

..

   |image18|

3. Open the template called AS3-LAB-HTTPS-WAF-custom-template and select
   the Analytics_Profile. Change to Override the Properties for
   Collect Client-Side Statistics, as well
   as Collect URL and Collect User Agent. Ensure the Enable checkbox is
   selected for these.

|image19|

.. note:: Collect Response Code is already enabled by default in the AS3 schema.

4. Click **Save & Close**.

5. Select AS3-LAB-HTTPS-WAF-custom-template and click **Publish**.

Exercise 2.2 – Deploy application via BIG-IQ using a customized AS3 template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. In this exercise Paula is going to create an application service that
   includes a Web Application Firewall (WAF) profile to secure the
   application. You should be familiar with the other configuration
   components from the prior lab. The WAF policy was previously created and installed on the 
   BIG-IP by the Security Admin.

2. Before **Paula** can use this AS3 template, David needs to update her
   role. Use the previous steps in lab **1.2** to add AS3 Template
   AS3-LAB-HTTPS-WAF-custom-template to Application Creator VMware
   custom role assigned to **Paula**.

3. Login as Paula and select previously created **LAB 1.2** Application
   and click **Create**.

|image20|

4. Select Create to create an Application Service:

|image21|

+-------------------------------------------------------------------+
| Application properties:                                           |
+===================================================================+
| -  Grouping = Part of an Existing Application                     |
|                                                                   |
| -  Application Name = **LAB 1.2**                                 |
|                                                                   |
| -  Description = My second AS3 template deployment with BIG-IQ    |
+-------------------------------------------------------------------+
| Select an Application Service Template:                           |
+-------------------------------------------------------------------+
| -  Template Type = Select AS3-LAB-HTTPS-WAF-custom-template [AS3] |
+-------------------------------------------------------------------+
| General Properties:                                               |
+-------------------------------------------------------------------+
| -  Application Service Name = https_waf_app_service               |
|                                                                   |
| -  Target = SEA-vBIGIP01.termmarc.com                             |
|                                                                   |
| -  Tenant = tenant2                                               |
+-------------------------------------------------------------------+
| Pool                                                              |
+-------------------------------------------------------------------+
| -  Members:                                                       |
|                                                                   |
| -  Service Address = 10.1.20.123                                  |
+-------------------------------------------------------------------+
| TLS_Server: Keep defaults                                         |
+-------------------------------------------------------------------+
| Certificate: Keep defaults                                        |
+-------------------------------------------------------------------+
| Service_HTTPS                                                     |
+-------------------------------------------------------------------+
| -  Virtual addresses: 10.1.10.122                                 |
|                                                                   |
| -  policyWAF: /Common/**asm-lab3**                                |
|                                                                   |
| -  Keep other defaults                                            |
+-------------------------------------------------------------------+
| Analytics_Profile. Keep default                                   |
+-------------------------------------------------------------------+

|image22|

4. Click **Create**.

5. Check the application service https_waf_app_service has been created
   under Application LAB 1.2.

|image23|

6. Now, let’s look on the BIG-IP and verify the Application is correctly
   deployed in partition tenant2.

Logon to SEA-vBIGIP01.termmarc.com BIG-IP from the lab environment.
Select the partition tenant2 and look at the objects created on the
BIG-IP. 

Navigate to the virtual server in the tenant2 partition and under
Security and note that the WAF policy is attached to it.

Navigate to the WAF policy under Security >> Policies and review the protections enabled.

|image24|

-  Notice that new https_waf_app_service comes with a redirect.

-  Select the serviceMain virtual server, Select Security and hit
   Policies. The asm-lab3 Application Security Policy is Enabled and the
   Log Profile has a Log Profile selected.

-  Go to Security > Application Security > Security Policies and select
   the **asm-lab3** policy to get more detail of the deployed
   application security policy.

-  The enforced WAF policy is taken from a Github repository which
   contains F5 WAF ready templates:
   https://github.com/f5devcentral/f5-asm-policy-templates, please use
   the URL to get yourself familiar with other available WAF ready
   templates.

|image25|

6. Back to the BIG-IQ and logged in as **Paula**, select
   tenant2_https_waf_app_service. What is the enforced Protection Mode?

.. |image18| image:: images/lab2/image1.png
   :width: 6.5in
   :height: 2.78611in
.. |image19| image:: images/lab2/image2.png
   :width: 6.5in
   :height: 3.05208in
.. |image20| image:: images/lab2/image3.png
   :width: 6.5in
   :height: 2.9875in
.. |image21| image:: images/lab2/image4.png
   :width: 6.5in
   :height: 2.96111in
.. |image22| image:: images/lab2/image5.png
   :width: 6.5in
   :height: 7.00417in
.. |image23| image:: images/lab2/image6.png
   :width: 6.5in
   :height: 2.68611in
.. |image24| image:: images/lab2/image7.png
   :width: 6.5in
   :height: 2.17014in
.. |image25| image:: images/lab2/image8.png
   :width: 6.5in
   :height: 2.85625in