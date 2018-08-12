Lab 4.2: Create Application
---------------------------
Logout and log back into BIG-IQ as **paula** with password of **paula** to create a new application.

Click on the *Create* button
and select the template previously created ``f5-HTTP-lb-custom-template``.

Type in a Name for the application you are creating.

- Application Name: ``site16.example.com``

To help identify this application when you want to use it later, in the Description field, type in a brief description for the application you are creating.

- Description: ``My Second Application``

For Device, select the name of the device you want to deploy this application to. (if the HTTP statistics are not enabled, they can be enabled later on after the application is deployed)

- BIG-IP: Select ``SEA-vBIGIP01.termmarc.com``
- Check ``Collect HTTP Statistics``

Click **Create**

Watch your application configuration deploy to the BIG-IP from the BIG-IQ Application Dashboard.

This can take a few minutes.

You can also login to the BIG-IP (SEA-vBIGIP01) as **admin** with password **agility** to review the configuration deployed.

**You have reached the end of Class 1.**
