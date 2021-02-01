F5 Agility 2021: Security Automation with BIG-IQ 8.0
====================================================

What is Declarative Onboarding?
-------------------------------

F5 Declarative onboarding uses a declarative model to initially configure a BIG-IP device with all of the required settings to get up and running. This includes system settings such as licensing and provisioning, network settings such as VLANs and Self IPs, and clustering settings if you are using more than one BIG-IP system. If you want to use a declarative model to configure applications and services on a BIG-IP device that already has these initial settings, see the Application Services 3 (AS3) documentation.

A declarative model means you provide a JSON declaration rather than a set of imperative commands. The declaration represents the configuration which Declarative Onboarding is responsible for creating on a BIG-IP system. You send a declaration file using a single Rest API call.

What is Application Services?
-----------------------------

Application Services 3 Extension (referred to as AS3 Extension or more often simply AS3) is a flexible, low-overhead mechanism for managing application-specific configurations on a BIG-IP system. AS3 uses a declarative model, meaning you provide a JSON declaration rather than a set of imperative commands. The declaration represents the configuration which AS3 is responsible for creating on a BIG-IP system. AS3 is well-defined according to the rules of JSON Schema, and declarations validate according to JSON Schema. AS3 accepts declaration updates via REST (push), reference (pull), or CLI (flat file editing).

What is this lab?
-----------------

This lab covers the utilization of BIG-IQ 8.0 for centralized management and data statistics collection. 
The F5 declarative APIs for Declarative On-boarding (DO) and Application Services 3.0 (AS3) will be utilized
to show how a newly provisioned BIG-IP can be configured completely for application delivery and security 
services with minimal effort using APIs. This process can be integrated into a CI/CD pipline enabling 
deployment and configuration of F5 services. This "infrastructure as code" format centralizes device and 
application configurations, allowing for fast deployment, maintenance and recovery of production BIG-IP
deployments.

.. toctree::
   :maxdepth: 2
   :caption: Contents:
   :glob:

   components
   module*/module*
   resources
