// control unit or control logic for the multicycle CPU
//
// This module implements a state machine that produces
// controll signals based on the operation processed currently
module controller (

    // clk and resetn
    input   wire        clk,
    input   wire        resetn, // reset when resetn is 0. Run when resetn is 1.

    // input
    input   wire [6:0]  op,         // operation code from within the instruction
    input   wire [6:0]  oldOp,      //
    input   wire [2:0]  funct3,     // funct3 for instruction identification. This encodes the operation that the ALU has to execute
    input   wire        funct7b5,     // funct7b5 (all R-Type (register) operations have funct7, e.g. add)
    input   wire        Zero,       // the ALU has computed a result that is zero (for branching instruction making)
    input   wire [31:0] ReadData,

    // output
    output  wire        o_PCWrite,    // the PC flip flop enable line, the flip flop stores PCNext and outputs PC
    output  wire        o_AdrSrc,     // address source selector
    output  wire        o_MemWrite,   // write enable for the memory module
    output  wire        o_IRWrite,    // instruction register write
    output  wire [1:0]  o_ResultSrc,  // controls the multiplexer that decides what goes onto the Result bus
    output  wire [2:0]  o_ALUControl,
    output  wire [1:0]  o_ALUSrcB,    // decides which line goes into the ALU B parameter input
    output  wire [1:0]  o_ALUSrcA,    // decides which line goes into the ALU A parameter input
    output  wire [2:0]  o_ImmSrc,
    output  wire        o_RegWrite//,   // write enable for the register file

    // // DEBUG UART
    // output reg [7:0]   tx_Data,
    // output reg         tx_DataValid

    // DEBUG UART
    //output wire [7:0]   tx_Data,
    //output wire         tx_DataValid
);

    // make all ports wire types
    // use local regs inside the state machine
    // use assign to copy values from regs into wires

    reg         AdrSrc;
    reg         MemWrite;
    reg         IRWrite;
    reg [1:0]   ResultSrc;
    reg [1:0]   ALUSrcB;
    reg [1:0]   ALUSrcA;
    reg         RegWrite;

    //
    // Code
    //
    
    parameter
        ResetState          = 5'b00000,      // 0 S0 "Reset" State
        FetchState_1        = 5'b00001,      // 1 S1 "FetchState_1" State
        FetchState_2        = 5'b00010,      // 2 S2 "FetchState_2" State
        DecodeState         = 5'b00011,      // 3 S3 "Decode" State
        MemAddrState        = 5'b00100,      // 4 S4 "MemAddr" State
        MemReadState        = 5'b00101,      // 5 S5 "MemRead" State
        MemWBState          = 5'b00110,      // 6 S6 "MemWB" State
        MemWriteState       = 5'b00111,      // 7 S7 "MemWrite" State
        ExecuteRState       = 5'b01000,      // 8 S8 "ExecuteR" State
        ALUWriteBackState   = 5'b01001,      // 9 S9 "ALUWriteBack"
        ExecuteIState       = 5'b01010,      // A S10 "ExecuteI" State // execute I-Type instruction
        JALState            = 5'b01011,      // B S11 "JAL" State
        BEQState            = 5'b01100,      // C S12 "BEQ" State
        BRANCH_TAKEN_CHECK  = 5'b01101,      // D S13 "BRANCH_TAKEN_CHECK" State
        LUI_STATE           = 5'b01110,      // E S14 "LUI" State
        ErrorState          = 5'b01111       // F S15 "ERROR" State
        ;

    // current state and next state
    reg [4:0] current_state = ResetState;
    reg [4:0] next_state = FetchState_1;

    wire [2:0] ALUControlAluDec;
    aludec ad(op, op[5], funct3, funct7b5, ALUControlAluDec);
    assign o_ALUControl = ((current_state == DecodeState) || (current_state == ExecuteIState)) ? ALUControlAluDec : (current_state == BEQState) ? 3'b001 : 3'b000;

    wire [2:0] ALUControlImmSrcDec;
    immsrcdec isd(op, /*op[5], funct3, funct7b5,*/ ALUControlImmSrcDec);
    assign o_ImmSrc = ALUControlImmSrcDec;

    // // this initial block causes the yosys compiler to fail with "cannot be legalized: initialized D latches are not supported"
    // // Enable this block for Icarus Verilog. Remove this block for yosys.
    // initial
    // begin
    //     PCWrite = 1'b0;
    //     ALUSrcA = 2'b00;
    //     ALUSrcB = 2'b00;
    //     ALUControl = 3'b000;
    //     ResultSrc = 2'b00;
    //     AdrSrc = 1'b0;
    //     RegWrite = 1'b0;
    //     MemWrite = 1'b0;
    //     ImmSrc = 2'b00;
    //     IRWrite = 1'b0;
    // end

    //
    // All states of the Moore state machine (= output only depends on the current state)
    //
    // Strategy: https://www.fpga4student.com/2017/09/verilog-code-for-moore-fsm-sequence-detector.html
    //

    // sequential memory of the Moore FSM
    always @(posedge clk)
    begin
        if (resetn == 1)
        begin
            $display("[controller] next state");
            current_state <= next_state;
        end
        else
        begin
            $display("[controller] Resetting.");
            current_state <= ResetState;
        end
    end

    //
    // current state combinational logic
    //
    // combinational logic to determine the output
    // of the Moore FSM, output only depends on current state
    // Moore == output only depends on the current state
    //

    assign o_PCWrite = (Zero && (current_state == BEQState)) || current_state == FetchState_1 || current_state == JALState;
    
    assign o_AdrSrc = 
        (current_state == ResetState) ? 1'b0 :
        (current_state == FetchState_1) ? 1'b0 :
        (current_state == MemAddrState) ? 1'bx :
        (current_state == MemReadState) ? 1'b1 :
        (current_state == MemWBState) ? 1'bx :
        (current_state == MemWriteState) ? 1'b1 :
        (current_state == ExecuteRState) ? 1'b0 :
        (current_state == ALUWriteBackState) ? 1'b0 :
        (current_state == ExecuteIState) ? 1'b0 :
        (current_state == JALState) ? 1'bx :
        (current_state == BEQState) ? 1'b0 :
        (current_state == LUI_STATE) ? 1'b0 :
        (current_state == ErrorState) ? 1'bx : 1'b0;

    
    //assign o_MemWrite = MemWrite;
    assign o_MemWrite = 
        (current_state == ResetState) ? 1'b0 :
        (current_state == FetchState_1) ? 1'b0 :
        (current_state == MemAddrState) ? 1'b0 :
        (current_state == MemReadState) ? 1'b0 :
        (current_state == MemWBState) ? 1'b0 :
        (current_state == MemWriteState) ? 1'b1 :
        (current_state == ExecuteRState) ? 1'b0 :
        (current_state == ALUWriteBackState) ? 1'b0 :
        (current_state == ExecuteIState) ? 1'b0 :
        (current_state == JALState) ? 1'b0 :
        (current_state == BEQState) ? 1'b0 :
        (current_state == LUI_STATE) ? 1'b0 :
        (current_state == ErrorState) ? 1'bx : 1'b0;
        
    //assign o_IRWrite = IRWrite;
    assign o_IRWrite = 
        (current_state == ResetState) ? 1'b1 :
        (current_state == FetchState_1) ? 1'b1 :
        (current_state == DecodeState) ? 1'b0 :
        (current_state == MemAddrState) ? 1'b0 :
        (current_state == MemReadState) ? 1'b0 :
        (current_state == MemWBState) ? 1'b0 :
        (current_state == MemWriteState) ? 1'b0 :
        (current_state == ExecuteRState) ? 1'b0 :
        (current_state == ALUWriteBackState) ? 1'b0 :
        (current_state == ExecuteIState) ? 1'b0 :
        (current_state == JALState) ? 1'b0 :
        (current_state == BEQState) ? 1'b0 :
        (current_state == LUI_STATE) ? 1'b0 :
        (current_state == ErrorState) ? 1'bx : 1'b0;
        
    //assign o_ResultSrc = ResultSrc;
    assign o_ResultSrc = 
        (current_state == ResetState) ? 2'b00 :
        (current_state == FetchState_1) ? 2'b10 :
        (current_state == MemAddrState) ? 2'bxx :
        (current_state == MemReadState) ? 2'b00 :
        (current_state == MemWBState) ? 2'b01 :
        (current_state == MemWriteState) ? 2'b00 :
        (current_state == ExecuteRState) ? 2'b00 :
        (current_state == ALUWriteBackState) ? 2'b00 :
        (current_state == ExecuteIState) ? 2'b00 :
        (current_state == JALState) ? 2'b00 :
        (current_state == BEQState) ? 2'b00 :
        //(current_state == LUI_STATE) ? 2'bxx :
        (current_state == ErrorState) ? 2'bxx : 2'b00;
        
    //assign o_ALUSrcB = ALUSrcB;
    assign o_ALUSrcB = 
        (current_state == ResetState) ? 2'b00 :
        (current_state == FetchState_1) ? 2'b10 :
        (current_state == DecodeState) ? 2'b01 :
        (current_state == MemAddrState) ? 2'b01 :
        (current_state == MemReadState) ? 2'bxx :
        (current_state == MemWBState) ? 2'bxx :
        (current_state == MemWriteState) ? 2'bxx :
        (current_state == ExecuteRState) ? 2'b00 :
        (current_state == ALUWriteBackState) ? 2'b00 :
        (current_state == ExecuteIState) ? 2'b01 :
        (current_state == JALState) ? 2'b10 :
        (current_state == BEQState) ? 2'b00 :
        (current_state == LUI_STATE) ? 2'b10 :
        (current_state == ErrorState) ? 2'bxx : 2'b00;
        
    //assign o_ALUSrcA = ALUSrcA;
    assign o_ALUSrcA = 
        (current_state == ResetState) ? 2'b00 :
        (current_state == FetchState_1) ? 2'b00 :
        (current_state == DecodeState) ? 2'b01 :
        (current_state == MemAddrState) ? 2'b10 :
        (current_state == MemReadState) ? 2'bxx :
        (current_state == MemWBState) ? 2'bxx :
        (current_state == MemWriteState) ? 2'bxx :
        (current_state == ExecuteRState) ? 2'b10 :
        (current_state == ALUWriteBackState) ? 2'b00 :
        (current_state == ExecuteIState) ? 2'b10 :
        (current_state == JALState) ? 2'b01 :
        (current_state == BEQState) ? 2'b10 :
        (current_state == LUI_STATE) ? 2'b11 :
        (current_state == ErrorState) ? 2'bxx : 2'b00;
        
    //assign o_RegWrite = RegWrite;
    assign o_RegWrite = 
        (current_state == ResetState) ? 1'b0 :
        (current_state == FetchState_1) ? 1'b0 :
        (current_state == MemAddrState) ? 1'b0 :
        (current_state == MemReadState) ? 1'b0 :
        (current_state == MemWBState) ? 1'b1 :
        (current_state == MemWriteState) ? 1'b0 :
        (current_state == ExecuteRState) ? 1'b0 :
        (current_state == ALUWriteBackState) ? 1'b1 :
        (current_state == ExecuteIState) ? 1'b0 :
        (current_state == JALState) ? 1'b0 :
        (current_state == BEQState) ? 1'b0 :
        (current_state == LUI_STATE) ? 1'b0 :
        (current_state == ErrorState) ? 1'bx : 1'b0;

    //
    // next state combinational logic
    //
    // combinational logic of the Moore FSM
    // to determine next state
    //

    wire [6:0] newOp;
    assign newOp = ReadData[6:0];

    always @(current_state, resetn, newOp, oldOp)
    begin

        if (resetn == 0)
        begin
            next_state <= FetchState_1;
        end
        else
        begin

        case(current_state)

            // S0 "Reset" State
            ResetState:
            begin
                next_state <= FetchState_1;
            end

            // S1 "Fetch_1" State
            FetchState_1:
            begin
                $display("[controller] goto FetchState_1 -> DecodeState");
                next_state <= DecodeState;
            end

            // // S2 "Fetch_2" State
            // FetchState_2:
            // begin
            // end

            // S3 "Decode" State
            DecodeState:
            begin

                $display("[controller DecodeState] op: %b", op);
                if ((op == 7'b0000011) || (op == 7'b0100011)) // lw or sw
                begin
                    $display("[controller] goto DecodeState -> MemAddrState");
                    next_state <= MemAddrState; // 0x04
                end
                else if (op == 7'b0110011) // R-Type
                begin
                    $display("[controller] goto DecodeState -> ExecuteRState");
                    next_state <= ExecuteRState;
                end
                else if (op == 7'b0010011) // I-Type ALU (xori, addi, ...)
                begin
                    $display("[controller] goto DecodeState -> ExecuteIState");
                    next_state <= ExecuteIState; // 0x0A
                end
                else if (op == 7'b1101111) // JAL
                begin
                    $display("[controller] goto DecodeState -> JALState");
                    next_state <= JALState; // 0x0B
                end
                else if (op == 7'b1100011) // BEQ // 7'b1100011 == 63dec
                begin
                    $display("[controller] goto DecodeState -> BEQState");
                    next_state <= BEQState; // 0x0D
                end
                else if (op == 7'b0000000) // nop
                begin
                    $display("[controller] goto DecodeState -> FetchState_1 for nop");
                    next_state <= FetchState_1;
                end
                else if (op == 7'b0110111) // lui
                begin
                    $display("[controller] goto DecodeState -> LuiState for lui");
                    next_state <= LUI_STATE;
                end
                else
                begin
                    $display("[controller] goto DecodeState -> ErrorState");
                    next_state <= ErrorState;
                end

            end

            // S4 "MemAddr" State
            MemAddrState:
            begin
                if (oldOp == 7'b0000011) // lw
                begin
                    $display("[controller] goto MemAddrState -> MemReadState");
                    next_state <= MemReadState;
                end
                else if (oldOp == 7'b0100011) // sw
                begin
                    $display("[controller] goto MemAddrState -> MemWriteState");
                    next_state <= MemWriteState;
                end
                else
                begin
                    $display("[controller] goto MemAddrState -> ErrorState");
                    next_state <= ErrorState;
                end
            end

            // S5 "MemRead" State
            MemReadState:
            begin
                $display("[controller] goto MemReadState -> MemWBState");
                next_state <= MemWBState;
            end

            // S6 "MemWB" State
            MemWBState:
            begin
                $display("[controller] goto MemWBState -> FetchState_1");
                next_state <= FetchState_1;
            end

            // S7 "MemWrite" State
            MemWriteState:
            begin
                $display("[controller] goto MemWriteState -> FetchState_1");
                next_state <= FetchState_1;
            end

            // S8 "ExecuteR" State
            ExecuteRState:
            begin
                $display("[controller] goto ExecuteRState -> ALUWriteBackState");
                next_state <= ALUWriteBackState;
            end

            // S9 "ALUWB" State
            ALUWriteBackState:
            begin
                $display("[controller] goto ALUWriteBackState -> FetchState_1");
                next_state <= FetchState_1;
            end

            // A S10 "ExecuteI" State // execute I-Type instruction
            ExecuteIState:
            begin
                $display("[controller] goto ExecuteIState -> ALUWriteBackState");
                next_state <= ALUWriteBackState; //
            end

            // B S11 "JAL" State
            JALState:
            begin
                $display("[controller] goto JALState -> ALUWriteBackState");
                next_state <= ALUWriteBackState;
            end

            // C S12 "BEQ" State
            BEQState:
            begin
                $display("[controller] goto BEQState -> FetchState_1.");
                next_state <= FetchState_1;
            end

            // D S13 "BRANCH_TAKEN_CHECK" State
            BRANCH_TAKEN_CHECK:
            begin
                $display("[controller] goto BRANCH_TAKEN_CHECK -> FetchState_1.");
                next_state <= FetchState_1;
            end

            // E S14 "LUI_STATE" State
            LUI_STATE:
            begin
                $display("[controller] goto LUI_STATE -> ExecuteIState.");
                next_state <= ExecuteIState;
            end

            default:
            begin
                $display("[controller] default goto default -> ErrorState");
                next_state <= ResetState;
            end

        endcase

    end
end

endmodule