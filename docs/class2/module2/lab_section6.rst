F5 WAF Tester Utility Installation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before we begin with the web application firewall (WAF)/Application Security Module portion of the lab, you will need to install the F5 WAF tester.  The F5 WAF tester is a very simple lightweight utility that you can use to test ASM policies against a range of known vulnerabilities.  

Let's minimize all current windows so we can see the desktop. Click on the WebApp Server link on the desktop.

.. image:: _media/image45b.png

You should be automatically logged in the CLI as shown below.

.. image:: _media/image51b.png

Next, install the tool using the following command: 
 
``sudo pip install git+https://github.com/f5devcentral/f5-waf-tester.git`` 

Enter the password **Agility2020Orlando!** if prompted.

.. image:: _media/image67.png

Once installed, configure the WAF tester using the following command: 

``sudo f5-waf-tester --init``

You will be asked a series of questions. Use the following values below; for all other values, leave the default value and simply press **Enter**: 

``[BIG-IP] Host []: 10.1.1.4``

``[BIG-IP] Username []: admin``

``[BIG-IP] Password []: Agility2020Orlando!``

``Virtual Server URL []: https://10.1.10.11``

With the tester configured, run the actual test with the following command: 

``sudo f5-waf-tester``

.. image:: _media/image68.png

As the failures in the output show, the Juice Shop application is quite vulnerable. 

More verbose output is viewable in the "report.json" file located in the current directory.

In the next section, we will apply a web application firewall (WAF) policy that to protect the application.