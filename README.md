# arty_s7
Arty S7 projects

## Examples

vivado/blinky - a LED blinking application
vivado/bt2 - using a bluetooth module which was preconfigured as a Bluetooth Classic RFCOMM server which means once a UART is attached to the module, you can send and receive serial data (byte arrays) over the UART.
vivado/vga - Using the Digilent VGA Pmod on the ARTY S7 25 without IP block.

## Block RAM using Vivado's Block Memory Generator

https://domipheus.com/blog/designing-a-risc-v-cpu-in-vhdl-part-16-arty-s7-rpu-soc-block-rams-720p-hdmi/

https://www.youtube.com/watch?v=Ag0ogQJbkSY

The Block Memory Generator can generate RAM and initialize that RAM from a file.
This will take away the burden of writing logic that places an application into the RAM without causing errors with multiple access from different processes when on process (the reset) writes the application into RAM on reset and another process writes user defined data into RAM when the design is running.

To open the Block Memory Generator, select Project Manager > IP Catalog. Type BRAM into the search box and select "Memories & Storage Elements" > RAMs & ROMs & BRAM > Block Memory Generator."

In the "Customize IP" Wizard, 
- Interface Type: Native
- check "Generate address interface with 32 bits"
- Memory: Single Port RAM

On the Tab "Other Options", select "Load Init File" > select a .coe file (see below)
Fill Remaining Locations with hex 0.

A .coe file is Vivado's COEfficient file format.
https://docs.amd.com/r/en-US/ug896-vivado-ip/Using-a-COE-File

COE files are ASCII text files describing data. This page: https://docs.amd.com/r/en-US/ug896-vivado-ip/COE-File-Examples has several examples for .coe files that initialize block ram.

For the RISCV processor, a .coe file for initiale RAM might look like this:

```
memory_initialization_radix=16;
memory_initialization_vector=
00000293,
00000313,
009893b7,
67e38393,
00728663,
00128293,
ff9ff06f,
03402303,
00134313,
02602b23,
fd9ff06f;
```
Save this file as C:\dev\fpga\arty_s7\vivado\riscv\coe\initial_bram.coe

The application consists of 11 instructions, 32bit hex each. The rest of the memory should be filled with zeros as specified in the Block Memory Generator.

Click "OK" go generate the block RAM design.

A "Generate Output Products" dialog will pop-up. Make sure "Out of context per IP" is selected. Click generate.

Vivado will place the generated Block RAM design here: c:/dev/fpga/arty_s7/vivado/riscv/riscv.srcs/sources_1/ip/blk_mem_gen_0
Vivado has generated a .xci file. 

To instantiate the BRAM, switch to the "IP Sources" tab in the Project Manager. Unfold the blk_mem_gen_0 IP. Under the "Instantiation Templates" node, you can find a .veo file. It contains a snippet of verilog code for instantiating the IP.

There is a glitch with .coe files and the simulator. When the .coe file is updated, the simulator will still use the old file. 

https://adaptivesupport.amd.com/s/question/0D52E00006iHjGmSAK/simulation-with-bram-ip-coe-file-updated-but-simulated-contents-do-not?language=en_US

To solve that issue, delete the project .sim directory [..] and also delete the project.ip_user_files directory and re-launching the sim.