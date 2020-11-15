#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     system_setup.do (Wed Oct 03 21:44:20 2018)
#
#  Simulation Setup DO Script File
#
#  The Simulation Setup DO script file defines macros and
#  commands to load a design and automate the setup of
#  signal displays for viewing.
#
#  Comment or uncomment commands in the DO files below
#  to change the set of signals viewed.
#
#  xcmdc and xcmds are used by the list.do and wave.do
#  scripts for error checking (user does not set them).
#  Set xcmdc variable to 1 when 'c' command is called.
#  Set xcmds variable to 1 when 's' command is called.
#
echo  "Setting up simulation commands ..."

alias c   "do system.do; set xcmdc 1"
alias s   "vsim -novopt -t ps system_tb; set xcmds 1"
alias l   "do system_list.do"
alias w   "do system_wave.do"

alias h "
echo **********************************************************************
echo **********************************************************************
echo ***
echo ***   Simulation Setup Macros (system_setup.do)
echo ***
echo ***   c   =>  compile the design by running the EDK compile script.
echo ***           Assumes ISE and EDK libraries were compiled earlier
echo ***           for ModelSim.  (see system.do)
echo ***
echo ***   s   =>  load the design for simulation. (ModelSim 'vsim'
echo ***           command with 'system_tb') After loading the design,
echo ***           set up signal displays (optional) and run the simulation.
echo ***           (ModelSim 'run' command)
echo ***
echo ***   l   =>  set up signal list display and launch a list window.
echo ***           ModelSim 'add -list' commands are found in *_list.do
echo ***           scripts. (see system_list.do)
echo ***
echo ***   w   =>  set up signal wave display and launch a waveform window.
echo ***           ModelSim 'add -wave' commands are found in *_wave.do
echo ***           scripts. (see system_wave.do)
echo ***
echo ***   h   =>  print this message
echo ***
echo **********************************************************************
echo **********************************************************************"

h
