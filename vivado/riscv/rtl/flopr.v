// Flip Flop with reset
// on posedge of the clock, will store the value d
// on posedge of the clock, will return the current value q
module flopr #(parameter WIDTH = 32) (
    //input wire [2:0] id,
    input wire clk,             // clock input
    input wire resetn,          // resetn input
    input wire [WIDTH-1:0] d,   // [in] d as in data. This is the input data
    output reg [WIDTH-1:0] q    // [out] this is the value stores in the flip flop
);

    always @(posedge clk, negedge resetn)

        if (resetn == 0)
        begin
            //$display("[FLOPR]");
            q <= 0;
        end
        else
        begin

            //$display("[FLOPR]");
/*
            if (id == 3'b000)
            begin
                $display("[FLOPR data] q:0x%08h <- d:0x%08h", q, d);
            end

            if (id == 3'b001)
            begin
                $display("[FLOPR RD1] q:0x%08h <- d:0x%08h", q, d);
            end

            if (id == 3'b010)
            begin
                $display("[FLOPR RD2] q:0x%08h <- d:0x%08h", q, d);
            end

            if (id == 3'b011)
            begin
                $display("[FLOPR ALUOut] q:0x%08h <- d:0x%08h", q, d);
            end
            */

            q <= d;
        end

endmodule