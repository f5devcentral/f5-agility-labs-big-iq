**Exercise 1 – Manage AS3 Templates on BIG-IQ**

   **Exercise 1.1 – Import AS3 templates**

From the UDF lab environment, launch a Console/RDP session to have access to
the Ubuntu Desktop. To do this, in your lab deployment, click on
the \ *Access* button of the \ *Ubuntu Lamp Server* system and
select \ *Console* or *XRDP*.

**Note**

Modern laptops with higher resolutions you might want to use 1440x900
and once XRDP is launched Zoom to 200%)

|image0|

View AS3 templates section

1. Logon to BIG-IQ by opening a browser and go to: \ https://10.1.1.4

2. Go to Applications > Application Templates and review the top section
   which is titled \ **AS3 Templates**.

3. A new BIG-IQ v7.0 deployment will NOT include AS3 templates out of
   the box. If you want to start using AS3 templates which are provided
   by F5, then those AS3 templates can be found through the following
   link: \ https://github.com/f5devcentral/f5-big-iq

..

   **Note**

   *The F5 default AS3 BIG-IQ templates are already imported in the lab
   environment blueprint.*

Import AS3 BIG-IQ templates

1. Select \ **Import Templates** at the right top corner.

..

   |image1|

2. Make yourself familiar with the Github page and understand which AS3
   templates are available.

3. When the AS3 templates are already imported in BIG-IQ you don’t need
   to perform next step, instead continue with the following step.

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

1. Log in as \ **Paula** in BIG-IQ.

2. Select \ **Application** to and then **Create** to create an
   Application Service

+-----------------------------------------------------------------------+
| Application properties:                                               |
+=======================================================================+
| -  Grouping = New Application                                         |
|                                                                       |
| -  Application Name = \ **LAB_Module1.2**                             |
|                                                                       |
| -  Description = My first AS3 template deployment through a GUI       |
+-----------------------------------------------------------------------+
| Select an Application Service Template:                               |
+-----------------------------------------------------------------------+
| -  Template Type =                                                    |
|    Select AS3-F5-HTTPS-offload-lb-existing-cert-template-big-iq-defau |
| lt- [AS3]                                                             |
+-----------------------------------------------------------------------+

**Warning**

   You will notice that the template is not available. If we want Paula
   to deploy this template, we first need to have those templates
   assigned to her via an administrator.

3. Logout as \ **Paula** and login to BIG-IQ as David. (if asked: Leave
   site? Select: Leave)

4. Select \ **Applications > Application Templates** and notice the
   ‘Published’ templates. The template \ **Paula** wants to use is
   listed as a ‘Published’ template.

|image2|

5. Go to \ **System > Role Management > Roles** and
   select \ **Application Roles** under the \ **CUSTOM ROLES** section.
   Here you will see the collection of the Custom Application Roles.

|image3|

6. **Paula** is assigned to the
   exiting Application Creator VMware custom role. Select it and scroll
   down to AS3 Templates. As you can see, \ **Paula** does not have
   permission to deploy an AS3 application
   using AS3-F5-HTTPS-offload-lb-existing-cert-template.

|image4|

7. Select AS3-F5-HTTPS-offload-lb-existing-cert-template-big-iq-default-<version> AS3
   Template and click the arrow to get it in
   the \ **‘Selected’** section. Then, select \ **Save & Close**.

8. Logout as David and log back in as \ **Paula** and
   click \ **Create** application.

9. Select Create Application to Create an Application Service:

+-----------------------------------------------------------------------+
| Application properties:                                               |
+=======================================================================+
| -  Grouping = New Application                                         |
|                                                                       |
| -  Application Name = \ **LAB_Module1.2**                             |
|                                                                       |
| -  Description = My first AS3 template deployment through a GUI       |
+-----------------------------------------------------------------------+
| Select an Application Service Template:                               |
+-----------------------------------------------------------------------+
| -  Template Type =                                                    |
|    Select AS3-F5-HTTPS-offload-lb-existing-cert-template-big-iq-defau |
| lt [AS3]                                                              |
+-----------------------------------------------------------------------+
| General Properties:                                                   |
+-----------------------------------------------------------------------+
| -  Application Service Name = https_app_service                       |
|                                                                       |
| -  Target = SEA-vBIGIP01.termmarc.com                                 |
|                                                                       |
| -  Tenant = tenant1                                                   |
+-----------------------------------------------------------------------+
| Analytics_Profile. Keep default                                       |
+-----------------------------------------------------------------------+
| Pool                                                                  |
+-----------------------------------------------------------------------+
| 1. Members: 10.1.20.120                                               |
|                                                                       |
| 2. Members: 10.1.20.121                                               |
+-----------------------------------------------------------------------+
| Service_HTTPS                                                         |
+-----------------------------------------------------------------------+
| -  Virtual addresses: 10.1.10.120                                     |
+-----------------------------------------------------------------------+
| Certificate. Keep default                                             |
+-----------------------------------------------------------------------+
| TLS_Server. Keep default                                              |
+-----------------------------------------------------------------------+

|image5|

10. Go to View Sample API Request in the right upper corner and select
    it. You will have a full AS3 declaration schema, scroll through it
    and hit close when done.

|image6|

11. Click \ **Create**.

12. Check the Application LAB_Module1.2 has been created.

|image7|

**Note**

   If not visible, refresh the page.

13. Select \ **LAB_Module1.2** Application. You will
    notice \ **LAB_Module1.2 **\ acts as a group of Application Services
    where underneath multiple services can be grouped. The next window
    will show you that a new Application Service has been created
    named: tenant1_https_app_service.

|image8|

14. Now, let’s look on the BIG-IP and verify the Application is
    correctly deployed in partition tenant1.

Logon to SEA-vBIGIP01.termmarc.com BIG-IP from the lab environment.
Select the partition tenant1 and look at the objects created on the
BIG-IP.

|image9|

15. You can test the application service by open a browser in the Ubuntu
       Jumphost and type the Virtual Server IP address 10.1.10.120.

16. Back on the BIG-IQ as \ **Paula**,
       select tenant1_https_app_service Application Service and look
       HTTP traffic analytics.

|image10|

**Note**

   An HTTP traffic generator is running on the Jumphost.

   **Exercise 1.3 - Modify template**

Through the GUI and when allowed, the application owner can make small
modifications.

1. In tenant1_https_app_service, select Servers and Configuration and
   add a Pool Member.

-  Click the + next to Server Addresses and add: 10.1.20.122.

-  Click \ **Save & Close**.

|image11|

2. Check SEA-vBIGIP01.termmarc.com (partition tenant1) Local Traffic >
   Pools and find \ **Pool**. It will have tenant1/https_app_service as
   the partition/path (or use search). Select Pool and go to members.

|image12|

3. Now back to the BIG-IQ and tenant1_https_app_service application and
   select \ **Application Service > Configuration.** Scroll down in the
   AS3 declaration and find that the schema has added the second pool
   member.

|image13|

Through the API you can’t modify the application service once deployed.
With AS3 via the GUI you can. Remember, that through the API you would
do a redeploy to add additional services. From the flipside, the GUI
only allows you to modify what has been permitted (made ‘editable’) when
the template was created.

**Exercise 2 – Working with custom AS3 Templates in BIG-IQ**

   **Exercise 2.1 – Create Custom AS3 template via BIG-IQ GUI**

We imported the default “out-of-the-box” AS3 templates (available
on \ https://github.com/f5devcentral/f5-big-iq) that can be used for
deploying an application service. However, it is a good practice to
clone the default AS3 templates and use them for your custom needs.

1. Logon as David and go to the Application > Application Templates and
   select AS3-F5-HTTPS-WAF-existing-lb-template-big-iq-default-<version> and
   press \ **Clone**.

2. Give the Cloned template a
   name: AS3-LAB-HTTPS-WAF-custom-template and click Clone.

|image14|

3. Open the template AS3-LAB-HTTPS-WAF-custom-template and select
   the Analytics_Profile AS3 class. Change to Override the
   Properties Collect Client-Side Statistics, as well
   as Collect URL and Collect User Agent.

|image15|

**Note**

   Response Code, User Method and Operating System and Brower are
   already enabled by default in the AS3 schema.

4. Click \ **Save & Close**.

5. Select AS3-LAB-HTTPS-WAF-custom-template and click \ **Publish**.

..

   **Exercise 2.2 – Deploy application via BIG-IQ using a customized AS3
   template**

1. Before **Paula** can use this AS3 template, David needs to update her
   role. Use the previous steps in lab **1.2** to add AS3 Template
   AS3-LAB-HTTPS-WAF-custom-template to Application Creator VMware
   custom role assigned to **Paula**.

2. Login as Paula and select previously created **LAB_Module1.2**
   Application and click **Create**.

3. Select Create Application to Create an Application Service:

+-------------------------------------------------------------------+
| Application properties:                                           |
+===================================================================+
| -  Grouping = Part of an Existing Application                     |
|                                                                   |
| -  Application Name = **LAB_Module1.2**                           |
|                                                                   |
| -  Description = My second AS3 template deployment through a GUI  |
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
| -  Members: 10.1.20.123                                           |
+-------------------------------------------------------------------+
| Service_HTTPS                                                     |
+-------------------------------------------------------------------+
| -  Virtual addresses: 10.1.10.122                                 |
|                                                                   |
| -  policyWAF: /Common/asm-lab3                                    |
+-------------------------------------------------------------------+
| Certificate. Keep default                                         |
+-------------------------------------------------------------------+
| TLS_Server. Keep default                                          |
+-------------------------------------------------------------------+

|image16|

4. Click **Create**.

5. Check the Application Service https_waf_app_service has been created
   under Application LAB_Module1.2.

|image17|

6. Now, let’s look on the BIG-IP and verify the Application is correctly
   deployed in partition tenant2.

Logon to SEA-vBIGIP01.termmarc.com BIG-IP from the lab environment.
Select the partition tenant2 and look at the objects created on the
BIG-IP.

|image18|

-  Notice that new https_waf_app_service comes with a redirect.

-  Select the HTTPS VS, Select Security and hit Policies. Application
   Security Policy is Enabled and the Log Profile has a
   Security_Log_Profile selected.

-  Go to Security > Application Security > Security Policies and select
   the **asm-lab3** policy to get more detail of the deployed
   application security policy.

-  The enforced WAF policy is taken from a Github repository which
   contains F5 WAF ready templates:
   https://github.com/f5devcentral/f5-asm-policy-templates, please use
   the URL to get yourself familiar with other available WAF ready
   templates.

|image19|

6. Back to the BIG-IQ and logged in as **Paula**, select
   tenant2_https_waf_app_service. What is the enforced Protection Mode?

**Exercise 3 – AS3 Application creation and deletion using AWX/Ansible
Tower and BIG-IQ**

**Exercise 3.1 – Application Creation**

1. Click on the \ *AWX (Ansible Tower)* button on the system \ *Ubuntu
   Lamp Server* in the Lab Environment. Use admin/purple123 to
   authenticate.

|image20|

2. Navigate to the \ **Projects** page and click on the refresh button
   to get the latest version of the templates.

|image21|

3. Navigate to the \ **Templates** page and review New_AS3_App

|image22|

4. Make sure the \ **PLAYBOOK** lab/f5-ansible-bigiq-as3-demo
   7.0.0/tower/app_create.yml is selected.

|image23|

**Note**

You can go on the \ `GitHub
repository <https://github.com/f5devcentral/f5-big-iq-lab/tree/develop/lab/f5-ansible-bigiq-as3-demo-7.0.0/tower>`__ and
check review the playbooks and Jinja2 templates.

5. On the \ **Templates**/*New_AS3_App* template page, click on
   the \ *Launch button to start a job using this template*.

|image24|

6. **CREDENTIAL**: Select BIG-IQ Creds as \ **Credential Type**. Then
   select paula-iq.

   |image25|

7. **SURVEY**: Enter below information regarding your application
   service definition

+-----------------+-------------------------------+
| **APP NAME:**   | MyAppDeployedWithAnsibleTower |
+=================+===============================+
| **APP TYPE:**   | http_app or waf_app           |
+-----------------+-------------------------------+
| **SERVICE IP:** | 10.1.10.124                   |
+-----------------+-------------------------------+
| **NODES:**      | 10.1.20.120 and 10.1.20.121   |
+-----------------+-------------------------------+

|image26|

8. **PREVIEW**: Review the summary of the template deployment, then
   click on \ **LAUNCH**

   |image27|

9. Follow the JOB deployment of the Ansible playbook.

   |image28|

**Note**

The \ *FAILED - RETRYING* messages are expected as the playbook runs
into a LOOP to check the AS3 task completion and will show failed until
loop isn’t completed.

10. When the job is completed, check the PLAY RECAP and make sure there
    are no failed.

    |image29|

10. Logon on \ **BIG-IQ** as **paula** *(paula\paula)*, go to
    Application tab and check the application is displayed and analytics
    are showing.

11. Select Unknown Applications Application

|image30|

12. Select MyAppDeployedWithAnsibleTower_M... Application Service.

    |image31|

**! Warning**

*Starting 7.0, BIG-IQ displays AS3 application services created using
the AS3 Declare API as Unknown Applications. You can move those
application services using the GUI, the \ *\ `Move/Merge
API <https://clouddocs.f5.com/products/big-iq/mgmt-api/latest/ApiReferences/bigiq_public_api_ref/r_public_api_references.html>`__\ * or
create it directly into Application in BIG-IQ using the \ *\ `Deploy
API <https://clouddocs.f5.com/products/big-iq/mgmt-api/latest/ApiReferences/bigiq_public_api_ref/r_public_api_references.html>`__\ * to
define the BIG-IQ Application name.*

13. Review the HTTP traffic analytics.

    |image32|

**Exercise 3.2 – Application Deletion**

1. Navigate to the \ **Templates** page and review Delete_AS3_App

|image33|

2. Make sure
   the \ **PLAYBOOK** lab/f5-ansible-bigiq-as3-demo-7.0.0/tower/app_delete.yml is
   selected. Click on the \ *Launch button to start a job using this
   template*.

|image34|

**Note**

You can go on the \ `GitHub
repository <https://github.com/f5devcentral/f5-big-iq-lab/tree/develop/lab/f5-ansible-bigiq-as3-demo-7.0.0/tower>`__ and
check review the playbooks and Jinja2 templates.

3. **CREDENTIAL**: Select BIG-IQ Creds as \ **Credential Type**. Then
   select paula-iq.

   Click *NEXT.*

   |image35|

4. **SURVEY**: Enter below information regarding your application
   service definition.

   Click *NEXT.*

+-----------+-------------------------------+
| APP NAME: | MyAppDeployedWithAnsibleTower |
+-----------+-------------------------------+

|image36|

5. **PREVIEW**: Review the summary of the template deployment, then
   click on \ **LAUNCH**

   |image37|

6. Follow the JOB deployment of the Ansible playbook.

   |image38|

**Note**

The \ *FAILED - RETRYING* messages are expected as the playbook runs
into a LOOP to check the AS3 task completion and will show failed until
loop isn’t completed.

7. When the job is completed, check the PLAY RECAP and make sure there
   are no failed.

   |image39|

8. Logon on \ **BIG-IQ** as **paula**, go to Application tab and check
   the application is displayed and analytics are showing.
   Select Unknown Applications Application

|image40|

Notice that the application is now deleted.

|image41|

.. |image0| image:: images/image1.png
   :width: 6.5in
   :height: 3.62153in
.. |image1| image:: images/image2.png
   :width: 6.5in
   :height: 2.07361in
.. |image2| image:: images/image3.png
   :width: 6.5in
   :height: 2.32986in
.. |image3| image:: images/image4.png
   :width: 6.5in
   :height: 3.52847in
.. |image4| image:: images/image5.png
   :width: 6.5in
   :height: 3.34931in
.. |image5| image:: images/image6.png
   :width: 6.5in
   :height: 4.13125in
.. |image6| image:: images/image7.png
   :width: 6.5in
   :height: 6.12917in
.. |image7| image:: images/image8.png
   :width: 6.5in
   :height: 3.48333in
.. |image8| image:: images/image9.png
   :width: 6.5in
   :height: 2.1125in
.. |image9| image:: images/image10.png
   :width: 6.5in
   :height: 2.30694in
.. |image10| image:: images/image11.png
   :width: 6.5in
   :height: 3.45278in
.. |image11| image:: images/image12.png
   :width: 6.5in
   :height: 4.00903in
.. |image12| image:: images/image13.png
   :width: 6.5in
   :height: 3.03194in
.. |image13| image:: images/image14.png
   :width: 6.5in
   :height: 6.55347in
.. |image14| image:: images/image15.png
   :width: 6.5in
   :height: 3.93333in
.. |image15| image:: images/image16.png
   :width: 6.5in
   :height: 4.45139in
.. |image16| image:: images/image17.png
   :width: 6.5in
   :height: 7.67639in
.. |image17| image:: images/image18.png
   :width: 6.5in
   :height: 2.86667in
.. |image18| image:: images/image19.png
   :width: 6.5in
   :height: 1.75208in
.. |image19| image:: images/image19.png
   :width: 6.5in
   :height: 1.75208in
.. |image20| image:: images/image20.png
   :width: 3.79545in
   :height: 2.69677in
.. |image21| image:: images/image21.png
   :width: 7.49167in
   :height: 3.6933in
.. |image22| image:: images/image22.png
   :width: 7.52216in
   :height: 3.70833in
.. |image23| image:: images/image23.png
   :width: 7.54167in
   :height: 3.71795in
.. |image24| image:: images/image24.png
   :width: 7.48835in
   :height: 3.69167in
.. |image25| image:: images/image25.png
   :width: 5.31061in
   :height: 4.02172in
.. |image26| image:: images/image26.png
   :width: 5.75833in
   :height: 4.58679in
.. |image27| image:: images/image27.png
   :width: 4.68333in
   :height: 3.48193in
.. |image28| image:: images/image28.png
   :width: 7.57287in
   :height: 3.73333in
.. |image29| image:: images/image29.png
   :width: 7.52216in
   :height: 3.70833in
.. |image30| image:: images/image30.png
   :width: 7.55in
   :height: 3.68215in
.. |image31| image:: images/image31.png
   :width: 6.69697in
   :height: 3.80723in
.. |image32| image:: images/image32.png
   :width: 7.56167in
   :height: 3.125in
.. |image33| image:: images/image33.png
   :width: 7.28788in
   :height: 3.59284in
.. |image34| image:: images/image34.png
   :width: 7.31818in
   :height: 3.60778in
.. |image35| image:: images/image35.png
   :width: 5.20833in
   :height: 3.92957in
.. |image36| image:: images/image36.png
   :width: 5.80303in
   :height: 2.12465in
.. |image37| image:: images/image37.png
   :width: 4.95455in
   :height: 3.67876in
.. |image38| image:: images/image38.png
   :width: 7.31818in
   :height: 3.60778in
.. |image39| image:: images/image39.png
   :width: 7.54167in
   :height: 3.71795in
.. |image40| image:: images/image40.png
   :width: 7.48333in
   :height: 3.47171in
.. |image41| image:: images/image41.png
   :width: 7.55in
   :height: 3.72206in
