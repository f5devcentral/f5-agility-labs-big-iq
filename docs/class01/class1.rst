Class 1: BIG-IQ Application Creation (Cloud Edition)
====================================================

.. note:: On this page there is no actions to be done here regarding the lab itself

In this class, we will review the application creation feature available with BIG-IQ 6.0.

Below Virtual Servers and Pool Members can be used in the context of the  (UDF lab) for this class.

.. warning:: After starting the blueprint in UDF, connect to the BIG-IP Cluster BOS-vBIGIP01.termmarc.com and BOS-vBIGIP02.termmarc.com, make sure the cluster shows **In Sync**.

- **Test Web Site 16:** *(used in module 4)*

==================  ============ ======== ============================ ============
Test Website         VIP         Ports    Servers                      Ports
==================  ============ ======== ============================ ============
site16.example.com   10.1.10.116 443/80   10.1.20.116 and 10.1.20.117  80/8080/8081
==================  ============ ======== ============================ ============

- **Test Web Site 18:** *(used in module 2)*

==================  ============ ======== ============================ ============
Test Website         VIP         Ports    Servers                      Port
==================  ============ ======== ============================ ============
site18.example.com   10.1.10.118 443/80   10.1.20.118 and 10.1.20.119  80/8080/8081
==================  ============ ======== ============================ ============

- **Test Web Site 20:** *(used in module 3)*

==================  ============ ======== ============================ ============
Test Website         VIP         Ports    Servers                      Ports
==================  ============ ======== ============================ ============
site20.example.com   10.1.10.120 443/80   10.1.20.120 and 10.1.20.121  80/8080/8081
==================  ============ ======== ============================ ============

- **Test Web Site 22:** *(used in module 3)*

==================  ============ ======== ============================ ============
Test Website         VIP         Port     Server                       Ports
==================  ============ ======== ============================ ============
site22.example.com   10.1.10.122 80       10.1.20.122                  80/8080/8081
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
