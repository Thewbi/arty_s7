// flip flop with enable and reset
module flopenr #(parameter WIDTH = 32) (

    // clock and reset
    input wire clk,
    input wire resetn,
    input wire en,
    input wire [WIDTH-1:0] d,

    // output
    output reg [WIDTH-1:0] q
);

    always @(posedge clk, negedge resetn)
    begin
        if (resetn == 0)
        begin
            q <= 0;
        end
        else
        begin 
            if (en)
            begin
                q <= d;
            end
        end
    end

endmodule