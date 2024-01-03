`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2024 05:50:30 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input wire CLK12MHZ,
    input wire sw,
    output  VGA_HS,
    output  VGA_VS,
    output  [3:0] VGA_RED,
    output  [3:0] VGA_GREEN,
    output  [3:0] VGA_BLUE
    );
    
    //wire locked;
    wire  clk_25M;
    
    clk_wiz_0 clock_wizard
       (
        // Clock out ports
        .clk_out1(clk_25M),     // output clk_out1
        // Status and control signals
        //.reset(sw), // input reset
        //.locked(),       // output locked
       // Clock in ports
        .clk_in1(CLK12MHZ)      // input clk_in1
    );

// x, y coordinates
localparam CORDW = 10;
wire [CORDW-1:0] x, y;
// start of frame (pulsed HIGH on each new frame)
wire sof;
// data enable (HIGH when counters are in active pixel region)
wire de;

display_480p vga(
    .clk_pix(clk_25M),
    .rst_pix(!sw),
    .hsync(VGA_HS),
    .vsync(VGA_VS),
    .sx(x),
    .sy(y),
    .frame(sof),
    .de(de),
    .line()
);

// VGA Pmod output
//always_ff @(posedge clk_25M) begin
//always_comb begin
    assign VGA_RED   = (de && (y < 160))              ? 4'hF : 0;
    assign VGA_GREEN = (de && (y > 160 && y < 320))   ? 4'hF : 0;
    assign VGA_BLUE  = (de && (y > 320))              ? 4'hF : 0;
//end

    
endmodule
