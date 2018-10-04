Lab 1.3: Managing DNS Profiles
------------------------------

A DNS profile allows you to configure various DNS attributes that a virtual server or DNS listener object applies to DNS traffic. For example, when you enable the DNS Express feature in the DNS profile, the BIG-IP system acts as an authoritative secondary DNS server, and performs actions such as zone transfers from multiple primary DNS servers or zone transfers from the local BIND server on the BIG-IP system.

You can view the DNS profiles you manage by navigating to "Configuration > DNS > Delivery > Profiles". From there, click "Create" to setup a new one, or click on an existing profile to edit it.

**Create a DNS profile**

You create a profile to configure various DNS attributes that a virtual server or DNS listener object can apply to DNS traffic.

At the top of the screen, click Configuration, then, on the left, click "DNS > Delivery > Profiles".

The screen displays the list of profiles defined on this device.

Click "Create".

The New Profile screen opens.

Type a Name for the DNS profile: **mydnsprofile**

Select a Parent Profile from which this profile inherits settings: **/Common/dns**

|image11|

Select the options you want to override from the parent DNS profile.

These options perform the same function as they do on a BIG-IP device.

Under DNS Features, check the **Use BIND Server on BIG-IP**, and select **Disabled**.

|image12|

When your edits are complete, click Save & Close.

The system creates the new profile you specified and adds it to the list of profiles.

.. NOTE::
	 When you edit a default profile, you cannot override the parent profile settings, because default profiles do not have a parent.


.. |image11| image:: media/image12.png
   :width: 5.76250in
   :height: 4.75833in
.. |image12| image:: media/image13.png
   :width: 5.39583in
   :height: 5.36250in