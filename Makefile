#
# File Name Makefile
# By Evan Foss
# Date 2010.08.04
# Project 
# Microphone Amplifier
#
# Description
# This is the amplifier for the microphones used in the distortion product sources.
#
# Requirements
# Sage, PCB, gEDA & etc.
#

#
# Math Tool (you still have to type notebook() after this starts though)
MATHTOOL = sage
MATHFLAGS = 
#
# Schematic Capture
SCHTOOL = lepton-schematic
SCHFLAGS = -q
#
# Schematic Library
SCHLIB = gschlas
SCHLIBFLAGS = -e
#
# Simulation Tool
#SIMTOOL = gspiceui
#SIMFLAGS = 
SIMTOOL = gnucap
SIMFLAGS = >> graph.dat
#
# Netlist Generator
NETTOOL = gnetlist
NETFLAGS = -g spice -o 
NETDRC = -g drc2 -o drcerrors-tmp.text
#
# Graphing Tool
GRAPHTOOL = gwave2
GRAPHFLAGS = 
#
## BOM Generation tool
BOMTOOL = pcb-rnd
BOMFLAGS = -x bom

all:	
	echo "Please read the documentation before attempting any changes."
	echo "-Evan Foss"

change:
	$(SCHTOOL) $(SCHFLAGS) MicAmp_v1.sch hidden-magic.sch

#math:
#	$(MATHTOOL) $(MATHFLAGS)

#drc:
#	$(NETTOOL) $(NETDRC) MicAmp_v1.sch hidden-magic.sch

#net:	drc
#	$(NETTOOL) $(NETFLAGS) system.net MicAmp_v1.sch hidden-magic.sch
#	cat system.net

#sim:	net
#	$(SIMTOOL) $(SIMFLAGS) >> graph.dat
#	$(GRAPHTOOL) $(GRAPHFLAGS) graph.dat

pcb:	
	pcb-rnd MicAmp_v1.pcb

view:	
	$(PCBVIEW) $(PCBVIEWFLAGS) 

bom:
	$(BOMTOOL) $(BOMFLAGS) MicAmp_v1.pcb

clean:
	rm *.sch~
	rm *.net
	rm *.dat

