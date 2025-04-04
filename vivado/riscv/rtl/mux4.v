module mux4 #(parameter WIDTH = 32) (

    // PC,          OldPC,      register_output_A,      32'b0,        ALUSrcA,            SrcA

    input wire [WIDTH-1:0] d0,  // input A (selector: 00)
    input wire [WIDTH-1:0] d1,  // input B (selector: 01)
    input wire [WIDTH-1:0] d2,  // input C (selector: 10)
    input wire [WIDTH-1:0] d3,  // input D (selector: 11)
    input wire [1:0] s,         // selector signal

    output wire [WIDTH-1:0] y    // output
);

    assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0);

    // //always @*
    // always @(d0, d1, d2, d3, s)
    // begin

    //     $display("[MUX4] d0: %b, d1: %b, d2: %b, d3: %b, s: %b", d0, d1, d2, d3, s);

    //     if (s == 2'b00)
    //     begin
    //         y = d0;
    //     end
    //     else if (s == 2'b01)
    //     begin
    //         y = d1;
    //     end
    //     else if (s == 2'b10)
    //     begin
    //         y = d2;
    //     end
    //     else if (s == 2'b11)
    //     begin
    //         y = d3;
    //     end
    //     else
    //     begin
    //        y = d0;
    //     end

    // end

endmodule