# Arty S7 25, Digilent PMOD without IP Block

This project produces VGA output on a Arty S7 25 using the Digilent PMOD without using an IP Block for the Digilent VGA PMod.

This project is an implementation of the strategy outlined in jugals article on element14. (https://community.element14.com/technologies/fpga-group/b/blog/posts/getting-started-with-the-arty-s7-and-the-vga-pmod-expansion-module)

## Links

Implementation strategy: https://community.element14.com/technologies/fpga-group/b/blog/posts/getting-started-with-the-arty-s7-and-the-vga-pmod-expansion-module
VGA timing generation: https://github.com/projf/projf-explore/blob/main/lib/display/display_480p.sv

## IP Blocks

IP stands for intellectual property. IP means different things in different industries.
In the Vivado-World, an IP is a closed-source block that can be selected from a library
and added to your design to perform a specific action.

Vivado provides a library of IP Blocks that can be configured using a wizard.
The wizard will generate the HDL code for the IP block and it provides an instantiation template.
That template can be copy and pasted into a HDL file to create the IP block.

There is a IP block for the VGA Pmod by Digilent readily available in Vivado.
This project uses HDL code to use the VGA Pmod since this seems a little bit more interesting than
just copy and pasting generated code.

## Strategy of using the Digilent VGA Pmod

A top.v contains all the code for this example. The example will create a red, green and a blue stripe
on a VGA monitor.

VGA at 60 Hz requires a 25.2 MHz clock (capital M for Mega, lowercase m for milli, Hz for hertz = 1 / second).

In order to generate the clock, the onboard 12Mhz clock is fed into the clocking wizard which works as a factory
and which will finally create a 25.2 Mhz clock. To create the clocking wizard, a IP Block is used and the generated 
template is copied into top.v.

Once the 25 MHz clock is available, this clock is put into the VGA timing generator.
The VGA timing generator is copied from https://github.com/projf/projf-explore/blob/main/lib/display/display_480p.sv
Pro Tip: Make sure to correctly use the reset pin so that the timing generator actually does it's work and is not 
constantly in the reset state!

The VGA timing generator does not draw anything to the screen itself. It merely generates the correct control signals 
to drive the Digilent VGA Pmod. Basically the timing generator does not feed any signals into the pins for red, green 
and blue located directly at the Digilent VGA Pmod. Feeding color signals into those pins is the task of the application
logic.

Once the VGA timing generator is in place and has the correct clock to operate, it will output signals such as the current
location of the electrom beam on the screen in the form of x and y coordinates and also a de-signal. de stands for 
data enable and this signal is asserted whenever the electron beam is inside the visiable rectangle (and not in the 
leading or trailing porch).

The user logic will check the y-coordinate and the data enable signal and draw red, green or blue color by writing
data to the pins. The logic looks like this:

```
assign VGA_RED   = (de && (y < 160))              ? 4'hF : 0;
assign VGA_GREEN = (de && (y > 160 && y < 320))   ? 4'hF : 0;
assign VGA_BLUE  = (de && (y > 320))              ? 4'hF : 0;
```

VGA_RED, VGA_GREEN and VGA_BLUE are defined in the constraints file. A constraints file assigns names to pins so that
the pins can be used inside the HDL logic.

Here are the changes to make to the constraints file:

```
# https://community.element14.com/technologies/fpga-group/b/blog/posts/getting-started-with-the-arty-s7-and-the-vga-pmod-expansion-module

## PMOD Header JC
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[0] }];
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[1] }];
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[2] }];
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { VGA_RED[3] }];
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[0] }];
set_property -dict { PACKAGE_PIN P13   IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[1] }];
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[2] }];
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { VGA_BLUE[3] }];

## PMOD Header JD
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[0] }];
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[1] }];
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[2] }];
set_property -dict { PACKAGE_PIN T12   IOSTANDARD LVCMOS33 } [get_ports { VGA_GREEN[3] }];
set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }];
set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }];
```

The PMod headers JC and JD are configured to accept the Digilent VGA pmod. This means, you have
to plug in the pmod into the headers JC and JD. The headers are marked on the silk screen 
on the ARTY S7 PCB, so you can easily identify headers JC and JD.

This is all you have to know about this example.
If this exampe does not work on your monitor, maybe try a second VGA monitor. Sometimes
monitors are really picky on what signals they want to accept.

## Configuring the clocking wizard

The clocking wizard is an IP block that can be configured using the clocking wizard dialog 
inside Vivado. The only approach that worked for me without any errors is to enable the 
12 MHz clock using the constraints file:

```
## Clock Signals
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { CLK12MHZ }]; #IO_L13P_T2_MRCC_15 Sch=uclk
create_clock -add -name sys_clk_pin -period 83.333 -waveform {0 41.667} [get_ports { CLK12MHZ }];
```

Then in the configuration dialog of the clocking wizard, use the 12 Mhz clock as an input.
As an output clock, specify a 25.200 Mhz clock and use this clock as the clock for the VGA timing generation.

A video on how to use the configuration dialog is here: https://www.youtube.com/watch?v=ngkpvMaNapA

## Next steps

This example directly places signals onto the pins using combinational logic. This is not
feasable for a comfortable usage of VGA. To use VGA in a flexible way, one possible approach
is to have a framebuffer which is basically an array of color information which is the same
size as the VGA resolution used. The application writes color data into the buffer and 
the data is feed into the VGA Pmod based on the x and y signals that the VGA signal generation 
outputs.

An extended version of the frame buffer approach is to use double buffering to prevent flicker
and screen tearing. The application draws into the deactivated buffer which the active buffer
is drawn for the current frame. Once the frame has been drawn, the buffers are switched.

Using this approach, the VGA signals are always in a complete ready state and the buffer
is not modified and output to the screen at the same time which prevents artifacts from occuring.


