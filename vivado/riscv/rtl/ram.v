module ram(

    // input
    input wire clk,
//    input wire resetn,

    input wire we, // write enable
    input wire [31:0] a, // read/write address
    input wire [31:0] wd, // write data

    // output
    output wire [31:0] rd//, // data read from memory
//    output reg [31:0] toggle_value
);

    // initial
    // begin
    //     $monitor("[RAM] WriteEnable: %d, Address: 0x%08h, WriteData: 0x%08h, ReadData: 0x%08h", we, a, wd, rd);
    // end

    //reg [31:0] RAM[127:0];
    reg [31:0] RAM[64:0];

/*
    always @(posedge clk, negedge resetn)
    begin
        if (resetn == 0)
        begin

            // RAM[32'd00] = 32'h00000000;
            // RAM[32'd04] = 32'h00000000;
            // RAM[32'd08] = 32'h00000000;
            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;

            // RAM[32'd60] = 32'h00000000;
            // RAM[32'd64] = 32'h00000000;
            // RAM[32'd68] = 32'h00000000;
            // RAM[32'd72] = 32'h00000000;
            // RAM[32'd76] = 32'h00000000;

            // RAM[32'd80] = 32'h00000000;
            // RAM[32'd84] = 32'h00000000;
            // RAM[32'd88] = 32'h00000000;
            // RAM[32'd92] = 32'h00000000;
            // RAM[32'd96] = 32'h00000000;

            // RAM[32'd100] = 32'h00000000;
            // RAM[32'd104] = 32'h00000000;
            // RAM[32'd108] = 32'h00000000;
            // RAM[32'd112] = 32'h00000000;
            // RAM[32'd116] = 32'h00000000;

            // RAM[32'd120] = 32'h00000000;
            // RAM[32'd124] = 32'h00000000;




            // lui test - load the value 0x0098967e == 9.999.998

            // RAM[32'd00] = 32'h009893b7; // lui x7, 2441 (0x989). 2441 is sign extended to 20 bits, then shifted left by 12. 0x989 << 12 = 0x989000. [regfile] WriteBack. a3= 7, wd3=0x00989000
            // RAM[32'd04] = 32'h67e38393; // addi x7, x7, 1662 (0x67E) --> writeback: [regfile] WriteBack. a3= 7, wd3=0x0098967e
            // RAM[32'd08] = 32'h00000000;
            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;

            // RAM[32'd60] = 32'h00000000;
            // RAM[32'd64] = 32'h00000000;
            // RAM[32'd68] = 32'h00000000;
            // RAM[32'd72] = 32'h00000000;
            // RAM[32'd76] = 32'h00000000;

            // RAM[32'd80] = 32'h00000000;
            // RAM[32'd84] = 32'h00000000;
            // RAM[32'd88] = 32'h00000000;
            // RAM[32'd92] = 32'h00000000;
            // RAM[32'd96] = 32'h00000000;

            // RAM[32'd100] = 32'h00000000;
            // RAM[32'd104] = 32'h00000000;
            // RAM[32'd108] = 32'h00000000;
            // RAM[32'd112] = 32'h00000000;
            // RAM[32'd116] = 32'h00000000;

            // RAM[32'd120] = 32'h00000000;
            // RAM[32'd124] = 32'h00000000;





            // this application loops forever and toggles a bit in the memory cell 60d = 0x3C every 9999999 iterations.
            // use godbolt (https://godbolt.org/) to compile this using a riscv 32bit gcc

            // // 9.999.998
            // RAM[32'd00] = 32'h00000293; // inita:        addi x5, x0, 0x0
            // RAM[32'd04] = 32'h00000313; //               addi x6, x0, 0x0
            // RAM[32'd08] = 32'h009893b7; //               lui x7, 2441
            // RAM[32'd12] = 32'h67e38393; //               addi x7, x15, 1662
            // RAM[32'd16] = 32'h00728663; // loop_head:    beq x5, x7, 0xC     # if (x5 == x7) jump to loop_end

            // RAM[32'd20] = 32'h00128293; //               addi x5, x5, 1
            // RAM[32'd24] = 32'hff9ff06f; //               jal x0, -8          # jal loop head
            // RAM[32'd28] = 32'h03c02303; // loop_end:     lw x6, 60(x0)
            // RAM[32'd32] = 32'h00134313; //               xori x6, x6, 1
            // RAM[32'd36] = 32'h02602e23; //               sw x6, 60(x0)

            // RAM[32'd40] = 32'hfd9ff06f; //               jal x0, -36         # jal inita


            // // Application

            // // set memory cell 60dec to 0x00 instead of 0xAB
            // // loop 999.999 times before toggle

            // // 00000293
            // // 00000313
            // // 000f43b7
            // // 23f38393
            // // 00728663
            // // 00128293
            // // ff9ff06f
            // // 03c02303
            // // 00134313
            // // 02602e23
            // // fd9ff06f

//            RAM[32'd00] = 32'h00000293; // inita:        addi x5, x0, 0x0
//            RAM[32'd04] = 32'h00000313; //               addi x6, x0, 0x0
//            RAM[32'd08] = 32'h000f43b7; //               lui x7, 244/0xf4
//            RAM[32'd12] = 32'h23f38393; //               addi x7, x7, 575/0x23f
//            RAM[32'd16] = 32'h00728663; // loop_head:    beq x5, x7, 0x0C     # if (x5 == x7) jump to loop_end

//            RAM[32'd20] = 32'h00128293; //               addi x5, x5, 1
//            RAM[32'd24] = 32'hff9ff06f; //               jal x0, -8          # jal loop head
//            RAM[32'd28] = 32'h03402303; // loop_end:     lw x6, 52(x0)
//            RAM[32'd32] = 32'h00134313; //               xori x6, x6, 1
//            RAM[32'd36] = 32'h02602a23; //               sw x6, 52(x0)

//            RAM[32'd40] = 32'hfd9ff06f; //               jal x0, -36         # jal inita
//            RAM[32'd44] = 32'h00000000;
//            RAM[32'd48] = 32'h00000000;
//            RAM[32'd52] = 32'h00000000; // toggle here.
//            RAM[32'd56] = 32'h00000000;






//            // Application
//            // loop 2 times

//            RAM[32'h00] = 32'h00000293; // 0x00 inita:        addi x5, x0, 0x0
//            RAM[32'h04] = 32'h00000313; // 0x04              addi x6, x0, 0x0
//            RAM[32'h08] = 32'h000003b7; // 0x08              lui x7, 0
//            RAM[32'h0C] = 32'h00238393; // 0x0C              addi x7, x7, 2
//            RAM[32'h10] = 32'h00728663; // 0x10 loop_head:    beq x5, x7, 12/0xC     # if (x5 == x7) jump to loop_end (pc relative jump of +12 bytes)

//            RAM[32'h14] = 32'h00128293; // 0x14              addi x5, x5, 1
//            RAM[32'h18] = 32'hff9ff06f; // 0x18               jal x0, -8          # jal loop head (pc relative jump back -8 bytes)
//            //RAM[32'h1C] = 32'h03c02303; // 0x1C loop_end:     lw x6, 60(x0)
//            RAM[32'h1C] = 32'h03402303; // 0x1C loop_end:     lw x6, 52(x0)
//            RAM[32'h20] = 32'h00134313; // 0x20              xori x6, x6, 1
//            RAM[32'h24] = 32'h02602a23; // 0x24              sw x6, 52(x0)

//            RAM[32'h28] = 32'hfd9ff06f; // 0x28              jal x0, -40         # jal inita (pc relative, -40 bytes back to the beginning of the appplication)
//            RAM[32'h2C] = 32'h00000000; // 0x2C
//            RAM[32'h30] = 32'h00000000; // 0x30
//            RAM[32'h34] = 32'h00000000; // toggle here.
//            RAM[32'h38] = 32'h00000000;





            // // addi test
            // //
            // // expected result
            // // [regfile] WriteBack. a3= 5, wd3=0x00000015
            // // [regfile] WriteBack. a3= 5, wd3=0x00000016
            // // [regfile] WriteBack. a3= 5, wd3=0x00000017

            // RAM[32'd00] = 32'h01500293; // 0x00   addi x5, x0, 0x15 (0x15 = 21d)
            // RAM[32'd04] = 32'h01600293; // 0x04   addi x5, x0, 0x16 (0x16 = 22d)
            // RAM[32'd08] = 32'h01700293; // 0x08   addi x5, x0, 0x17 (0x17 = 23d)
            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;





            // // lui test
            // //
            // // Expected result in verilog_log.txt:
            // // [regfile] WriteBack. a3= 7, wd3=0x00000015
            // // [regfile] WriteBack. a3= 7, wd3=0x00000016
            // // [regfile] WriteBack. a3= 7, wd3=0x00000017

            // RAM[32'd00] = 32'h000153b7; // 0x00   lui x7, 0x15 (0x15 = 21d)
            // RAM[32'd04] = 32'h000163b7; // 0x04   lui x7, 0x16 (0x16 = 22d)
            // RAM[32'd08] = 32'h000173b7; // 0x08   lui x7, 0x17 (0x17 = 23d)
            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;





            // // lw test
            // //
            // // Expected result in verilog_log.txt:
            // // [regfile] WriteBack. a3= 6, wd3=0x000000ab
            // // [regfile] WriteBack. a3= 5, wd3=0x00000004

            // RAM[32'd00] = 32'h03c02303; // 0x00                 lw x6, 60(x0)
            // RAM[32'd04] = 32'h00400293; // 0x04 inita:          addi x5, x0, 0x4
            // RAM[32'd08] = 32'h00000000;
            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;





            // // store word test (sw)
            // //
            // // Expected result in verilog_log.txt:
            // // [regfile] WriteBack. a3= 6, wd3=0x00000004
            // // [RAM] Writing wd: 0x4, address: 0x3c

            // RAM[32'd00] = 32'h00400313; // 0x00                 addi x6, x0, 4
            // RAM[32'd04] = 32'h02602e23; // 0x04                 sw x6, 60(x0)    (60dec == 3C)
            // RAM[32'd08] = 32'h00000000;
            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;










            // // beq test - case: branch is taken (because x5 == x7)
            // //
            // // addi x5, x0, 0x03
            // // addi x7, x0, 0x03
            // // beq  x5, x7, 0x56
            // //
            // // Expected: PC jumps from 0x08 to 0x08 + 0x56 = 0x5E because this is a PC relative jump!
            // // Check with GTKWave.
            // //
            // // Expected result in verilog_log.txt contains:
            // //
            // // [regfile] WriteBack. a3= 5, wd3=0x00000003
            // // [regfile] WriteBack. a3= 7, wd3=0x00000003
            // // [flopenr CurrPC] q:0x0000000c <- d:0x0000005e (0x5e is the correct target address because it is PC relative and the PC is 8 at the time with an offset of 0x56 yields 0x5e)

            // RAM[32'd00] = 32'h00300293; // 0x00   addi x5, x0, 0x03
            // RAM[32'd04] = 32'h00300393; // 0x04   addi x7, x0, 0x03
            // RAM[32'd08] = 32'h04728b63; // 0x08   beq  x5, x7, 0x56 = 86dec

            // // RAM[32'd00] = 32'h04728b63; // 0x08   beq  x5, x7, 0x56 = 86dec
            // // RAM[32'd04] = 32'h00000000;
            // // RAM[32'd08] = 32'h00000000;

            // RAM[32'd12] = 32'h00000000;
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;







            // // beq test - case: branch is NOT taken (because x5 != x7)
            // //
            // // addi x5, x0, 0x05
            // // addi x7, x0, 0x03
            // // beq  x5, x7, 0x56
            // //
            // // Expected: PC jumps from 0x08 to 0x0C. Check with GTKWave.
            // //
            // // [regfile] WriteBack. a3= 5, wd3=0x00000005
            // // [regfile] WriteBack. a3= 7, wd3=0x00000003
            // // [regfile] WriteBack. a3= 5, wd3=0x00000011
            // //

            // RAM[32'd00] = 32'h00500293; // 0x00   addi x5, x0, 0x05
            // RAM[32'd04] = 32'h00300393; // 0x04   addi x7, x0, 0x03
            // RAM[32'd08] = 32'h04728b63; // 0x08   beq  x5, x7, 0x56 (0x56 == 86dec) (BRANCH IS NOT TAKEN)
            // RAM[32'd12] = 32'h01100293; // 0x0C   addi x5, x0, 17 (17 == 0x11)
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;



            // // JAL Jump and Link test - ff9ff06f

            // // expected:
            // // endless loop of:
            // // [regfile] WriteBack. a3= 5, wd3=0x00000005
            // // [regfile] WriteBack. a3= 7, wd3=0x00000003
            // // [flopenr CurrPC] q:0x0000000c <- d:0x00000000
            // //
            // // In GTKWave the PC should never to the value 0x0C = 12dec
            // // It should go to 8 and jump back to 0
            // //

            // RAM[32'd00] = 32'h00500293; // 0x00   addi x5, x0, 0x05
            // RAM[32'd04] = 32'h00300393; // 0x04   addi x7, x0, 0x03
            // RAM[32'd08] = 32'hff9ff06f; // 0x08   jal x0, -8
            // RAM[32'd12] = 32'h01100293; // 0x0C   addi x5, x0, 17 (17 == 0x11)
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;





            // // xori test

            // // expected:
            // // [regfile] WriteBack. a3= 6, wd3=0x00000001
            // // [regfile] WriteBack. a3= 6, wd3=0x00000000
            // // [regfile] WriteBack. a3= 6, wd3=0x00000001
            // // [regfile] WriteBack. a3= 5, wd3=0x00000011
            // //
            // RAM[32'd00] = 32'h00134313; // 0x00   xori x6, x6, 1
            // RAM[32'd04] = 32'h00134313; // 0x04   xori x6, x6, 1
            // RAM[32'd08] = 32'h00134313; // 0x08   xori x6, x6, 1
            // RAM[32'd12] = 32'h01100293; // 0x0C   addi x5, x0, 17 (17 == 0x11)
            // RAM[32'd16] = 32'h00000000;

            // RAM[32'd20] = 32'h00000000;
            // RAM[32'd24] = 32'h00000000;
            // RAM[32'd28] = 32'h00000000;
            // RAM[32'd32] = 32'h00000000;
            // RAM[32'd36] = 32'h00000000;

            // RAM[32'd40] = 32'h00000000;
            // RAM[32'd44] = 32'h00000000;
            // RAM[32'd48] = 32'h00000000;
            // RAM[32'd52] = 32'h00000000;
            // RAM[32'd56] = 32'h00000000;





            //RAM[32'd60] = 32'h000000AB; // this memory cell is toggled between 1 and 0 every 9999999 iterations

            // RAM[32'd60] = 32'h00000001;
            // RAM[32'd64] = 32'h00000000;
            // RAM[32'd68] = 32'h00000000;
            // RAM[32'd72] = 32'h00000000;
            // RAM[32'd76] = 32'h00000000;

            // RAM[32'd80] = 32'h00000000;
            // RAM[32'd84] = 32'h00000000;
            // RAM[32'd88] = 32'h00000000;
            // RAM[32'd92] = 32'h00000000;
            // RAM[32'd96] = 32'h00000000;

            // RAM[32'd100] = 32'h00000000;
            // RAM[32'd104] = 32'h00000000;
            // RAM[32'd108] = 32'h00000000;
            // RAM[32'd112] = 32'h00000000;
            // RAM[32'd116] = 32'h00000000;

            // RAM[32'd120] = 32'h00000000;
            // RAM[32'd124] = 32'h00000000;
        end
    end
*/
    always @(posedge clk)
    begin
        if (we)
        begin
            $display("[RAM] Writing wd: 0x%0h, address: 0x%0h", wd, a[31:0]);
            RAM[a[31:0]] <= wd;
        end
    end

    // RAM read must be immediate, combinatorial without clock!!!!!!!!!
    assign rd = RAM[a[31:0]];

/*
    always @(posedge clk)
    begin
        //rd = RAM[a[31:0]];
        //rd = RAM[32'b0];
        toggle_value = RAM[32'd60]; // memory mapped I/O for the green LED
        //$display("[RAM] WriteEnable: %d, Address: 0x%08h, WriteData: 0x%08h, ReadData: 0x%08h", we, a, wd, rd);
    end
*/

    // initial
    // begin
    //     //$readmemh("progmem.txt", RAM);

    //     // // lui test
    //     // RAM[32'd00] = 32'h009893b7; //               lui x7, 2441
    //     // RAM[32'd04] = 32'h00000000;
    //     // RAM[32'd08] = 32'h00000000;
    //     // RAM[32'd12] = 32'h00000000;

    //     // // xori test
    //     // RAM[32'd00] = 32'h00134313; //               xori x6, x6, 1 == x6 = x6 ^ 1
    //     // RAM[32'd04] = 32'h00134313;
    //     // RAM[32'd08] = 32'h00134313;
    //     // RAM[32'd12] = 32'h00000000;

    //     // // this application loops forever and toggles a bit in the memory cell 60d = 0x3C every 3 iterations.
    //     // // use godbolt (https://godbolt.org/) to compile this using a riscv 32bit gcc
    //     // //
    //     // // Validation: Register x6 (index 6) is constantly toggled between 0 and 1
    //     // RAM[32'd00] = 32'h00000293; // inita:        addi x5, x0, 0x0
    //     // RAM[32'd04] = 32'h00000313; //               addi x6, x0, 0x0
    //     // RAM[32'd08] = 32'h000003b7; //               lui x7, 0
    //     // RAM[32'd12] = 32'h00338393; //               addi x7, x7, 3
    //     // RAM[32'd16] = 32'h00728663; // loop_head:    beq x5, x7, 0xC     # if (x5 == x7) jump to loop_end
    //     // RAM[32'd20] = 32'h00128293; //               addi x5, x5, 1
    //     // RAM[32'd24] = 32'hff9ff06f; //               jal x0, -8          # jal loop head
    //     // RAM[32'd28] = 32'h03c02303; // loop_end:     lw x6, 60(x0)
    //     // RAM[32'd32] = 32'h00134313; //               xori x6, x6, 1
    //     // RAM[32'd36] = 32'h02602e23; //               sw x6, 60(x0)
    //     // RAM[32'd40] = 32'hfd9ff06f; //               jal x0, -36         # jal inita
    //     // RAM[32'd44] = 32'h00000000;
    //     // RAM[32'd48] = 32'h00000000;
    //     // RAM[32'd52] = 32'h00000000;
    //     // RAM[32'd56] = 32'h00000000;
    //     // RAM[32'd60] = 32'h00000000;

    //     // this application loops forever and toggles a bit in the memory cell 60d = 0x3C every 9999999 iterations.
    //     // use godbolt (https://godbolt.org/) to compile this using a riscv 32bit gcc
    //     RAM[32'd00] = 32'h00000293; // inita:        addi x5, x0, 0x0
    //     RAM[32'd04] = 32'h00000313; //               addi x6, x0, 0x0
    //     RAM[32'd08] = 32'h009893b7; //               lui x15, 2441
    //     RAM[32'd12] = 32'h67e38393; //               addi x15, x15, 1662
    //     RAM[32'd16] = 32'h00728663; // loop_head:    beq x5, x7, 0xC     # if (x5 == x7) jump to loop_end
    //     RAM[32'd20] = 32'h00128293; //               addi x5, x5, 1
    //     RAM[32'd24] = 32'hff9ff06f; //               jal x0, -8          # jal loop head
    //     RAM[32'd28] = 32'h03c02303; // loop_end:     lw x6, 60(x0)
    //     RAM[32'd32] = 32'h00134313; //               xori x6, x6, 1
    //     RAM[32'd36] = 32'h02602e23; //               sw x6, 60(x0)
    //     RAM[32'd40] = 32'hfd9ff06f; //               jal x0, -36         # jal inita
    //     RAM[32'd44] = 32'h00000000;
    //     RAM[32'd48] = 32'h00000000;
    //     RAM[32'd52] = 32'h00000000;
    //     RAM[32'd56] = 32'h00000000;
    //     RAM[32'd60] = 32'h00000000;

    //     // // # riscvtest.s
    //     // // # Sarah.Harris@unlv.edu
    //     // // # David_Harris@hmc.edu
    //     // // #
    //     // // # 27 Oct 2020
    //     // // # Test the RISC-V processor:
    //     // // # add, sub, and, or, slt, addi, lw, sw, beq, jal
    //     // // #
    //     // // # If successful, it should write the value 25 to address 100
    //     // // #       RISC-V Assembly         Description                 Address     Machine Code
    //     // RAM[32'd00] = 32'h00500113; // main:   addi x2, x0, 5          # x2 = 5                    0           00500113
    //     // RAM[32'd04] = 32'h00C00193; //         addi x3, x0, 12         # x3 = 12                   4           00C00193
    //     // RAM[32'd08] = 32'hFF718393; //         addi x7, x3, -9         # x7 = (12 - 9) = 3         8           FF718393
    //     // RAM[32'd12] = 32'h0023E233; //         or x4, x7, x2           # x4 = (3 OR 5) = 7         C           0023E233
    //     // RAM[32'd16] = 32'h0041F2B3; //         and x5, x3, x4          # x5 = (12 AND 7) = 4       10          0041F2B3
    //     // RAM[32'd20] = 32'h004282B3; //         add x5, x5, x4          # x5 = 4 + 7 = 11           14          004282B3
    //     // RAM[32'd24] = 32'h02728863; //         beq x5, x7, end         # shouldn't be taken        18          02728863
    //     // RAM[32'd28] = 32'h0041A233; //         slt x4, x3, x4          # x4 = (12 < 7) = 0         1C          0041A233
    //     // RAM[32'd32] = 32'h00020463; //         beq x4, x0, around      # should be taken           20          00020463
    //     // RAM[32'd36] = 32'h00000293; //         addi x5, x0, 0          # x5 = 0 shouldn't execute  24          00000293
    //     // RAM[32'd40] = 32'h0023A233; // around: slt x4, x7, x2          # x4 = (3 < 5) = 1          28          0023A233
    //     // RAM[32'd44] = 32'h005203B3; //         add x7, x4, x5          # x7 = (1 + 11) = 12        2C          005203B3
    //     // RAM[32'd48] = 32'h402383B3; //         sub x7, x7, x2          # x7 = (12 - 5) = 7         30          402383B3
    //     // RAM[32'd52] = 32'h0471AA23; //         sw x7, 84(x3)           # [96] = 7                  34          0471AA23
    //     // RAM[32'd56] = 32'h06002103; //         lw x2, 96(x0)           # x2 = [96] = 7             38          06002103
    //     // RAM[32'd60] = 32'h005104B3; //         add x9, x2, x5          # x9 = (7 + 11) = 18        3C          005104B3
    //     // RAM[32'd64] = 32'h008001EF; //         jal x3, end             # jump to end, x3 = 0x44    40          008001EF
    //     // RAM[32'd68] = 32'h00100113; //         addi x2, x0, 1          # shouldn't execute         44          00100113
    //     // RAM[32'd72] = 32'h00910133; // end:    add x2, x2, x9          # x2 = (7 + 18) = 25        48          00910133
    //     // RAM[32'd76] = 32'h0221A023; //         sw x2, 0x20(x3)         # [100] = 25                4C          0221A023
    //     // RAM[32'd80] = 32'h00210063; // done:   beq x2, x2, done        # infinite loop             50          00210063

    //     // //
    //     // // Harris & Harris, modified sample (Contains only instructions that can be executed by the CPU right now)
    //     // //
    //     // // Validation: you want to see this sequence:
    //     // // h00500113 h00c00193 hFF718393 h0023E233 h0041F2B3 h004282B3 h02728863 h0041A233 h00020463
    //     // // then instruction h00000293 is skipped by the beq and not executed
    //     // // h0023A233 h005203B3 h402383B3 h00000033 h00000033 h005104B3 h00000033 h00100113 h00910133 h00000033 h00210063
    //     // // then there is an endless loop of h00210063
    //     // //

    //     // RAM[32'd00] = 32'h00500113;  // 0x00 // addi x2(0), x0(0), 5            # x2=5
    //     // RAM[32'd04] = 32'h00c00193;  // 0x04 // addi x3(0), x0(0), 12           # x2=5,x3=12
    //     // RAM[32'd08] = 32'hFF718393;  // 0x08 // addi x7(0), x3(12), -9          # x2=5,x3=12,x7=3
    //     // RAM[32'd12] = 32'h0023E233;  // 0x0c // or x4(0), x7(3), x2(5)          # x2=5,x3=12,x4=7,x7=3
    //     // RAM[32'd16] = 32'h0041F2B3;  // 0x10 // and x5, x3(12), x4(7)           # x2=5,x3=12,x4=7,x5=4,x7=3
    //     // RAM[32'd20] = 32'h004282B3;  // 0x14 // add x5, x5(4), x4(7)            # x2=5,x3=12,x4=7,x5=11,x7=3
    //     // RAM[32'd24] = 32'h02728863;  // 0x18 // beq x5(11), x7(3), end          # should NOT be taken (11 - 3 = 8)
    //     // RAM[32'd28] = 32'h0041A233;  // 0x1c // slt x4, x3(12), x4(7)           # Set Less Than. rd ← rs1 < rs2 ? 1 : 0
    //     // RAM[32'd32] = 32'h00020463;  // 0x20 // beq x4(0), x0(0), around        # should be taken. x4 is 0, x0 is 0
    //     // RAM[32'd36] = 32'h00000293;  // 0x24 // addi x5, x0, 0                  # not executed
    //     // RAM[32'd40] = 32'h0023A233;  // 0x28 // around: slt x4, x7(3), x2(5)    # Set Less Than. rd ← rs1 < rs2 ? 1 : 0
    //     // RAM[32'd44] = 32'h005203B3;  // 0x2C // add x7, x4(1), x5(11)           # x7 = x4 + x5 = 1 + 11 = 12
    //     // RAM[32'd48] = 32'h402383B3;  // 0x30 // sub x7, x7, x2
    //     // RAM[32'd52] = 32'h00000033;  // 0x34 // add x0, x0, x0
    //     // RAM[32'd56] = 32'h00000033;  // 0x38 // add x0, x0, x0
    //     // RAM[32'd60] = 32'h005104B3;  // 0x3C // add x9, x2, x5
    //     // RAM[32'd64] = 32'h00000033;  // 0x40 // add x0, x0, x0
    //     // RAM[32'd68] = 32'h00100113;  // 0x44 // addi x2, x0, 1
    //     // RAM[32'd72] = 32'h00910133;  // 0x48 // add x2, x2, x9
    //     // RAM[32'd76] = 32'h00000033;  // 0x4C // add x0, x0, x0
    //     // RAM[32'd80] = 32'h00210063;  // 0x50 // done: beq x2, x2, done
    //     // RAM[32'd84] = 32'h00000000;
    //     // RAM[32'd88] = 32'h00000000;

    //     // //
    //     // // test
    //     // //

    //     // RAM[32'd00] = 32'h00100093; // addi x1, x0, 1           // op = 0010011
    //     // RAM[32'd04] = 32'h00208863; // beq x1(1), x2(0), 16     // op = 1100011
    //     // RAM[32'd08] = 32'h00000000;

    //     // //
    //     // // test beq
    //     // //

    //     // RAM[32'd00] = 32'h00100093; // addi x1, x0, 1           // op = 0010011
    //     // RAM[32'd04] = 32'h00100113; // addi x2, x0, 1           // op = 0010011
    //     // RAM[32'd08] = 32'hfe208ce3; // beq x1(1), x2(1), -8     // op = 1100011
    //     // RAM[32'd12] = 32'h00000000;
    //     // RAM[32'd16] = 32'h00000000;

    //     // //
    //     // // test slt - Set Less Than. rd ← rs1 < rs2 ? 1 : 0
    //     // //

    //     // RAM[32'd00] = 32'h00100093; // addi x1, x0, 1           // op = 0010011
    //     // RAM[32'd04] = 32'h00100113; // addi x2, x0, 1           // op = 0010011
    //     // RAM[32'd08] = 32'h0020a1b3; // slt x3, x1, x2           // op = 0110011
    //     // RAM[32'd12] = 32'h00000000;
    //     // RAM[32'd16] = 32'h00000000;
    // end

endmodule