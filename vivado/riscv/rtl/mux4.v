module mux4 #(parameter WIDTH = 32) (

    // PC,          OldPC,      register_output_A,      32'b0,        ALUSrcA,            SrcA

    // input
    input wire [WIDTH-1:0] d0,  // input A (selector: 00)
    input wire [WIDTH-1:0] d1,  // input B (selector: 01)
    input wire [WIDTH-1:0] d2,  // input C (selector: 10)
    input wire [WIDTH-1:0] d3,  // input D (selector: 11)
    input wire [1:0] s,         // selector signal

    // output
    output wire [WIDTH-1:0] y    
);

    assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0);

endmodule