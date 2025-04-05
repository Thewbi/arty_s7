`timescale 1ns/1ns
//`timescale 1us/1us

module top_testbench();

    reg clk;
    // reg resetn;
    wire led_green;

    //wire ftdi_rx;
    //wire ftdi_tx;

    wire D1;
    wire D2;
    wire D3;
//    wire D4;

    // the source code is loaded in imem.v or ram.v depending on which memory concept you want to use
    top dut(
        // clock and reset
        clk,
        // resetn,
        led_green,
        //ftdi_rx,
        //ftdi_tx,
        D1,
        D2,
        D3//,
 //       D4
    );

/**/
    initial
         begin
            clk <= 0;
            //$dumpfile("build/aout.vcd");

            //$dumpvars(0, clk);
            // $dumpvars(0, resetn);
            //$dumpvars(0, dut);

            //#500 $finish();
            //#8000 $finish();
            //#32000 $finish();
         end


    // initial
    // begin

    //     //
    //     // initialize
    //     // Perform a reset
    //     //

    //     $display("");
    //     $display("-----------------------------------------------------------------");
    //     $display("[top_testbench] reset");

    //     //clk <= 0;
    //     resetn = 1'b0;

    //     #2

    //     //
    //     // Reset is over
    //     //

    //     $display("");
    //     $display("-----------------------------------------------------------------");
    //     $display("[top_testbench] reset done");

    //     resetn = 1'b1;

    // end

    // generate clock to sequence tests
    always
    begin
        $display("tick %d", $time);
        clk <= 1;
        #1;
        clk <= 0;
        #1;
    end

endmodule