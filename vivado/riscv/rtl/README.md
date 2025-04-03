# Simulation with Icarus Verilog

```
cd C:\Users\wolfg\dev\Java\verilog_formatter\src\test\resources\verilog_samples\multi_cycle_riscv_cpu_rebuild

// sepearate instruction memory (imem) and data memory (dmem)
C:\iverilog\bin\iverilog.exe -s top_testbench -o build/aout.vvp top_testbench.v top.v riscv_multi.v datapath.v flopenr.v flopr.v regfile.v controller.v mux2.v mux3.v mux4.v alu.v extend.v imem.v dmem.v

// for data and code in a single RAM module (ram.v)
C:\iverilog\bin\iverilog.exe -s top_testbench -o build/aout.vvp top_testbench.v top.v riscv_multi.v datapath.v flopenr.v flopr.v regfile.v controller.v mux2.v mux3.v mux4.v alu.v extend.v ram.v uart_rx.v uart_tx.v aludec.v immsrcdec.v > build/iverilog_build.log

clear && C:\iverilog\bin\vvp.exe build/aout.vvp > build/verilog_log.txt

gtkwave build/aout.vcd

C:\iverilog\bin\vvp.exe build/riscv.vvp -lxt2
```

# Synthesis using Yosys

Yosys does not allow non-synthesizable items (initial-blocks, ...). So first prepare the design for synthesis:
1. controller.v - remove the initial block
2. In the top module, remove the reset port and insert a custom reset logic since the IceStick will not provide a button that can be used to reset the design
3. In ram.v, the machine code is inserted using an initial block. Remove that initial block. Make sure your machine code is inserted using the resetn block.
4. regfilve.v contains an initial block. remove it.

```
cd <your_project_folder>
mkdir build

set PATH=%PATH%;C:\Users\wolfg\Downloads\oss-cad-suite\lib\
C:\Users\wolfg\Downloads\oss-cad-suite\environment.bat

// synthesis - including top_testbench
yosys.exe -p "synth_ice40 -top top -blif build/aout.blif -json build/aout.json" top_testbench.v top.v riscv_multi.v datapath.v flopenr.v flopr.v regfile.v controller.v mux2.v mux3.v mux4.v alu.v extend.v ram.v uart_rx.v uart_tx.v aludec.v immsrcdec.v

// synthesis - without top_testbench
yosys.exe -p "synth_ice40 -top top -blif build/aout.blif -json build/aout.json" top.v riscv_multi.v datapath.v flopenr.v flopr.v regfile.v controller.v mux2.v mux3.v mux4.v alu.v extend.v ram.v uart_rx.v uart_tx.v aludec.v immsrcdec.v > build/yosys_build.log

yosys.exe -p "synth_ice40 -top top -blif build/aout.blif -json build/aout.json" top.v riscv_multi.v datapath.v flopenr.v flopr.v regfile.v controller.v mux2.v mux3.v mux4.v alu.v extend.v ram.v uart_rx.v uart_tx.v aludec.v immsrcdec.v C:\Users\wolfg\Downloads\oss-cad-suite\share\yosys\ice40\cells_sim.v

// routing
nextpnr-ice40 --hx1k --package tq144 --json build/aout.json --asc build/aout.asc --pcf icestick.pcf
nextpnr-ice40 --package hx1k --json build/aout.json --asc build/aout.asc --pcf icestick.pcf
nextpnr-ice40 --hx1k --json build/aout.json --asc build/aout.asc --pcf icestick.pcf

// quiet mode, no console output
nextpnr-ice40 --package hx1k --json build/aout.json --asc build/aout.asc --pcf icestick.pcf -q

icepack build/aout.asc build/aout.bin
iceprog -d i:0x0403:0x6010:0 build/aout.bin
```

# Lessons Learned

* Do not ever use uninitialized memory (RAM for instructions or data)! You will hunt non-existent bugs in your CPU for hours! Instead, initialize all cells to zero.
* Prevent out of bounds memory. It is possible to access a memory cell that has not been defined/reserved! You design will read undefined (x) values and it will break.
* Every if needs an else. Every switch needs a case for all possibilities. The value space has to be covered!
* Check modules using testbenches. Go bottom up. Check the lower modules first before you use them in larger modules!
* Simulation with Icarus Verilog and the synthesized design using yosys may differ from each other! It is possible to generate a design that performs correctly in simulation and fails on the hardware after flashing the bitstream! This is a huge problem!
* When writing combinational logic like this think about what are the inputs and outputs of the block. If it's an output you should only write to it if it's an input only read from it. Anything you want to read and write should be some internal signal to that block (i.e. not accessed anywhere else) and must be written first (otherwise you end up with this kind of situation with some kind of latching behaviour).
* Verilog is capable of all kinds of weird and wonderful behaviours due to it's many event regions and scheduling semantics. Don't play tricks with them it's likely to end badly as they're poorly specified and each synthesis tool will have it's own spin on how to deal with odd cases. Generally people follow a strict style guide to keep things simple and avoid issues like this and many of the possible race conditions that exist.
* yosys has horrible error output or output in general. It will output so much to the console that you can almost not see any errors or warnings! Better use Icarus Verilog first for linting. Icarus Verilog will abort when undefined signals are used for example. Such errors are completely buried by the pages of output that yosys produces.
* Only a single process should change a register. Sometimes yosys will abort the compilation if this rule is violated but sometimes it will finish without errors and output warnings instead! Pipe the output of yosys into a log file and search for all warnings for the register you are interested in! Make sure that there are no warnings!

# Errors

If nextpnr detects combinational loops, check if a value to the same register variable is set by to processes that have the same signal in their sensitivity list. (Example a reset signal is used in two different processes that set the same variable to different values)