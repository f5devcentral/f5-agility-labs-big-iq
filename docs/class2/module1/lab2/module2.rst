Module 2: Application Templates & Deployment
============================================
In this module, we will learn how to use Application Templates and how to deploy an **Application**.

The Application Templates will be created by **marco**, the Administrator.
**larry** will create the security policies and let Marco know about the ones to associate with the templates.
Once the template is ready with all the necessary information, it will be ready to use by the Application owner.

**paula** needs to deploy an application, she has multiple Application servers. At this time, she needs to test
the performance of her application, she also wants to make her application secure before staging it to production.
She connects to the BIG-IQ and has access to her Application Dashboard.
**paula** uses the application template created by Marco to deploy her Application.

After a week of testing her application (in the class ~5 min), she will ask **larry** to fine tune and validate
the learning done by the Web Application Firewall (BIG-IP ASM).

.. note:: A traffic generator located on the **Ubuntu Lamp Server** is sending good traffic every minute to the virtual servers.

Once the security policy is tuned and validated, **paula** will enforce blocking mode in the policy.

Finally, we will simulate "bad" traffic to show the security policy blocking it.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
