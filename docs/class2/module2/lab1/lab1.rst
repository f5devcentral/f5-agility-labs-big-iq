Lab 1.1: General Views and Configuration Applications
-----------------------------------------------------
Logut of BIG-IQ and Login as **paula** with the password of **paula**

The screen lists all of your applications and current summary data about health, traffic performance and security. Use this screen to create, delete, deploy and oversee all of your applications.

Summary Bar provides summary information about your application's health, traffic and security status.
Click the elements in this area to filter or sort the application list.

- Health: Lists the number of applications at each health status.
- Traffic Performance: Lists the top 5 applications for each performance data indicator.
- Security: Lists the number of applications that have an active security alert.

Use one of the screen's filter and sort settings to isolate an application of interest, based on summary data or active alerts.

(Applications and data in the screenshots below may appear different then what you see)

.. image:: ../pictures/module1/img_module1_lab1_1.png
  :align: center
  :scale: 50%

|

Select ``site40.example.com`` to view a more detailed dashboard.

This screen displays the current health, traffic performance, security, and configuration details for an application.
Use this screen to detect application trends, to identify issues that can affect performance, and to adjust application configuration settings.

.. image:: ../pictures/module1/img_module1_lab1_3.png
  :align: center
  :scale: 50%

|

The summary bar at the top of the screen provides information about the application's health, traffic performance, security status, and alerts.
The Health area indicates the application's health status.

- The Traffic Performance area provides current information about the application's Longest Response Time, Top HTTP Transactions, and Top Connections.
- The Security area provides current information about the Web Application Security policy's protection status, the amount of malicious traffic, and the active, critical security findings.
- The alerts areas list the application's alerts. You can click See All to see a full list of the application's alerts.
- The Alert History area lists the application's five most recent alerts.
- The Active Alerts area lists the application's ongoing and most severe alerts.

Click on the **HEALTH** icon to view, or edit, the application health alert rules.

.. image:: ../pictures/module1/img_module1_lab1_9.png
  :align: center
  :scale: 100%

|

.. image:: ../pictures/module1/img_module1_lab1_4.png
  :align: center
  :scale: 50%

|

Click **Cancel** Button (bottom right)

|

The application configuration map directly below the summary bar provides information about your application's properties, client types,
network and device configuration, F5 application services, and server configuration. You can click the icons to display detailed information in the ANALYTICS and CONFIGURATION areas.

.. image:: ../pictures/module1/img_module1_lab1_5.png
  :align: center
  :scale: 50%

|

**Analytics Tab**

The ANALYTICS area displays the application's traffic data trends and events and alerts, within a selected time period.

**Tip:** You can use the arrow at the bottom right of application configuration map and summary bar to expand the Analytics area on the screen.

.. image:: ../pictures/module1/img_module1_lab1_6.png
  :align: center
  :scale: 50%

|

You can use the time settings above the chart to focus the data to a specific time period. You can also control the data refresh period and events in the charts.

.. note:: To view events and alerts in charts, ensure that the Events button is set to ON.

The charts display interactive information about the application's traffic connections, latency times, and response outcomes.
Click the menu to the left to navigate among the charts. Take the time to navigate through the different graphs.

The events and alerts are displayed as numbered icons within the charts. You can click these icons to display an information table below the chart.
You can click rows within the table to view detailed information. Click the buttons below the chart area to filter out displayed events and alerts by Category or Log Level.

Click the arrow tab to the right of the chart to expand the dimensions area.
To filter data in charts and dimensions, expand the dimensions to select specific objects listed.
Note: Certain dimensions list aggregated data. Click Enhanced Analytics to enable object data for these dimensions.

Take the time to navigate in all the different charts.

.. note:: When using the filters, do not enter the first ``/`` in your query.

.. image:: ../pictures/module1/img_module1_lab1_7.png
  :align: center
  :scale: 50%

|

**Configuration Tab**

Click CONFIGURATION to view and evaluate the settings for application properties. The Application owner can easily update the BIG-IP configuration (Virtual Server, Pool Members, etc..).

Take the time to explore all the different menus and analytics available to you and your application owners.

See a poor performing pool member?  Let your app owners have control to mark it down.

.. image:: ../pictures/module1/img_module1_lab1_8.png
  :align: center
  :scale: 50%

|

Click on the various circles in the application dashboard.  Such as **APPLICATION**, **CLIENT**, **ENVIRONMENT**, **APPLICATION SERVICES**, and **SERVERS** to review the various analytics and configurations available to administrators and application owners.
