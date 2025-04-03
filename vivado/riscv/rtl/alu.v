// from: https://itsembedded.com/dhd/verilator_1/

module alu #(parameter WIDTH = 32) (

    // input
    input  wire [WIDTH-1:0]     a_in,
    input  wire [WIDTH-1:0]     b_in,
    input  wire [2:0]           ALUControl, // operation to perform

    // output
    output reg  [WIDTH-1:0]     ALUResult, // result to output
    output reg                  Z // zero
);

    // compute the result
    always @(a_in or b_in or ALUControl)
    begin

        case (ALUControl)

            // add (see alu_decoder.sv)
            3'b000:
            begin
                //$display("[ALU] add. a_in=%0d, b_in=%0d", a_in, b_in);
                ALUResult = a_in + b_in;
                $display("[ALU] add. a_in=%0d, b_in=%0d, ALUResult=%0d", a_in, b_in, ALUResult);

                // compute zero
                Z = (ALUResult == 0);
            end

            // sub
            3'b001:
            begin
                $display("[ALU] sub. a_in=%0d, b_in=%0d", a_in, b_in);
                ALUResult = a_in + (~b_in + 1'b1);

                // compute zero
                Z = (ALUResult == 0);

                $display("[ALU] sub. Z=%0d", Z);
            end

            // and, andi
            3'b010:
            begin
                $display("[ALU] and, andi");
                ALUResult = a_in & b_in;

                // compute zero
                Z = (ALUResult == 0);
            end

            // xor, xori
            3'b011:
            begin
                ALUResult = a_in ^ b_in;
                $display("[ALU] xor. a_in=%0d, b_in=%0d, ALUResult=%0d", a_in, b_in, ALUResult);

                // compute zero
                Z = (ALUResult == 0);
            end

            // slt, slti
            // SLTI (set less than immediate) places the value 1 in register rd if
            // register rs1 is less than the signextended immediate when both are treated
            // as signed numbers, else 0 is written to rd.
            3'b101:
            begin
                $display("[ALU] slt, slti");
                ALUResult = a_in < b_in ? 1 : 0;

                // compute zero
                Z = (ALUResult == 0);
            end

            // or, ori
            3'b110:
            begin
                $display("[ALU] or, ori");
                ALUResult = a_in | b_in;

                // compute zero
                Z = (ALUResult == 0);
            end

            default:
            begin
                // https://stackoverflow.com/questions/69184139/alu-noop-case-infers-a-latch-is-this-ok
                $display("[ALU] default");
                ALUResult = 32'b01010101010101010101010101010101;

                // compute zero
                Z = (ALUResult == 0);
            end

        endcase

    end

endmodule