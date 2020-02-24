**Exercise 1 – Manage AS3 Templates on BIG-IQ**

   **Exercise 1.1 – Import AS3 templates**

   **Credentials**

   **Username Password Notes**

   admin purple123 local

   paula paula radius

   david david radius

   larry larry radius

   marco marco radius

   olivia olivia local

   dnsuser dnsuser radius

   certuser certuser radius

From the lab environment, launch an RDP session to access the Ubuntu
Desktop. To do this, in your lab deployment, click on the
*DETAILS* button of the \ *Ubuntu Lamp Server* system and from the
*XRDP,* click on the drop-down and select the resolution that works for
your laptop.

**Note**

Modern laptops with higher resolutions you might want to use 1440x900
and once XRDP is launched Zoom to 200%)

If the RDP session does not render correctly or the resolution poor, you
can complete the labs by going directly to the BIG-IP and BIG-IQ CM XUI.

|image0|

|image1|

To access the BIG-IQ directly, click on the ACCESS button under BIGIQ CM
and select TMUI

|image2|

View AS3 templates section

1. From within the LAMP server RDP session, logon to BIG-IQ as **admin**
      by opening a browser and go to: \ https://10.1.1.4 or directly via
      the TMUI as shown above.

2. Go to Applications > Application Templates and review the top section
      which is titled \ **AS3 Templates**.

A new BIG-IQ v7.0 deployment will NOT include AS3 templates out of the
box. If you want to start using AS3 templates which are provided by F5,
then those AS3 templates can be found through the following
link: \ https://github.com/f5devcentral/f5-big-iq

**Note**

   *The F5 default AS3 BIG-IQ templates are already imported in the lab
   environment blueprint.*

Import AS3 BIG-IQ templates

1. Select \ **Import Templates** at the right top corner. You will be
   taken to the BIG-IQ AS3 Template Library on Github.

..

   |image3|

2. Make yourself familiar with the Github page and understand which AS3
   templates are available.

3. The AS3 templates are already imported in BIG-IQ and you don’t need
   to perform step 4.

4. Use the provided instructions on the Github page to import the
   templates into BIG-IQ.

..

   **Note**

   The F5 default AS3 BIG-IQ templates are already imported in the lab
   environment blueprint.

5. Walk through the provided templates and select them to understand the
   structure. If familiar with AS3 you will notice the structure.
   Otherwise, visit \ `AS3 Example
   declarations <https://clouddocs.f5.com/products/extensions/f5-appsvcs-extension/latest/userguide/examples.html.>`__.

..

   **Exercise 1.2 – Deploy application via BIG-IQ using a default AS3
   template**

Create HTTPS Service using AS3 via BIG-IQ GUI
---------------------------------------------

In this exercise we will create an application service using an AS3
template. The service will include a pool with two pool members (server
addresses) listening on port 80, a virtual server listening on port 443
and various profiles to offload SSL to the pool members.

First we attempt to create an application service as application owner
Paula.

1. Log in as \ **paula** in BIG-IQ.

2. In the \ **Applications** page click on **Create** to create an
   Application Service

+-----------------------------------------------------------------------+
| Application properties:                                               |
+=======================================================================+
| -  Grouping = New Application                                         |
|                                                                       |
| -  Application Name = \ **LAB 1.2**                                   |
|                                                                       |
| -  Description = My first AS3 template deployment with BIG-IQ         |
+-----------------------------------------------------------------------+
| Select an Application Service Template:                               |
+-----------------------------------------------------------------------+
| -  Template Type =                                                    |
|    Select AS3-F5-HTTPS-offload-lb-existing-cert-template-big-iq-defau |
| lt-v1 [AS3]                                                           |
+-----------------------------------------------------------------------+

**Warning**

   You will notice that the template is not available. If we want Paula
   to deploy this template, we first need to have those templates
   assigned to her via an administrator.

3. Logout as \ **paula** and login to BIG-IQ as **david**. (if asked:
   Leave site? Select: Leave)

4. Select \ **Applications > Application Templates** and notice the
   ‘Published’ templates. The template \ **Paula** wants to use is
   listed as a ‘Published’ template.

|image4|

5. Go to \ **System > Role Management > Roles** and
   select \ **Application Roles** under the \ **CUSTOM ROLES** section.
   Here you will see the collection of the Custom Application Roles.

|image5|

6. **Paula** is assigned to the
   exiting Application Creator VMware custom role. Select it and scroll
   down to AS3 Templates. As you can see, \ **Paula** does not have
   permission to deploy an AS3 application
   using AS3-F5-HTTPS-offload-lb-existing-cert-template.

|image6|

7. Select AS3-F5-HTTPS-offload-lb-existing-cert-template-big-iq-default-v1 AS3
   Template and click the arrow to get it in
   the \ **‘Selected’** section. Then, select \ **Save & Close**.

8. Logout as David and log back in as \ **Paula** and
   click \ **Create** to create an application.

9. Select Create Application to Create an Application Service:

|image7|

+-----------------------------------------------------------------------+
| **Application Properties**                                            |
+=======================================================================+
| -  Grouping = New Application                                         |
|                                                                       |
| -  Application Name = \ **LAB­­ 1.2**                                 |
|                                                                       |
| -  Description = My first AS3 template deployment with BIG-IQ         |
+-----------------------------------------------------------------------+
| Select an Application Service Template:                               |
+-----------------------------------------------------------------------+
| -  Template Type =                                                    |
|    Select AS3-F5-HTTPS-offload-lb-existing-cert-template-big-iq-defau |
| lt [AS3]                                                              |
+-----------------------------------------------------------------------+
| **General Properties**                                                |
+-----------------------------------------------------------------------+
| -  Application Service Name = https_app_service                       |
|                                                                       |
| -  Target = SEA-vBIGIP01.termmarc.com                                 |
|                                                                       |
| -  Tenant = tenant1                                                   |
+-----------------------------------------------------------------------+
| **Analytics_Profile:** Keep default                                   |
+-----------------------------------------------------------------------+
| **Pool**                                                              |
+-----------------------------------------------------------------------+
| -  Name = Pool                                                        |
|                                                                       |
| -  Members                                                            |
|                                                                       |
|    -  Server Addresses = 10.1.20.120 and 10.1.20.121                  |
|                                                                       |
|    -  Service Port = 80                                               |
+-----------------------------------------------------------------------+
| **Service_HTTPS**                                                     |
+-----------------------------------------------------------------------+
| -  Virtual addresses = 10.1.10.120                                    |
|                                                                       |
| -  Keep other defaults                                                |
+-----------------------------------------------------------------------+
| **Certificate:** Keep defaults                                        |
+-----------------------------------------------------------------------+
| **TLS_Server:** Keep defaults                                         |
+-----------------------------------------------------------------------+

|image8|

10. Go to View Sample API Request in the right upper corner and select
    it. You will have a full AS3 declaration schema, scroll through it
    and hit close when done.

|image9|

11. Click \ **Create**.

12. Check that the Application LAB 1.2 has been created.

|image10|

**Note**

   If not visible, refresh the page.

13. Select \ **LAB 1.2** Application. You will
    notice \ **LAB1.2 **\ acts as a group of Application Services where
    underneath multiple services can be grouped. The next window will
    show you that a new Application Service has been created
    named: tenant1_https_app_service.

|image11|

14. Now, let’s look on the BIG-IP and verify the Application is
    correctly deployed in partition tenant1.

Logon to SEA-vBIGIP01.termmarc.com BIG-IP as **admin** from the lab
environment. Select the partition tenant1 and look at the objects
created on the BIG-IP.

|image12|

15. You can test the application service by open a browser in the Ubuntu
       Jumphost and type the Virtual Server IP address 10.1.10.120. You
       should see the Hackazon website.

16. Back on the BIG-IQ as \ **paula**,
       select tenant1_https_app_service Application Service and look
       HTTP traffic analytics.

|image13|

**Note**

   An HTTP traffic generator is running on the Jumphost.

**Exercise 1.3 - Modify template**

Through the GUI *and when allowed*, the application owner can make small
modifications.

1. In tenant1_https_app_service, select Servers >> Configuration and add
   a Pool Member.

-  Click the + next to the second Server Address and add: 10.1.20.122.

-  Click \ **Save & Close**.

|image14|

2. Once the configuration change has completed in BIG-IQ,
   check SEA-vBIGIP01.termmarc.com (partition tenant1) Local Traffic >
   Pools and find \ **Pool**. It will have tenant1/https_app_service as
   the partition/path (or use search). Select Pool and go to members.

|image15|

3. Now back to the BIG-IQ and tenant1_https_app_service application and
   select \ **Application Service > Configuration.** Scroll down in the
   AS3 declaration and find that the schema has added the second pool
   member.

|image16|

|image17|

**Note**

If application services are deployed directly to a BIG-IP using an AS3
template (JSON declaration) from a client other than BIG-IQ such as
Postman or Ansible, you cannot modify the application service via the
BIG-IQ. However, when deploying an AS3 template from BIG-IQ, you can.
The BIG-IQ GUI only allows you to modify what has been permitted (made
‘editable’) when the template was created. With a configuration deployed
through the API directly to the BIG-IP and not via BIG-IQ, you would
need to redeploy to add additional services.

**Exercise 2 – Working with custom AS3 Templates in BIG-IQ**

   **Exercise 2.1 – Create Custom AS3 template via BIG-IQ GUI**

We imported the default “out-of-the-box” AS3 templates (available
on \ https://github.com/f5devcentral/f5-big-iq) that can be used for
deploying an application service. However, it is a good practice to
clone the default AS3 templates and use them for your custom needs.

1. Logon as **david** and go to the Applications > Application Templates
   and
   select AS3-F5-HTTPS-WAF-existing-lb-template-big-iq-default-v1 and
   click on \ **Clone**.

2. Name the cloned template: AS3-LAB-HTTPS-WAF-custom-template and click
   Clone.

..

   |image18|

3. Open the template called AS3-LAB-HTTPS-WAF-custom-template and select
   the Analytics_Profile. Change to Override the Properties for
   Collect Client-Side Statistics, as well
   as Collect URL and Collect User Agent. Ensure the Enable checkbox is
   selected for these.

|image19|

**Note**

   Response Code, User Method and Operating System and Brower are
   already enabled by default in the AS3 schema.

4. Click \ **Save & Close**.

5. Select AS3-LAB-HTTPS-WAF-custom-template and click \ **Publish**.

**Exercise 2.2 – Deploy application via BIG-IQ using a customized AS3
template**

1. In this exercise Paula is going to create an application service that
   includes a Web Application Firewall (WAF) profile to secure the
   application. You should be familiar with the other configuration
   components from the prior lab.

2. Before **Paula** can use this AS3 template, David needs to update her
   role. Use the previous steps in lab **1.2** to add AS3 Template
   AS3-LAB-HTTPS-WAF-custom-template to Application Creator VMware
   custom role assigned to **Paula**.

3. Login as Paula and select previously created **LAB 1.2** Application
   and click **Create**.

|image20|

4. Select Create Application to Create an Application Service:

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
| Analytics_Profile. Keep default                                   |
+-------------------------------------------------------------------+
| Pool                                                              |
+-------------------------------------------------------------------+
| -  Members:                                                       |
|                                                                   |
| -  Service Address = 10.1.20.123                                  |
+-------------------------------------------------------------------+
| Service_HTTPS                                                     |
+-------------------------------------------------------------------+
| -  Virtual addresses: 10.1.10.122                                 |
|                                                                   |
| -  policyWAF: /Common/**asm-lab3**                                |
|                                                                   |
| -  Keep other defaults                                            |
+-------------------------------------------------------------------+
| Certificate: Keep defaults                                        |
+-------------------------------------------------------------------+
| TLS_Server: Keep defaults                                         |
+-------------------------------------------------------------------+

|image22|

4. Click **Create**.

5. Check the Application Service https_waf_app_service has been created
   under Application LAB 1.2.

|image23|

6. Now, let’s look on the BIG-IP and verify the Application is correctly
   deployed in partition tenant2.

Logon to SEA-vBIGIP01.termmarc.com BIG-IP from the lab environment.
Select the partition tenant2 and look at the objects created on the
BIG-IP.

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

.. |image0| image:: media/image1.png
   :width: 6.5in
   :height: 2.48542in
.. |image1| image:: media/image2.png
   :width: 6.5in
   :height: 3.49167in
.. |image2| image:: media/image3.png
   :width: 6.5in
   :height: 5.18194in
.. |image3| image:: media/image4.png
   :width: 6.5in
   :height: 2.07361in
.. |image4| image:: media/image5.png
   :width: 6.5in
   :height: 2.22778in
.. |image5| image:: media/image6.png
   :width: 6.5in
   :height: 3.23889in
.. |image6| image:: media/image7.png
   :width: 6.5in
   :height: 3.26806in
.. |image7| image:: media/image8.png
   :width: 6.5in
   :height: 2.95764in
.. |image8| image:: media/image9.png
   :width: 5.84306in
   :height: 9in
.. |image9| image:: media/image10.png
   :width: 6.5in
   :height: 6.73056in
.. |image10| image:: media/image11.png
   :width: 6.5in
   :height: 3.12014in
.. |image11| image:: media/image12.png
   :width: 6.5in
   :height: 2.49306in
.. |image12| image:: media/image13.png
   :width: 6.5in
   :height: 2.41389in
.. |image13| image:: media/image14.png
   :width: 6.5in
   :height: 3.8875in
.. |image14| image:: media/image15.png
   :width: 6.5in
   :height: 3.18403in
.. |image15| image:: media/image16.png
   :width: 6.5in
   :height: 3.20347in
.. |image16| image:: media/image17.png
   :width: 6.5in
   :height: 3.88611in
.. |image17| image:: media/image18.png
   :width: 5.48in
   :height: 6.22647in
.. |image18| image:: media/image19.png
   :width: 6.5in
   :height: 3.08403in
.. |image19| image:: media/image20.png
   :width: 6.5in
   :height: 3.10556in
.. |image20| image:: media/image21.png
   :width: 6.5in
   :height: 2.38264in
.. |image21| image:: media/image22.png
   :width: 6.5in
   :height: 2.9in
.. |image22| image:: media/image23.png
   :width: 6.5in
   :height: 7.00417in
.. |image23| image:: media/image24.png
   :width: 6.5in
   :height: 2.34792in
.. |image24| image:: media/image25.png
   :width: 6.5in
   :height: 2.45417in
.. |image25| image:: media/image26.png
   :width: 6.5in
   :height: 2.99444in
