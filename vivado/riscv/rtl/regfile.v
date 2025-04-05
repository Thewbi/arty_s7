// RV32 register file for all 32 32-bit registers
// three ported register file
module regfile(
    input   wire            clk,    // clock
    input   wire            resetn,

    input   wire            we3,    // write enable, register a3 is written with wd3

    // read
    input   wire [4:0]      a1,     // register 1 to read (no clock tick needed)
    input   wire [4:0]      a2,     // register 2 to read (no clock tick needed)

    // write
    input   wire [4:0]      a3,     // register to write
    input   wire [31:0]     wd3,    // data value to write

    output  wire [31:0]     rd1,    // the output where the value from register a1 appears
    output  wire [31:0]     rd2//,     // the output where the value from register a2 appears
    
    // output
    //output wire [31:0]      toggle_value    // RAM toggle signal
);

    reg [31:0] rf[31:0];

    // initial
    // begin
    //     rf[ 0] <= 32'h00;
    //     rf[ 1] <= 32'h00;
    //     rf[ 2] <= 32'h00;
    //     rf[ 3] <= 32'h00;
    //     rf[ 4] <= 32'h00;
    //     rf[ 5] <= 32'h00;
    //     rf[ 6] <= 32'h00;
    //     rf[ 7] <= 32'h00;

    //     rf[ 8] <= 32'h00;
    //     rf[ 9] <= 32'h00;
    //     rf[10] <= 32'h00;
    //     rf[11] <= 32'h00;
    //     rf[12] <= 32'h00;
    //     rf[13] <= 32'h00;
    //     rf[14] <= 32'h00;
    //     rf[15] <= 32'h00;

    //     rf[16] <= 32'h00;
    //     rf[17] <= 32'h00;
    //     rf[18] <= 32'h00;
    //     rf[19] <= 32'h00;
    //     rf[20] <= 32'h00;
    //     rf[21] <= 32'h00;
    //     rf[22] <= 32'h00;
    //     rf[23] <= 32'h00;

    //     rf[24] <= 32'h00;
    //     rf[25] <= 32'h00;
    //     rf[26] <= 32'h00;
    //     rf[27] <= 32'h00;
    //     rf[28] <= 32'h00;
    //     rf[29] <= 32'h00;
    //     rf[30] <= 32'h00;
    //     rf[31] <= 32'h00;
    // end
/*
    always @(posedge clk)
    begin
        if (resetn == 0)
        begin
            rf[ 0] <= 32'h00;
            rf[ 1] <= 32'h00;
            rf[ 2] <= 32'h00;
            rf[ 3] <= 32'h00;
            rf[ 4] <= 32'h00;
            rf[ 5] <= 32'h00;
            rf[ 6] <= 32'h00;
            rf[ 7] <= 32'h00;

            rf[ 8] <= 32'h00;
            rf[ 9] <= 32'h00;
            rf[10] <= 32'h00;
            rf[11] <= 32'h00;
            rf[12] <= 32'h00;
            rf[13] <= 32'h00;
            rf[14] <= 32'h00;
            rf[15] <= 32'h00;

            rf[16] <= 32'h00;
            rf[17] <= 32'h00;
            rf[18] <= 32'h00;
            rf[19] <= 32'h00;
            rf[20] <= 32'h00;
            rf[21] <= 32'h00;
            rf[22] <= 32'h00;
            rf[23] <= 32'h00;

            rf[24] <= 32'h00;
            rf[25] <= 32'h00;
            rf[26] <= 32'h00;
            rf[27] <= 32'h00;
            rf[28] <= 32'h00;
            rf[29] <= 32'h00;
            rf[30] <= 32'h00;
            rf[31] <= 32'h00;
        end
    end
*/
    // write third port on rising edge of clock (A3/WD3/WE3)
    //
    // Note: any write to register zero is actually executed.
    // Therefore, the read operation needs to return the hardcoded zero.
    always @(posedge clk)
    begin
        if (resetn == 0)
        begin
            rf[ 0] <= 32'h00;
            rf[ 1] <= 32'h00;
            rf[ 2] <= 32'h00;
            rf[ 3] <= 32'h00;
            rf[ 4] <= 32'h00;
            rf[ 5] <= 32'h00;
            rf[ 6] <= 32'h00;
            rf[ 7] <= 32'h00;

            rf[ 8] <= 32'h00;
            rf[ 9] <= 32'h00;
            rf[10] <= 32'h00;
            rf[11] <= 32'h00;
            rf[12] <= 32'h00;
            rf[13] <= 32'h00;
            rf[14] <= 32'h00;
            rf[15] <= 32'h00;

            rf[16] <= 32'h00;
            rf[17] <= 32'h00;
            rf[18] <= 32'h00;
            rf[19] <= 32'h00;
            rf[20] <= 32'h00;
            rf[21] <= 32'h00;
            rf[22] <= 32'h00;
            rf[23] <= 32'h00;

            rf[24] <= 32'h00;
            rf[25] <= 32'h00;
            rf[26] <= 32'h00;
            rf[27] <= 32'h00;
            rf[28] <= 32'h00;
            rf[29] <= 32'h00;
            rf[30] <= 32'h00;
            rf[31] <= 32'h00;
        end
        else
        begin
            if (we3)
            begin
                $display("[regfile] WriteBack. a3=%d, wd3=0x%h", a3, wd3);
                rf[a3] <= wd3;
            end
        end
    end

    // read two ports combinationally (= no clock edge / clock tick needed)
    // (A1/RD1, A2/RD2)
    // register 0 hardwired to 0 (if a1 or a2 or both are register 0, return a hardcoded 0)
    assign rd1 = (a1 != 0) ? rf[a1] : 0;
    assign rd2 = (a2 != 0) ? rf[a2] : 0;
    
    //assign toggle_value = rf[32'h06];
    //assign toggle_value = rf[a1];

    // always @(a1, a2)
    // begin
    //     $display("[regfile output] a1: %d, rd1: %d", a1, rd1);
    //     $display("[regfile output] a2: %d, rd2: %d", a2, rd2);
    // end;

endmodule