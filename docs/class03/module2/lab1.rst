Lab 2.1: Troubleshooting 404
----------------------------
Connect as **paul**.

1. Select one of the application ``site40.example.com`` and turn on **Enhanced Analytics**, click on the button at the top right of the screen, and click on **Start**.

.. note:: Enhanced Analytics might be already turn on for site40.example.com

The Enhanced Analytics allows you to increase the application data visibility by collecting additional data for all, or specific, client IP addresses sending requests to the application.
Note: When this option is enabled, a banner appears at the top of the screen and highlights the application health icon in the applications list.

.. image:: ../pictures/module2/img_module2_lab1_1.png
  :align: center
  :scale: 50%

|

2. Expand the right-edge of the analytics pane to get the response code filter. Notice the current traffic only returns 200 OK.

.. image:: ../pictures/module2/img_module2_lab1_2.png
  :align: center
  :scale: 50%

|

3. Let's generate some 404 error, connect on the *Ubuntu Lamp Server* server and launch the following command:

``# /home/f5/demo-app-troubleshooting/404.sh``

4. After few seconds, the 10 404 errors are showing on the chart.

.. image:: ../pictures/module2/img_module2_lab1_3.png
  :align: center
  :scale: 50%

|

 Filter on 404 errors on right panel, this should give you only the URL that is missing as well as the pool member which is missing the content.

.. image:: ../pictures/module2/img_module2_lab1_4.png
  :align: center
  :scale: 50%
