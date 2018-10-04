Lab 3.3: Create Application via API (Python)
--------------------------------------------
.. note :: This is an optional lab.

.. warning :: **david** is used to do the API calls, make sure it has the correct permission and is a LOCAL user (c.f. Class 1 Module 1)

In this lab, we are going to create an application using Python script and BIG-IQ API.

On BIG-IQ, connect as **david** (select Auth Provider local) to create a new application, click on **Create**, select the template previously created ``Default-f5-HTTP-lb-template``.

- BIG-IP: Select ``SEA-vBIGIP01.termmarc.com``
- Application Name: ``site20.example.com``
- Destination Address: ``10.1.10.120``
- Destination Network Mask: ``255.255.255.255``
- Service Port: ``80``
- Servers (Pool Member): ``10.1.20.120`` and ``10.1.20.121``

**Do NOT click on Create** but on **View Sample API Request** at the top right corner.

.. image:: ../pictures/module3/img_module3_lab3_1.png
  :align: center
  :scale: 50%

|

Open a SSH session to *Ubuntu Lamp Server* in UDF.

Look at the file ``/home/f5/class1mod3.py``

- The application name was set: APP_NAME = "``site20.example.com``"
- Template name configured in ``templates`` variable (e.g. Default-f5-HTTP-lb-template)
- BIG-IP management IP is used to filter the device where the app will be deployed in variable ``device`` (e.g. 10.1.1.7 for SEA-vBIGIP01.termmarc.com)
- The API Sample Request generated previously from BIG-IQ UI was inserted in the script in the ``post_body`` variable (only until ``addAnalytics`` line)

Execute the Python script::

    # /home/f5/class1mod3.py

Output::

    u'Polling task, Status: STARTED'
    u'Polling task, Status: STARTED'
    ....
    u'Polling task, Status: STARTED'
    u'Polling task, Status: STARTED'
    u'Polling task, Status: FINISHED'

Connect as **david** (select Auth Provider local) and check on BIG-IQ the application has been correctly created.
