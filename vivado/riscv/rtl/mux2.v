module mux2 #(parameter WIDTH = 32) (
    input wire [WIDTH-1:0] d0,  // input A
    input wire [WIDTH-1:0] d1,  // input B
    input wire s,               // selector

    output wire [WIDTH-1:0] y   // output
);

    assign y = s ? d1 : d0;

endmodule