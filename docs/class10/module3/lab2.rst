Lab 3.2: Adding a BIG-IP DNS device to existing Sync Group
-----------------------------------------------------------
<<<<<<< HEAD
``Ça arrive bientôt זה בקרוב Viene pronto すぐに来る Sta arrivando presto قادم قريبا Coming soon 即將到來``
=======
In order for a BIG-IP DNS to be added to a sync group, the following objects must first be created on each device:

* Data Center
* Server Object
* Listener 

In this lab, we will create necessary objects for a DNS Sync Group

  Adding Seattle DC
    => create DC, server in Seattle BIG-IP and add it to BOSTON sync group

Data Center setup
******************

BIG-IP DNS data centers represent a group of services or applications that reside in a specific geographic location. BIG-IP DNS systems use pools to represent and monitor the availability of each service or application. To direct application traffic to a primary data center, the wide IPs configured to use Global Availability load balancing mode respond to DNS name resolution requests using the IP addresses of available pools in the primary data center.

Data center failover is the process of changing the IP addresses that the wide IP uses when answering DNS name resolution requests from those of the primary pool in one data center to those of a secondary pool in another data center.

All BIG-IP DNS systems in a configuration synchronization (ConfigSync) group receive requests for DNS name resolution; however, when responding to DNS name resolution requests, the wide IP uses only the IP addresses of primary and available pools.

To create your Data Center(s) go to *Configuration* > *DNS* > *GSLB* > *Data centers*, it should look like this:

.. image:: ../pictures/module3/Create_DC_step1.png
  :align: center
  :scale: 50%

|

Click *Create* and fill out the details of the Seattle Data Center

.. image:: ../pictures/module3/Create_DC_step2.png
  :align: center
  :scale: 50%

Deploy the Data Center configuration to all of the BIG-IPs (must choose sync group and deploy to both). Repeat this process to create a Data center "BostonDC" and push it only to SEA-vBIGIP01.termmarc.com  

.. image:: ../pictures/module3/Create_DC_step3.png
  :align: center
  :scale: 50%

Server Object setup
********************

In order for the newly created Data Center to become active, a Server objects must be created. A Server object must exist for every BIG-IP DNS you wish to add to a sync group. 

For our lab, we will be adding SEA-vBIGIP01.termmarc.com to the BosSeaDNS sync group. 

.. note:: All devices need to be on the same software version.

Because SEA-vBIGIP01.termmarc.com doesn't currently have a server object, they must be created on the box itself. 
To create your Server Objects go to *DNS* > *GSLB* > *Servers* > *Servers List Create*, it should look like this:

.. image:: ../pictures/module3/Create_Server_step4.png
  :align: center
  :scale: 50%

Create a cerver object for the boston servers as well. Here is an example of the BOS-vBIGIP01.termmarc.com BIG-IP. Repeat this for the BOS-vBIGIP01.termmarc.com server.

.. image:: ../pictures/module3/Server_BOS1.png
  :align: center
  :scale: 50%

To create the Server object on the BosSeaDNS sync group, go to *Configuration* > *GSLB* > *Servers* > *Create New Server Device*, and add in the information for SEA-vBIGIP01.termmarc.com.
It should look like this:

.. image:: ../pictures/module3/Create_Server_step1.png
  :align: center
  :scale: 50%

Next, add the Server object to the BoSeaDNS sync group under Properties.  It should look like this:

.. image:: ../pictures/module3/Create_Server_step2.png
  :align: center
  :scale: 50%

To complete the addition of SEA-vBIGIP01.termmarc.com, you must run the gtm_add script directly on the device. Open the CLI and type in the command: tmsh gtm run gtm_add. You will be prompted for the IP address of the BIGIP you would like to get your config from. Type in the self IP for BOS-vBIGIP01.termmarc.com "10.1.1.8". When the script is done running, SEA-vBIGIP01.termmarc.com will be joined to the BosSeaDNS sync group.  See the example below.

.. image:: ../pictures/module3/GTM_add.png
  :align: center
  :scale: 50%

Becuase we had to complete some of the steps on the BIG-IPs themself, we must rediscover and re-import the configurations.

.. image:: ../pictures/module3/Rediscover.png
  :align: center
  :scale: 50%

If the steps have been done correctly, you should see all three BIG-IPs with their status as green

.. image:: ../pictures/module3/sync_complete.png
  :align: center
  :scale: 50%

Listener Object creation
*************************

To control how BIG-IP DNS handles network traffic, you configure one or more listeners. A listener is a specialized resource to which you assign a specific IP address and port 53, the DNS query port. When traffic is sent to that IP address, the listener alerts the DNS system, allowing it to either handle the traffic locally or forward the traffic to the appropriate resource. Because the SEA-vBIGIP01.termmarc.com does not have a listener yet, one must be created before it can handle DNS traffic. 

To create your Listeners, go to *Configuration* > *DNS Listeners* > *Create New Listener*

you should see this:

.. image:: ../pictures/module3/Create_listener.png
  :align: center
  :scale: 50%

Deploy your listener configuration and this lab is complete.

.. image:: ../pictures/module3/deploy.png
  :align: center
  :scale: 50%
>>>>>>> 4dcbf9a20b561fa4814a0b1ae044091a5e78f6d7
