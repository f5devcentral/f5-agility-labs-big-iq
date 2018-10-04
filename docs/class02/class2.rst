Class 2: BIG-IQ Deployment with auto-scale (Cloud Edition)
==========================================================

.. note:: On this page there is no actions to be done here regarding the lab itself

In this class, we will review the auto-scale feature available with BIG-IQ 6.0
called ``Service Scaling Groups`` (SSG)

Below Virtual Servers and Pool Members can be used in the context of the  (UDF lab) for this class.

.. warning:: After starting the blueprint in UDF, connect to the BIG-IP Cluster BOS-vBIGIP01.termmarc.com and BOS-vBIGIP02.termmarc.com, make sure the cluster shows **In Sync**.

- **Test Web Site 26:**

==================  ============ ======== ============================ ============
Test Website         VIP         Ports    Servers                      Ports
==================  ============ ======== ============================ ============
site26.example.com   10.1.10.126 443/80   10.1.20.126 and 10.1.20.127  80/8080/8081
==================  ============ ======== ============================ ============

- **Test Web Site 28:**

==================  ============ ======== ============================ ============
Test Website         VIP         Ports    Servers                       Ports
==================  ============ ======== ============================ ============
site28.example.com   10.1.10.128 443/80   10.1.20.128 and 10.1.20.129  80/8080/8081
==================  ============ ======== ============================ ============

- **Test Web Site 30:** *(used in module 2)*

==================  ============ ======== ============================ ============
Test Website         VIP         Ports    Servers                      Ports
==================  ============ ======== ============================ ============
site30.example.com   10.1.10.130 443/80   10.1.20.130 and 10.1.20.131  80/8080/8081
==================  ============ ======== ============================ ============

- **Test Web Site 32:**

==================  ============ ======== ============================ ============
Test Website         VIP         Port     Server                       Ports
==================  ============ ======== ============================ ============
site32.example.com   10.1.10.132 80       10.1.20.132                  80/8080/8081
==================  ============ ======== ============================ ============

- Port 80: hackazon application
- Port 8080: web-dvwa application
- Port 8081: f5-hello-world application
- Port 8082: f5-demo-httpd application
- Port 8083: f5-demo-httpd frontend application
- Port 8084: f5-demo-httpd backend application

.. toctree::
   :maxdepth: 1
   :glob:

   intro
   module*/module*
