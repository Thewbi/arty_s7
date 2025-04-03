module dmem(
    input wire clk, we,
    input wire [31:0] a, wd,
    output wire [31:0] rd
);

    reg [31:0] RAM[63:0];

    assign rd = RAM[a[31:2]]; // word aligned

    always @(posedge clk)
        if (we)
        begin
            $display("[DMEM] Writing wd: 0x%0h, address: 0x%0h", wd, a[31:0]);
            RAM[a[31:2]] <= wd;
        end

endmodule