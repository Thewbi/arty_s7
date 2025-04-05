// decodes ALU control signals from the instruction
//
// R-type ---> undefined 32'bx
// I−type ---> 3'b000
// S−type ---> 3'b001
// B−type ---> 3'b010
// U−type ---> 3'b100
// J−type ---> 3'b011
module immsrcdec(

    // clock and reset
    // input wire clk,

    // input
    input   wire    [6:0]       op,
    //input   wire                opb5,       // opcode, bit 5 from RISCV instruction
    //input   wire    [2:0]       funct3,     // funct3 from RISCV instruction
    //input   wire                funct7b5,   // funct7, bit 5 from RISCV instruction
    // input   wire    [1:0]       ALUOp,      // ??

    // // input
    // input   wire [6:0] opcode,
    // input   wire [2:0] funct3,
    // input   wire [6:0] funct7,

    // output
    output  reg [2:0] ImmSrc

);

    // wire  RtypeSub;
    // // reg  RtypeSub;
    // assign RtypeSub = funct7b5 & opb5; // TRUE for R–type subtract

    // wire [1:0] ALUOp;
    // reg [1:0] ALUOp;
    // assign ALUOp = 2'b00;

    //always @(posedge clk)
    //always @(op, RtypeSub)
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


        // case (op)
        //     // RegWrite_ImmSrc_ALUSrc_MemWrite_ResultSrc_Branch_ALUOp_Jump
        //     7'b0000011: ALUOp = 3'b000; // lw
        //     7'b0100011: ALUOp = 3'b001; // sw
        //     7'b0110011: ALUOp = 3'bxxx; // R–type
        //     7'b1100011: ALUOp = 3'b010; // beq
        //     7'b0010011: ALUOp = 3'b000; // I–type ALU
        //     7'b1101111: ALUOp = 3'b011; // jal
        //     7'b0110111: ALUOp = 3'b100; // U-Type (lui)
        //     default: ALUOp = 3'bxxx; // ???
        // endcase

        // case (ALUOp)

        //     2'b00: begin ALUControl = 3'b000; end // addition

        //     2'b01: begin ALUControl = 3'b001; end // subtraction

        //     default: begin

        //         case (funct3) // R–type or I–type ALU

        //             3'b000: begin
        //                 if (RtypeSub)
        //                     ALUControl = 3'b001; // sub
        //                 else
        //                     ALUControl = 3'b000; // add, addi
        //             end

        //             3'b010:
        //                 begin ALUControl = 3'b101; end // slt, slti

        //             3'b110:
        //                 begin ALUControl = 3'b011; end // or, ori

        //             3'b111:
        //                 begin ALUControl = 3'b010; end // and, andi

        //             default:
        //                 begin ALUControl = 3'bxxx; end // ???

        //         endcase
        //     end

        // endcase
    end

endmodule