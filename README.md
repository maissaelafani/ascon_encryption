# Project Description
The goal is to use the SystemVerilog hardware description language to design a circuit that encrypts a message of 256 bits using the ASCON128 algorithm. 
The project is comprehensive and also includes all the tests that were performed on each component.

For a more detailed description, please refer to the [report](RAPPORT_PCSN.pdf) attached to the project (written in French only).

# Architecture of the project
The files related to the SystemVerilog architectures are located in the "/SRC" directory. 
For this project, two associated libraries have been set up to facilitate compilation and execution: "LIB_RTL" and "LIB_BENCH".  

The testbench files are located in the "SRC/BENCH" directory. 
These files can easily be identified by their name, which follows the format xxx_tb.sv. 
Additionally, there is a directory ("SRC/RTL") that contains the files describing the architecture of the circuit for the different components.  

