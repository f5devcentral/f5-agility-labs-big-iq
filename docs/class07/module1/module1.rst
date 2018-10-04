Module 1: Network Security Managing Rules and Rule Lists
========================================================

Network firewalls use rules and rule lists to specify traffic-handling actions. The network software
compares IP packets to the criteria specified in rules. If a packet matches the criteria, then the system
takes the action specified by the rule. If a packet does not match any rule from the list, the software
accepts the packet or passes it to the next rule or rule list. For example, the system compares the packet
to self IP rules if the packet is destined for a network associated with a self IP address that has firewall rules defined.
Rule lists are containers for rules, which are run in the order they appear in their assigned rule list. A rule
list can contain thousands of ordered rules, but cannot be nested inside another rule list. You can reorder rules in a given rule list at any time.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
