BIG-IQ Device Management
========================

The following workflows will get you familiar with the BIG-IQ for
management of BIG-IP devices specific to managing Access Policy Manager.
This course is not intented to walk through all the required steps to
implement BIG-IQ and setup logging and statistics collection. That
information can be referenced from the BIG-IQ CM Implementation Guide.
For this BIG-IQ Access lab we will proceed to general ADC management
tasks (importing a BIG-IP and managing its configuration).

WORKFLOW 1: Removing Previously Discovered devices for this LAB Exercise
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since this Self Guided Lab started with the BIG-IQ pre populated with
the BIG-IP devices for the previous exercises we must now remove some of
those devices before continuing on to the next workflow.

Navigate to the top menu Devices tab then on the left menu select BIG-IP
Devices

Place a check in the box next to BOS-vBIGIP01.termmarc.com

|image57|

Now click the Remove All Services button.

|image58|\ |image59|

You will see on the services column the services are being removed. When
it displays only Management you can perform the same steps to the second
BIG-IP device named BOS-vBIGIP02.termmarc.com

Navigate to the Devices Tab BIG-IP Clusters menu Access Groups sub-menu

Verify if the BostonAG Access Group still exists and if so do the
following task otherwise skip to next step.

a. Place a check in the box next to BOSTON and click the REMOVE button

    |image60|

Navigate to BIG-IP Clusters DSC Groups

If there are any datasync groups from either of the BOS devices shown
then click the Refresh List button and verify they are removed.

|image61|

Navigate to Devices Device Groups menu

Verify the BostonDCGroup is gone, if not place a check in the box next
to BostonDCGroup and click the Delete button.

|image62|

Navigate to Devices BIG-IP Devices

Place a check in the box next to both BOS-vBIGIP01.termmarc.com and
BOS-vBIGIP02.termmarc.com BIG-IP devices and click the Remove Devices
button and confirm.

|image63|

|image64|

The Final result should only display the west BIG-IPs like the picture
below.

|image65|

Now logon to both the BOS-vBIGIP01.termmarc.com and
BOS-vBIGIP02.termmarc.com BIG-IP devices directly and verify they are no
longer showing that they are managed by BIG-IQ.

|image66|\ |image67|

WORKFLOW 2: Importing BIG-IP devices for management and inventory (REQUIRED)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Normally these steps are preformed first however we wanted to focus
first on management and monitoring of the Access infrastructure in the
beginning of the LAB. From this point forward we will be reviewing some
of the first step of managing devices for onboarding of BIG-IP devices
and their services which they are running using the BIG-IQ is device
discovery. The basic discovery allows for device inventory, device
health monitoring, backup and restore of the managed device, integration
with F5’s iHealth service, software upgrade, and device template
deployment. As part of the discovery process, you can choose to manage
other parts of the BIG-IP configuration.

In this scenario, we will import a pair (clustered) of BIG-IP devices,
review the device information available in BIG-IQ, export our inventory
to a CSV file, and review that.

    Adding devices to BIG-IQ Inventory:

***Dependencies: ***

1. The BIG-IP device must be located in your network.

2. The BIG-IP device must be running a compatible software version.

***BIG-IP Versions***

+------------------------------+------------------------------+
| **Functional Description**   | **Minimum BIG-IP version**   |
+==============================+==============================+
| Backup/Restore               | 11.5.0 HF7                   |
+------------------------------+------------------------------+
| Upgrade - legacy devices     | 10.2.0                       |
+------------------------------+------------------------------+
| Upgrade - managed devices    | 11.5.0 HF7                   |
+------------------------------+------------------------------+
| Licensing BIG-IP VE          | 11.5.0 HF7                   |
+------------------------------+------------------------------+
| Licensing - WebSafe          | 12.0.0                       |
+------------------------------+------------------------------+
| ADC management               | 11.5.1 HF4                   |
+------------------------------+------------------------------+
| AFM                          | 11.5.2                       |
+------------------------------+------------------------------+
| Access                       | 12.1.0                       |
+------------------------------+------------------------------+
| ASM                          | 11.5.3 HF1                   |
+------------------------------+------------------------------+
| DNS                          | 12.0.0                       |
+------------------------------+------------------------------+

 

AskF5 SOL with this info:
https://support.f5.com/kb/en-us/solutions/public/14000/500/sol14592.html

1. Port 22 and 443 must be open to the BIG-IQ management address, or any
   alternative IP address used to add the BIG-IP device to the BIG-IQ
   inventory.

Big-IP Devices
^^^^^^^^^^^^^^

Adding a BIG-IP device to the BIG-IQ system inventory is the first step
to management. First, we will be adding an HA pair of devices to be
managed in BIG-IQ.

**\*\*Important-** Before you attempt to add the BIG-IP cluster
(***BOS-vBIGIP01.termmarc.com*** and ***BOS-vBIGIP02.termmarc.com***),
make sure that the devices are **‘In Sync’** from a configuration
standpoint or you will get an error when attempting to import. You will
need to access one of the devices directly to do this. Log in to either
**BOS-BIGIP** from the UDF Components page and sync the configs\ **.**

\*\*DO NOT SKIP THE ABOVE STEP\*\*

1. Log in to the BIG-IQ system with your user name (admin) and password
   (admin).

2. On the top menu bar, select **Devices** from the BIG-IQ menu.

3. On the left-hand menu bar, click **BIG-IP Devices**.

4. Click the **Add Device** button in the main pane.

   a. In the **IP Address (10.1.1.10)** field, type the IPv4 or IPv6
      address of the device.

   b. In the **User Name** and **Password** fields, type the user name
      (admin) and password (admin) for the device.

   c. Cluster Display Name: Select **Create New.**

   d. Name the cluster **BostonCluster**

   e. Leave the **‘Initiate..’** radio button checked

|image68|

1. Click the Add button to add this device to BIG-IQ.

2. BIG-IQ now exchanges certs with the BIG-IP and pops up a window for
   the administrator to select which modules to manage from BIG-IQ. For
   this device, select all services except **Fraud Protection
   Services.** Leave the Statistics monitoring boxes all checked, and
   then click the **Continue** button.

    |image69|

1. The discovery process will start and you should see a screen like
   this. At this point, BIG-IQ is using REST calls to the BIG-IP to pull
   the selected parts of the BIG-IP configuration into BIG-IQ.

|image70|

While the discovery process is happening for the first device, add the
second device to BIG-IQ:

1. Click the **Add Device** button.

   a. In the **IP Address (10.1.1.11)** field, type the IPv4 or IPv6
      address of the device.

   b. In the **User Name** and **Password** fields, type the user name
      (admin) and password (admin) for the device.

   c. Cluster Display Name: Select **Use Existing.**

   d. Select **BostonCluster** from the list of existing clusters.

   e. Leave the **‘Initiate..’** radio button checked

2. Click the Add button to add this device to BIG-IQ.

3. For this device, again, select all services except **Fraud Protection
   Services.** Leave the Statistics monitoring boxes all checked, and
   then click the **Continue** button.

Allow the import jobs to complete. At this point, the configuration of
the BIG-IPs that have been imported are not yet editable in BIG-IQ. To
make the configurations editable in BIG-IQ, we need to |image71|.

1. On the Device Inventory screen, click the |image72|\ link in the
   Services column for **BOS-vBIGIP01**. *(you may need to scroll right
   to see the services column*)

|image73|

1. In the Local Traffic (LTM) Section, select the check box for “Create
   a snapshot of the current configuration before importing” and click
   the **Import** button.

|image74|

1. Before proceeding un-check the LTM snapshot box if still checked. In
   the Access Policy (APM) Section, select the check box for “Create a
   snapshot of the current configuration before importing” and click the
   **Import** button.

|image75|

BIG-IQ Access has its own notion of device grouping called “Access
Groups” where you define a “Source Device” where configuration changes
can be made and deployed to the other devices in the Access Group.
Create a new Access Group by choosing **Create** New from the Access
Group drop-down. Then name the new group **BostonAG**, and Click the Add
button to continue.

    |image76|

1. In the Application Security (ASM) Section, select the check box for
   “Create a snapshot of the current configuration before importing” and
   click the **Import** button.

|image77|

a. In step 14, you will experience “Conflict Resolution.” A conflict is
   when an object that is already in the BIG-IQ working config has the
   same name, but different contents as an object that exists on the
   BIG-IP that is being imported. The user must select whether to keep
   the object from BIGIP or BIGIQ configuration. Storage will be updated
   accordingly. Review the differences that have been discovered as part
   of this import by clicking on each row in the difference view.

    |image78|

a. In this lab, we are going to choose to keep the version of the object
   that is already in the BIG-IQ. Click the continue button.

b. A window reminds us that these conflict resolution selections will
   not modify the configuration that is running on this BIG-IP until we
   deploy changes from BIG-IQ. Click the Resolve button to continue.

    |image79|

1. In the Advanced Firewall (AFM) Section, select the check box for
   “Create a snapshot of the current configuration before importing” and
   click the **Import** button.

|image80|

a. Again, you will experience the conflict resolution screens. Choose to
   keep the objects that are already on the BIG-IQ.

1. In the BIG-IP (DNS) Section, click the **Import** button.

|image81|

1. Click the back arrow button at the top of the section to return to
   the inventory.

   |image82|

2. Repeat steps 11-20 for BOS-vBIGIP02

|image83|

-  For the APM import, make sure to choose **Add to existing** for the
   Access Group and select the **BostonAG.** Accept any conflicts.

1. Once you have completed all of the import tasks for **BIGIP02**,
   click the arrow in the upper left of the Services panel to return to
   the device inventory screen.

   |image84|

2. Click on the **BOS-vBIGIP01.termmarc.com** device link to review the
   device Properties, Health, and Services information for the device.

   |image85|

3. Click through the Properties, Health, Statistics Collection, and
   Services tabs to review the information.

4. Click the arrow in the upper left of the Services panel to return to
   the device inventory screen.

   |image86|

5. Repeat steps 20-22 for the other devices, if you wish.

6. Click the Export Inventory button in the main pane to review the
   contents of the device inventory CSV file

7. The CSV file is automatically downloaded to your client. Launch the
   CSV file from your downloads folder. For example, in Chrome the CSV
   file will appear in the lower left.

   |image87|

8. Review the contents of the file and understand all of the information
   that is provided. The picture below shows what the exported inventory
   would look like in Microsoft Excel. The JumpBox you are using for the
   LAB does not have Excel installed so you can choose to skip the
   review of the file or use Notepad.

   |image88|

WORKFLOW 5: Automating device backups and archiving a copy of the backup file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Time to Complete: 5 min

BIG-IQ provides the ability to backup individual or groups of managed
devices on an ad-hoc or a scheduled basis. The admin can decide how long
to retain the backups on BIG-IQ and has the option of archiving a copy
of the UCS backup off to an external device for DR or deeper storage
purposes.

In this scenario, we are going to create a group of all of the devices
in our Boston data center and schedule a nightly backup that archives a
copy off to our archive for DR purposes.

First, we need to create the group for our backup schedule to reference.
We have two options in BIG-IQ: static groups, where devices are added
and removed manually and dynamic groups, where devices are selected from
a source group based on filter criteria. In this lab setup, the devices
have BOS in the name to indicate that they are in the Boston data
center. This makes the dynamic group the logical choice.

1. On the top menu bar, select **Devices** from the BIG-IQ menu.

2. Click **Device Groups** in the left-hand menu

3. Click **Create** in the main pane

4. | Complete the settings to create the group.
   | Name: **BostonDCGroup**
   | Group Type: **Dynamic**
   | Parent Group: **Root (All BIG-IP Devices)**
   | Search Filter: **BOS**

   |image89|

5. Click the **Save & Close** button to save the group.

Now, we can create our backup schedule that references this dynamic
group.

1. Click on the **Back Up & Restore** on the left-hand menu

2. Click on **Backup Schedules**

   |image90|

3. Click the **Create** button in the main page.

4. | Fill out the Backup Schedule
   | Name: **BostonNightly**
   | Local Retention Policy: **Delete local backup copy 3 days after
     creation**
   | Backup Frequency: **Daily**
   | Start Time 00:00 Eastern Standard Time

   Under Devices, select the **Groups** radio button

   | Select from the drop-down **BostonDCGroup**
   | Archive: **Store Archive Copy of Backup**
   | Location: **SCP**
   | IP Address: **10.1.10.80**
   | User name: f5
   | Password: default
   | Directory: /home/f5
   | |image91|

|image92|

1. Click **Save & Close** to save the scheduled backup job.

WORKFLOW 6: Uploading QKviews to iHealth for a support case
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

BIG-IQ can now push qkviews from managed devices to ihealth.f5.com and
provide a report of heuristic hits based on the qkview. These qkview
uploads can be performed ad-hoc or as part of a F5 support case. If a
support case is specified in the upload job, the qkview(s) will
automatically be associated/linked to the support case.

1. Navigate to **Monitoring** on the top menu bar and then to
   **REPORTS-> Device-> iHealth** -> **Configuration** on the left-hand
   menu\ **.**

   |image93|

2. Add Credentials to be used for the qkview upload and report
   retrieval. Click the Add button under Credentials.

   |image94|

3. | Fill in the credentials that you used to access
     https://ihealth.f5.com :
   | Name: **Give the credentials a name to be referenced in BIG-IQ**
   | Username: **<Username you use to access iHealth.f5.com>**
   | Password: **<Password you use to access iHealth.f5.com**>

4. Click the Test button to validate that your credentials work.

   |image95|

5. Click the **Save & Close** button in the lower right.

6. Click the **Tasks** button in the BIG-IQ iHealth menu.

   |image96|

7. Click the **QKView Upload** button to select which devices we need to
   upload QkViews from:

   |image97|

8. | Fill in the fields to upload the QkViews to iHealth.
   | Name: **QKViewUpload5346** (append the last 4 digits of your cell
     number to make this request unique)
   | Credentials: **<Select the credentials you just stored in step 5>**
   | Devices: Select **ip-10-1-1-7.us-west-2.compute.internal**

|image98|

1. Click the **Save & Close** button in the lower right. The task will
   be started immediately.

   \*Note that you can also schedule QKview uploads on a regular basis
   using the **QKView Upload Schedules** on the left menu bar

2. Click on the name of your upload job to get more details

   |image99|

3. Observe the progress of the Qkview creation, retrieval, upload,
   processing, and reporting. This operation can take some time, so you
   may want to move on to the next exercise and come back.

4. Once a job reaches the Finished status, click on the Reports menu to
   review the report.

   |image100|

5. Select the report you just created and click the **Open** hyperlink
   under the Report Column

   |image101|

6. You can also run the Upgrade Advisor from the BIG-IQ if you are
   running an older version of code. Select **Upgrade Advisor Reports**
   from the left-hand menu bar and then click the **Create** button in
   the main window pane.

7. Give your Upgrade Advisor Task a name and select the **ip-10-1-1-7**
   device. Choose your Target Version and then **Save & Close**

8. Click on the **Upgrade Advisor Reports** on the left-hand menu bar
   and your new report should show up shortly. You can see the status of
   the report generation by clicking **Tasks** on the left-hand
   menu-bar. Click on the **Target Software Version** column to view
   your results.

The End

   .. |image57| image:: images/image57.png
      :width: 6.50000in
      :height: 2.26458in
   .. |image58| image:: images/image58.png
      :width: 3.55095in
      :height: 1.12295in
   .. |image59| image:: images/image59.png
      :width: 2.77869in
      :height: 1.19931in
   .. |image60| image:: images/image60.png
      :width: 4.84426in
      :height: 1.91390in
   .. |image61| image:: images/image61.png
      :width: 6.50000in
      :height: 1.54375in
   .. |image62| image:: images/image62.png
      :width: 3.48361in
      :height: 1.43265in
   .. |image63| image:: images/image63.png
      :width: 6.50000in
      :height: 1.77569in
   .. |image64| image:: images/image64.png
      :width: 6.50000in
      :height: 2.03819in
   .. |image65| image:: images/image65.png
      :width: 6.50000in
      :height: 1.24931in
   .. |image66| image:: images/image66.png
      :width: 1.90883in
      :height: 1.11475in
   .. |image67| image:: images/image67.png
      :width: 2.24590in
      :height: 1.10238in
   .. |image68| image:: images/image68.png
      :width: 5.95902in
      :height: 3.15387in
   .. |image69| image:: images/image69.png
      :width: 4.90302in
      :height: 4.77049in
   .. |image70| image:: images/image70.png
      :width: 6.50000in
      :height: 1.25278in
   .. |image71| image:: images/image71.png
      :width: 1.60397in
      :height: 0.21872in
   .. |image72| image:: images/image71.png
      :width: 1.60397in
      :height: 0.21872in
   .. |image73| image:: images/image72.png
      :width: 6.50000in
      :height: 1.30833in
   .. |image74| image:: images/image73.png
      :width: 6.50000in
      :height: 1.04444in
   .. |image75| image:: images/image74.png
      :width: 6.50000in
      :height: 0.83611in
   .. |image76| image:: images/image75.png
      :width: 3.39984in
      :height: 0.85246in
   .. |image77| image:: images/image76.png
      :width: 6.50000in
      :height: 0.73333in
   .. |image78| image:: images/image77.png
      :width: 5.14127in
      :height: 2.46233in
   .. |image79| image:: images/image78.png
      :width: 3.51639in
      :height: 1.47646in
   .. |image80| image:: images/image79.png
      :width: 6.50000in
      :height: 0.71667in
   .. |image81| image:: images/image80.png
      :width: 6.50000in
      :height: 0.55903in
   .. |image82| image:: images/image81.png
      :width: 2.26013in
      :height: 0.93738in
   .. |image83| image:: images/image82.png
      :width: 6.50000in
      :height: 1.12500in
   .. |image84| image:: images/image81.png
      :width: 2.26013in
      :height: 0.93738in
   .. |image85| image:: images/image83.png
      :width: 4.62442in
      :height: 1.35400in
   .. |image86| image:: images/image84.png
      :width: 3.92659in
      :height: 1.02071in
   .. |image87| image:: images/image85.png
      :width: 2.45803in
      :height: 0.56243in
   .. |image88| image:: images/image86.png
      :width: 6.50000in
      :height: 1.82639in
   .. |image89| image:: images/image87.png
      :width: 4.93125in
      :height: 3.26643in
   .. |image90| image:: images/image88.png
      :width: 2.28096in
      :height: 1.23943in
   .. |image91| image:: images/image89.png
      :width: 4.59341in
      :height: 4.11475in
   .. |image92| image:: images/image90.png
      :width: 4.52576in
      :height: 1.54098in
   .. |image93| image:: images/image91.png
      :width: 5.94973in
      :height: 4.06557in
   .. |image94| image:: images/image92.png
      :width: 1.88518in
      :height: 0.92697in
   .. |image95| image:: images/image93.png
      :width: 3.62295in
      :height: 2.27173in
   .. |image96| image:: images/image94.png
      :width: 1.93125in
      :height: 1.26279in
   .. |image97| image:: images/image95.png
      :width: 1.93125in
      :height: 1.06679in
   .. |image98| image:: images/image96.png
      :width: 6.38198in
      :height: 2.57377in
   .. |image99| image:: images/image97.png
      :width: 2.82256in
      :height: 0.74991in
   .. |image100| image:: images/image98.png
      :width: 1.93125in
      :height: 1.35353in
   .. |image101| image:: images/image99.png
      :width: 6.49097in
      :height: 1.23125in
   .. |image102| image:: images/image100.png
      :width: 5.84302in
      :height: 4.64525in
