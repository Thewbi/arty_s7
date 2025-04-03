module imem(

    // input address
    input wire [31:0] a,

    // output data
    output wire [31:0] rd
);

    reg [31:0] RAM[127:0];

    initial
    begin
        //$readmemh("progmem.txt", RAM);

        RAM[32'd00] = 32'h00000293; // inita:        addi x5, x0, 0x0
        RAM[32'd04] = 32'h00000313; //               addi x6, x0, 0x0
        RAM[32'd08] = 32'h00a00393; //               addi x7, x0, 0xA
        RAM[32'd12] = 32'h0072d663; // loop_head:    bge x5, x7, 0xC     # if (x5 >= x7) jump to loop_end
        RAM[32'd16] = 32'h00128293; //               addi x5, x5, 1
        RAM[32'd20] = 32'hff9ff06f; //               jal x0, -8          # jal loop head
        RAM[32'd24] = 32'h03c02303; // loop_end:     lw x6, 60(x0)
        RAM[32'd28] = 32'h00134313; //               xori x6, x6, 1
        RAM[32'd32] = 32'h02602e23; //               sw x6, 60(x0)
        RAM[32'd36] = 32'hfddff06f; //               jal x0, -36         # jal inita

        // // # riscvtest.s
        // // # Sarah.Harris@unlv.edu
        // // # David_Harris@hmc.edu
        // // #
        // // # 27 Oct 2020
        // // # Test the RISC-V processor:
        // // # add, sub, and, or, slt, addi, lw, sw, beq, jal
        // // #
        // // # If successful, it should write the value 25 to address 100
        // // #       RISC-V Assembly         Description                 Address     Machine Code
        // RAM[32'd00] = 32'h00500113; // main:   addi x2, x0, 5          # x2 = 5                    0           00500113
        // RAM[32'd04] = 32'h00C00193; //         addi x3, x0, 12         # x3 = 12                   4           00C00193
        // RAM[32'd08] = 32'hFF718393; //         addi x7, x3, -9         # x7 = (12 - 9) = 3         8           FF718393
        // RAM[32'd12] = 32'h0023E233; //         or x4, x7, x2           # x4 = (3 OR 5) = 7         C           0023E233
        // RAM[32'd16] = 32'h0041F2B3; //         and x5, x3, x4          # x5 = (12 AND 7) = 4       10          0041F2B3
        // RAM[32'd20] = 32'h004282B3; //         add x5, x5, x4          # x5 = 4 + 7 = 11           14          004282B3
        // RAM[32'd24] = 32'h02728863; //         beq x5, x7, end         # shouldn't be taken        18          02728863
        // RAM[32'd28] = 32'h0041A233; //         slt x4, x3, x4          # x4 = (12 < 7) = 0         1C          0041A233
        // RAM[32'd32] = 32'h00020463; //         beq x4, x0, around      # should be taken           20          00020463
        // RAM[32'd36] = 32'h00000293; //         addi x5, x0, 0          # x5 = 0 shouldn't execute  24          00000293
        // RAM[32'd40] = 32'h0023A233; // around: slt x4, x7, x2          # x4 = (3 < 5) = 1          28          0023A233
        // RAM[32'd44] = 32'h005203B3; //         add x7, x4, x5          # x7 = (1 + 11) = 12        2C          005203B3
        // RAM[32'd48] = 32'h402383B3; //         sub x7, x7, x2          # x7 = (12 - 5) = 7         30          402383B3
        // RAM[32'd52] = 32'h0471AA23; //         sw x7, 84(x3)           # [96] = 7                  34          0471AA23
        // RAM[32'd56] = 32'h06002103; //         lw x2, 96(x0)           # x2 = [96] = 7             38          06002103
        // RAM[32'd60] = 32'h005104B3; //         add x9, x2, x5          # x9 = (7 + 11) = 18        3C          005104B3
        // RAM[32'd64] = 32'h008001EF; //         jal x3, end             # jump to end, x3 = 0x44    40          008001EF
        // RAM[32'd72] = 32'h00100113; //         addi x2, x0, 1          # shouldn't execute         44          00100113
        // RAM[32'd76] = 32'h00910133; // end:    add x2, x2, x9          # x2 = (7 + 18) = 25        48          00910133
        // RAM[32'd80] = 32'h0221A023; //         sw x2, 0x20(x3)         # [100] = 25                4C          0221A023
        // RAM[32'd84] = 32'h00210063; // done:   beq x2, x2, done        # infinite loop             50          00210063

        // //
        // // Harris & Harris, modified sample
        // //

        // RAM[32'd00] = 32'h00500113;  // 0x00 // addi x2(0), x0(0), 5                      x2=5
        // RAM[32'd04] = 32'h00c00193;  // 0x04 // addi x3(0), x0(0), 12                     x2=5,x3=12
        // RAM[32'd08] = 32'hFF718393;  // 0x08 // addi x7(0), x3(12), -9                     x2=5,x3=12,x7=3
        // RAM[32'd12] = 32'h0023E233;  // 0x0c // or x4(0), x7(3), x2(5)                       x2=5,x3=12,x4=7,x7=3
        // RAM[32'd16] = 32'h0041F2B3;  // 0x10 // and x5, x3(12), x4(7)                      x2=5,x3=12,x4=7,x5=4,x7=3
        // RAM[32'd20] = 32'h004282B3;  // 0x14 // add x5, x5(4), x4(7)                      x2=5,x3=12,x4=7,x5=11,x7=3
        // RAM[32'd24] = 32'h02728863;  // 0x18 // beq x5(11), x7(3), end      # should NOT be taken (11 - 3 = 8)
        // RAM[32'd28] = 32'h0041A233;  // 0x1c // slt x4, x3(12), x4(7)        # Set Less Than. rd ← rs1 < rs2 ? 1 : 0
        // RAM[32'd32] = 32'h00020463;  // 0x20 // beq x4(0), x0(0), around          # should be taken
        // RAM[32'd36] = 32'h00000293;  // 0x24 // addi x5, x0, 0
        // RAM[32'd40] = 32'h0023A233;  // 0x28 // slt x4, x7, x2
        // RAM[32'd44] = 32'h005203B3;  // 0x2C // add x7, x4, x5
        // RAM[32'd48] = 32'h402383B3;  // 0x30 // sub x7, x7, x2
        // RAM[32'd52] = 32'h00000033;  // 0x34 // add x0, x0, x0
        // RAM[32'd56] = 32'h00000033;  // 0x38 // add x0, x0, x0
        // RAM[32'd60] = 32'h005104B3;  // 0x3C // add x9, x2, x5
        // RAM[32'd64] = 32'h00000033;  // 0x40 // add x0, x0, x0
        // RAM[32'd68] = 32'h00100113;  // 0x44 // addi x2, x0, 1
        // RAM[32'd72] = 32'h00910133;  // 0x48 // add x2, x2, x9
        // RAM[32'd76] = 32'h00000033;  // 0x4C // add x0, x0, x0
        // RAM[32'd80] = 32'h00210063;  // 0x50 // beq x2, x2, done
        // RAM[32'd84] = 32'h00000000;
        // RAM[32'd88] = 32'h00000000;

        // //
        // // test
        // //

        // RAM[32'd00] = 32'h00100093; // addi x1, x0, 1           // op = 0010011
        // RAM[32'd04] = 32'h00208863; // beq x1(1), x2(0), 16     // op = 1100011
        // RAM[32'd08] = 32'h00000000;

        // //
        // // test beq
        // //

        // RAM[32'd00] = 32'h00100093; // addi x1, x0, 1           // op = 0010011
        // RAM[32'd04] = 32'h00100113; // addi x2, x0, 1           // op = 0010011
        // RAM[32'd08] = 32'hfe208ce3; // beq x1(1), x2(1), -8     // op = 1100011
        // RAM[32'd12] = 32'h00000000;
        // RAM[32'd16] = 32'h00000000;

        // //
        // // test slt - Set Less Than. rd ← rs1 < rs2 ? 1 : 0
        // //

        // RAM[32'd00] = 32'h00100093; // addi x1, x0, 1           // op = 0010011
        // RAM[32'd04] = 32'h00100113; // addi x2, x0, 1           // op = 0010011
        // RAM[32'd08] = 32'h0020a1b3; // slt x3, x1, x2           // op = 0110011
        // RAM[32'd12] = 32'h00000000;
        // RAM[32'd16] = 32'h00000000;
    end

    //assign rd = RAM[a[31:2]]; // word aligned
    assign rd = RAM[a[31:0]];

endmodule