// decodes ALU control signals from the instruction
//
// R-type ---> undefined 32'bx
// I−type ---> 3'b000
// S−type ---> 3'b001
// B−type ---> 3'b010
// U−type ---> 3'b100
// J−type ---> 3'b011
module immsrcdec(

    // input
    input   wire    [6:0]       op,

    // output
    output  reg [2:0] ImmSrc

);

    always @(op)
    begin

        case (op)

            // LUI
            7'b0110111:
                begin ImmSrc <= 3'b100; end
            // AUIPC
            7'b0010111:
                begin ImmSrc <= 3'b100; end

            // JAL
            7'b1101111:
                begin ImmSrc <= 3'b011; end

            // JALR
            7'b1100111:
                begin ImmSrc <= 3'b000; end
            // LB, LH, LW, LBU, LHU,
            7'b0000011:
                begin ImmSrc <= 3'b000; end
            // ADDI, SLTI, SLTIU, XORI, ORI, ANDI
            7'b0010011:
                begin ImmSrc <= 3'b000; end

            // BEQ, BNE, BLT, BGE, BLTU, BGEU
            7'b1100011:
                begin ImmSrc <= 3'b010; end

            // SB, SH, SW
            7'b0100011: // 0x23, 35dec
                begin ImmSrc <= 3'b001; end

            default:
                begin ImmSrc <= 3'bxxx; end // ???

        endcase

    end

endmodule