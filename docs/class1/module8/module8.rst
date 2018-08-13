Module 8: Application Templates & Deployment (Optional)
========================================================

**BIG-IP Cloud Edition:**

BIG-IP Cloud Edition provides traffic management and security
application services on a per-application basis using BIG-IP LTM and
Advanced WAF, respectively, to isolate workloads and for better
manageability.

In addition, you can auto-scale application services based on predefined
thresholds. Application auto-scaling uses the **Service Scaling Group (SSG)** feature, which enables administrators to configure the BIG-IQ
system to scale-out or scale-in BIG-IP virtual edition instances based
on scaling rules, such as CPU and memory use or throughput.

To further enhance manageability, BIG-IP Cloud Edition enables network
and security operations teams to provide application teams with
self-service deployment of application services in public and private
clouds.

BIG-IP Cloud Edition is a solution package comprised of the BIG-IQ
system, BIG-IP Per-App Virtual Edition (VE), and other supporting
components.

A service template is a collection of objects that you define. When you
create an application from the template, you can omit or include these
objects. Once you specify the objects and settings you need, you save
the application and it creates those objects on the device you targeted
it to, or on the devices in the SSG you identified.

.. NOTE::
	 You can currently auto-scale per-app virtual edition instances on Amazon Web Services (AWS) and VMWare.

**Goal:**

In this lab, we will cover the creation of Application Template and
deployment of Applications. For Auto-scaling of applications via SSG,
please refer to addition documentation.

To create an application using the BIG-IQ user interface you choose a
service template that defines the objects in that application and then
decide whether you want to deploy that application to a service scaling
group (SSG) or to a managed device.

Tasks:

8.1: Create personas in BIG-IQ for Application Deployment

8.2: Application Templates & Deployment

8.3: Application Deployment via API

.. toctree::
   :maxdepth: 1
   :glob:

   lab*/module*
