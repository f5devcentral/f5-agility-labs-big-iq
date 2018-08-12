Class 3 - License Management 
=============================

Goal:

The following tasks will get you familiar with the BIG-IQ for managing licenses for the BIG-IP devices from BIG-IQ.

BIG-IQ has the ability to act as a license server for BIG-IP VE devices.
Using Registration Keys, this function allows customers to move VE keys
from one device to another without having to contact F5 support. A
software license is specific to F5 product services (for example,
BIG-IP® LTM®, BIG-IP APM®, and so forth), and is organized in
a \ *license pool*. Each license pool contains a specific type of
license. From BIG-IQ® Centralized Management, you can easily manage
licenses in those pools for numerous devices. That means you don't have
to log in to each individual BIG-IP VE device to activate, revoke, or
reassign a license.

BIG-IQ can manage licenses for up to 5000 BIG-IP VEs. BIG-IQ can handle
various types of pool licenses, including subscription and ELA pools, as
well as allowing the customer to create their own pool of licenses out
of individual VE keys.

Types of license pools:

There are four types of license pools. You can assign, revoke, and
reassign licenses from these pools as needed.

**Purchased Pool** - Prepaid pool of a specific number of concurrent
license grants for a single BIG-IP service, such as LTM. For example, a
purchased pool of 25 licenses for BIG-IP LTM allows you to license up to
25 concurrent BIG-IP VE systems for LTM.

**Utility Pool** - Designed for service providers, utility pools contain
licenses for BIG-IP services you grant for a specific unit of measure
(hourly, daily, monthly, or yearly).

**Volume Pool** - Prepaid subscription (1 and 3-year terms) for a fixed
number of concurrent license grants for multiple BIG-IP services.

**Registration Key Pool** - A pool of single standalone BIG-IP VE
registration keys for one or more BIG-IP services. You can revoke and
reassign a license to BIG-IP VE systems without having to contact F5 to
allow the license to be moved.

Tasks:

3.1: Add licensing base-key to BIG-IQ for consumption

3.2: Assign Pool Licensing to a device BIG-IP

This workflow demonstrates the pool based licensing capabilities:

-  The ability to import single VE registration keys.

-  The steps to allocate these keys to BIG-IP devices.

-  The ability to report on the license usage.

First, we must obtain some registration keys for use in this lab. Your lab instructor will provide the keys in a separate location.

The 4 type of license keys look like the following:

For a **Purchased Pool**:

- Registration Key : G9662-15664-31005-89034-5196190
- F5 Product           : F5-BIG\-**VEP3**-1G-4-V13-LIC-DEV

For a **Volume License Pool**:

- Registration Key : B4795-94303-19052-81065-9519921
- F5 Product           : F5-BIG-**VLSBT10G1003Y**-LIC-DEV

For a **Utility Pool**:

- Registration Key : T2990-58088-27576-27649-7411953
- F5 Product           : F5-BIG\-**MSP**-LOADV1-LIC-DEV


For a **Registration Keys Pool**:

- Registration Key : P2344-09047-04931-00126-7428473
- F5 Product           : F5-BIG\-**VE-LAB**-V13-LIC-DEV


.. toctree::
   :maxdepth: 1
   :glob:

   lab*/module*
