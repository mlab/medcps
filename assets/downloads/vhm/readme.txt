*****************************************
Penn Virtual Heart Model public code V1.0\

Developed and simulated under Matlab 2009b
*****************************************
mLab Upenn, All rights Reserved.

For more details, please go to
http://mlab.seas.upenn.edu/vhm
*****************************************


This is a stable version of Matlab code of VHM, which includes:

* the heart model kernel(heart_model.m and its subfunctions)
* functional interface which generates Electrogram signals and react to pacing signals
* User interface which visualize the states and parameters, as well as viewing EGMs and deliver programmed pacing in real time.

To get started:

* Run VHM_main.m
* Click "Load model" button and choose "EP_AVNRT.mat"
* Click "Run" button to start the simulation
* You can deliver programmed pacing by opening the "Pace Panel" and view the EGM output by clicking the "View EGM" button


********************************************************************************

This package also includes a Beta version of the Simulink model

To get started:

* Run VHM_SIM_main.m