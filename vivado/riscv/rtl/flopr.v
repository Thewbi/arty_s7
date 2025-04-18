// Flip Flop with reset
// on posedge of the clock, will store the value d
// on posedge of the clock, will return the current value q
module flopr #(parameter WIDTH = 32) (
    input wire clk,             // clock input
    input wire resetn,          // resetn input
    input wire [WIDTH-1:0] d,   // [in] d as in data. This is the input data
    output reg [WIDTH-1:0] q    // [out] this is the value stores in the flip flop
);

    always @(posedge clk, negedge resetn)

        if (resetn == 0)
        begin
            q <= 0;
        end
        else
        begin
            q <= d;
        end

endmodule