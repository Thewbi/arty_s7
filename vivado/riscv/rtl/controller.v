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
    //input   wire [6:0]  funct7,     // funct7
    input   wire        Zero,       // the ALU has computed a result that is zero (for branching instruction making)
//    input   wire [31:0] PC,
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

    //reg         PCWrite;
    reg         AdrSrc;
    reg         MemWrite;
    reg         IRWrite;
    reg [1:0]   ResultSrc;
    // reg [2:0]   ALUControl;
    reg [1:0]   ALUSrcB;
    reg [1:0]   ALUSrcA;
    // reg [2:0]   ImmSrc;
    reg         RegWrite;

    // assign o_PCWrite = PCWrite;
    assign o_AdrSrc = AdrSrc;
    assign o_MemWrite = MemWrite;
    assign o_IRWrite = IRWrite;
    assign o_ResultSrc = ResultSrc;
    // assign o_ALUControl = ALUControl;
    assign o_ALUSrcB = ALUSrcB;
    assign o_ALUSrcA = ALUSrcA;
    // assign o_ImmSrc = ImmSrc;
    assign o_RegWrite = RegWrite;

    //
    // DEBUG: This will output the current
    //

    //reg [7:0] temp_data;

    //assign tx_Data = current_state;
    //assign tx_Data = { 6'b000000, { ALUSrcB } }; // ERROR: stays zero always!
    //assign tx_Data = o_ALUSrcB;
    //assign tx_Data = ALUSrcA;
    //assign tx_Data = temp_data;

    //assign tx_DataValid = 1'b1;

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
        // if (resetn == 0)
        // begin
        //     //$display("[controller] resetn");
        //     // when resetn=0, reset the state of the FSM to "FetchState_1" State
        //     // current_state = FetchState_1;
        //     //current_state = ResetState;

        //     // PCWrite = 1'b0;
        //     // // ACTION 1 - read the instruction at PC. connect PC to instruction memory address input port
        //     // AdrSrc = 1'b0; // this connects the PC flip flop to the instruction memory
        //     // MemWrite = 1'b0; // not writing into memory
        //     // IRWrite = 1'b0; // fill Instr FlipFlop with read instruction from memory. Store PC into oldPC.
        //     // RegWrite = 1'b0;
        //     // ImmSrc = 2'b00; // no immediate extension required
        //     // // ACTION 2 - increment PC
        //     // ALUSrcA = 2'b00; // PC
        //     // ALUSrcB = 2'b00; // hardcoded 4
        //     // ALUControl = 3'b000; // add operation
        //     // ResultSrc = 2'b00; // place the ALU result onto the result bus immediately so that the incremented PC goes into PCNext
        // end
        // else
        // begin
        //     //$display("[controller] next state");
        //     // otherwise, next state
        //     current_state = next_state;
        // end

        if (resetn == 1)
        begin
            $display("[controller] next state");
            current_state = next_state;
        end
        else
        begin
            $display("[controller] Resetting.");

            current_state = ResetState;

            // // PCWrite = 1'b0;
            // // ACTION 1 - read the instruction at PC. connect PC to instruction memory address input port
            // AdrSrc = 1'b0; // this connects the PC flip flop to the instruction memory
            // MemWrite = 1'b0; // not writing into memory
            // IRWrite = 1'b1; // fill Instr FlipFlop with read instruction from memory. Store PC into oldPC.
            // RegWrite = 1'b0;
            // //ImmSrc = 3'b000; // no immediate extension required
            // // ACTION 2 - increment PC
            // ALUSrcA = 2'b00; // reset
            // ALUSrcB = 2'b00; // reset
            // //ALUControl = 3'b000; // add operation
            // ResultSrc = 2'b00; // place the ALU result onto the result bus immediately so that the incremented PC goes into PCNext

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

    //always @(current_state, resetn)
    //always @(current_state)
    always @(posedge clk)
    begin

        case (current_state)

            // S0 "Reset" State
            ResetState:
            begin

//                temp_data = 8'h00;

                // PCWrite = 1'b0;
                // ACTION 1 - read the instruction at PC. connect PC to instruction memory address input port
                AdrSrc = 1'b0; // this connects the PC flip flop to the instruction memory
                MemWrite = 1'b0; // not writing into memory
                IRWrite = 1'b1; // fill Instr FlipFlop with read instruction from memory. Store PC into oldPC.
                RegWrite = 1'b0;
                //ImmSrc = 3'b000; // no immediate extension required
                // ACTION 2 - increment PC
                ALUSrcA = 2'b00; // reset
                ALUSrcB = 2'b00; // reset
                //ALUControl = 3'b000; // add operation
                ResultSrc = 2'b00; // place the ALU result onto the result bus immediately so that the incremented PC goes into PCNext
            end

            // S1 "Fetch_1" State
            FetchState_1:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.FETCH_STATE_1] op: %b, oldOp: %b, funct3: %b, funct7: %b", op, oldOp, funct3, funct7);

                // // DEBUG
                // tx_Data = 8'h01;
                // tx_DataValid = 1'b1;

//                temp_data = 8'h01;

                // PCWrite = 1'b1;
                // ACTION 1 - read the instruction at PC. connect PC to instruction memory address input port
                AdrSrc = 1'b0; // this connects the PC flip flop to the instruction memory
                MemWrite = 1'b0; // not writing into memory
                IRWrite = 1'b1; // fill Instr FlipFlop with read instruction from memory. Store PC into oldPC.

                ResultSrc = 2'b10; // place the ALU result onto the result bus immediately so that the incremented PC goes into PCNext
                // ACTION 2 - increment PC
                //ALUControl = 3'b000; // add operation
                ALUSrcB = 2'b10; // hardcoded 4
                ALUSrcA = 2'b00; // PC

                // this is in the book in figure 7.32 on page 425 but it does not work! The PC is not incremented!
                // ALUControl = 3'bxxx; // add operation
                // ALUSrcB = 2'bxx; // hardcoded 4
                // ALUSrcA = 2'bxx; // PC

                //ImmSrc = 3'bxxx; // no immediate extension required
                //ImmSrc = 3'b000;
                RegWrite = 1'b0;
            end

            // S2 "Fetch_2" State

            FetchState_2:
            begin

//                temp_data = 8'h02;

                // PCWrite = 1'b0;
                // ACTION 1 - read the instruction at PC. connect PC to instruction memory address input port
                AdrSrc = 1'b0; // this connects the PC flip flop to the instruction memory
                MemWrite = 1'b0; // not writing into memory
                IRWrite = 1'b1; // fill Instr FlipFlop with read instruction from memory. Store PC into oldPC.
                RegWrite = 1'b0;
                //ImmSrc = 3'b000; // no immediate extension required
                // ACTION 2 - increment PC
                ALUSrcA = 2'b00; // reset
                ALUSrcB = 2'b00; // reset
                //ALUControl = 3'b000; // add operation
                ResultSrc = 2'b00; // place the ALU result onto the result bus immediately so that the incremented PC goes into PCNext
            end

            // S3 "Decode" State
            DecodeState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.DECODE_STATE] op: %b, funct3: %b, funct7: %b", op, funct3, funct7);

                // // DEBUG
                // tx_Data = 8'h03;
                // tx_DataValid = 1'b1;

 //               temp_data = 8'h03;

                ALUSrcA = 2'b01; // oldPC
                ALUSrcB = 2'b01; // immediate sign extended (this will compute the jump target for JAL and BEQ)
                //ALUControl = ALUControlAluDec;
                IRWrite = 1'b0;
            end

            // S4 "MemAddr" State
            // sw rs2, offset(rs1) add offset to rs1 and store the value
            // rs2(31:0) → mem[rs1 + imm12]
            // sw x7, 84(x3)
            MemAddrState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.MemAddrState] op: %b, oldOp: %b, funct3: %b, funct7: %b", op, oldOp, funct3, funct7);

  //              temp_data = 8'h04;

                // // DEBUG
                // tx_Data = 8'h04;
                // tx_DataValid = 1'b1;

                // compute the target address as rs1 + imm12

                // figure 7.32 page 447

                // PCWrite = 1'b0;
                AdrSrc = 1'bx;
                MemWrite = 1'b0;
                IRWrite = 1'b0;
                ResultSrc = 2'bxx;
                //ALUControl = 3'b000; // add
                ALUSrcB = 2'b01; // immediate sign extended
                ALUSrcA = 2'b10; // register
                //ImmSrc = 3'b000; // keep value from last state
                //ImmSrc = ALUControlImmSrcDec;
                RegWrite = 1'b0;
            end

            // S5 "MemRead" State
            MemReadState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.MemReadState] op: %b, oldOp: %b, funct3: %b, funct7: %b", op, oldOp, funct3, funct7);

 //               temp_data = 8'h05;

                // PCWrite = 1'b0;

                ALUSrcA = 2'bxx;
                ALUSrcB = 2'bxx;
                //ALUControl = 3'bxxx;

                // //ResultSrc = 2'b10; // ALUOut register to Result bus
                ResultSrc = 2'b00;

                AdrSrc = 1'b1; // Result bus is connected to the memory addr port
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                //ImmSrc = 3'b000; // (lw)
                IRWrite = 1'b0;
            end

            // S6 "MemWB" State
            MemWBState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.MemWBState] op: %b, oldOp: %b, funct3: %b, funct7: %b", op, oldOp, funct3, funct7);

 //               temp_data = 8'h06;

                // $display("[CTRL.OUTPUT.MemWBState] ReadDData: 0x%0h", ReadDData);

                // PCWrite = 1'b0;
                AdrSrc = 1'bx;
                MemWrite = 1'b0;
                IRWrite = 1'b0;
                ResultSrc = 2'b01; // take the value from the Data register and place it onto the result bus
                //ALUControl = 3'bxxx;
                ALUSrcB = 2'bxx;
                ALUSrcA = 2'bxx;
                //ImmSrc = 3'b000;
                RegWrite = 1'b1;
            end

            // S7 "MemWrite" State
            MemWriteState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.MemWriteState] op: %b, oldOp: %b, funct3: %b, funct7: %b", op, oldOp, funct3, funct7);

  //              temp_data = 8'h07;

                // PCWrite = 1'b0;
                AdrSrc = 1'b1; // connect the result bus to the address line of the memory
                MemWrite = 1'b1; // enable a write to memory
                IRWrite = 1'b0;
                ResultSrc = 2'b00; // place ALU out onto the result bus
                //ALUControl = 3'bxxx;
                ALUSrcB = 2'bxx;
                ALUSrcA = 2'bxx;
                //ImmSrc = 3'b001;
                RegWrite = 1'b0;
            end

            // S8 "ExecuteRState" State // execute R-Type instruction
            ExecuteRState:
            begin

                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.ExecuteRState] op: %b, funct3: %b, funct7: %b", op, funct3, funct7);

  //              temp_data = 8'h08;

                // PCWrite = 1'b0;
                ALUSrcA = 2'b10; // register
                ALUSrcB = 2'b00; // register
                ResultSrc = 2'b00;
                AdrSrc = 1'b0;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                //ImmSrc = 3'b000;
                IRWrite = 1'b0;
            end

            // S9 "ALUWriteBackState" State
            ALUWriteBackState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.ALUWB_STATE]");

  //              temp_data = 8'h09;

                // PCWrite = 1'b0;
                ALUSrcA = 2'b00;
                ALUSrcB = 2'b00;
                //ALUControl = 3'b000;
                ResultSrc = 2'b00; // Result bus is ALUOut flip flop
                AdrSrc = 1'b0;
                RegWrite = 1'b1; // enable the RegWrite feature of the register file so it stores the result bus into the destination register rd
                MemWrite = 1'b0;
                //ImmSrc = 3'b000;
                IRWrite = 1'b0;
            end

            // A S10 "ExecuteI" State // execute I-Type instruction (XORI, ADDI, ...)
            ExecuteIState:
            begin
                // $display("");
                // $display("");
                // //$display("[CTRL.OUTPUT.EXECUTEI_STATE] op: %b, funct3: %b, funct7: %b, ALUControl: %d, newALUControl: %d, ALUSrcA: %d, ALUSrcB: %d", op, funct3, funct7, ALUControl, newALUControl, ALUSrcA, ALUSrcB);
                // $display("[CTRL.OUTPUT.EXECUTEI_STATE]");


  //              temp_data = 8'h0A;

                // PCWrite = 1'b0;
                //IRWrite = 1'b0;
                //ResultSrc = 2'b00;

                // ALUSrcA = 2'bxx; // register

                if (ALUSrcA == 2'b11) begin
                    ALUSrcA = 2'b11; // constant 0 (32'b0)
                end else begin
                     ALUSrcA = 2'b10; // register
                end

                ALUSrcB = 2'b01; // immediate sign extended



                // SNIP

                // If you enable any of the signals below, this will trigger
                // the ALU a second time and the second time it computes an
                // unwanted value!

                ResultSrc = 2'b00;
                AdrSrc = 1'b0;
                RegWrite = 1'b0;
                MemWrite = 1'b0;

                //ImmSrc = 3'b000; // Immediate sign extend

                IRWrite = 1'b0;

                // SNAP
            end

            // B S11 "JAL" State // execute J Type instruction
            JALState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.JALState]");

  //              temp_data = 8'h0B;

                //PCWrite = 1'b1; // Write into the PC register
                AdrSrc = 1'bx; // confuse the muxer so it does not perform any action
                MemWrite = 1'b0;
                IRWrite = 1'b0;
                RegWrite = 1'b0;
                // compute PC + 4 which is the "link" operation
                ALUSrcA = 2'b01; // oldPC
                ALUSrcB = 2'b10; // hard coded 4
                //ALUSrcB = 2'b01; // Immediate sign extended
                //ImmSrc = 3'b011; // Immediate sign extend (J-Type)
                //ALUControl = 3'b000; // add
                ResultSrc = 2'b00; // ALUOut goes onto the result bus
            end

            // C S12 "BEQ" State
            BEQState:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.BEQ_STATE]");

 //               temp_data = 8'h0C;

                // PCWrite = 1'b0;
                ALUSrcA = 2'b10; // register
                ALUSrcB = 2'b00; // register
                //ALUControl = 3'b001; // subtraction
                ResultSrc = 2'b00; // Result bus is ALUOut flip flop
                AdrSrc = 1'b0;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                //ImmSrc = 3'b000; // reuse the value from prior states
                IRWrite = 1'b0;

                // if (Zero == 1)
                // begin
                //     PCWrite = 1'b1;
                // end
            end

            // D S13 "BRANCH_TAKEN_CHECK" State
            BRANCH_TAKEN_CHECK:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.BRANCH_TAKEN_CHECK]");

 //               temp_data = 8'h0D;

                // if (Zero == 1)
                // begin
                //     $display("[CTRL.OUTPUT.BEQ_STATE] Branch taken. Zero: %d", Zero);

                //     PCWrite = 1'b1;
                //     ALUSrcA = 2'b01; // oldPC
                //     ALUSrcB = 2'b01; // immext
                //     ALUControl = 3'b000; // add
                //     ResultSrc = 2'b10;
                //     AdrSrc = 1'b0;
                //     RegWrite = 1'b0;
                //     MemWrite = 1'b0;
                //     ImmSrc = 3'b010;
                //     IRWrite = 1'b0;
                // end
                // else
                // begin
                //     $display("[CTRL.OUTPUT.BEQ_STATE] Branch NOT taken");
                // end
            end

            // E S14 "LUI_STATE" State
            LUI_STATE:
            begin
                // $display("");
                // $display("");
                // $display("[CTRL.OUTPUT.LUI_STATE]");

 //               temp_data = 8'h0E;

                // PCWrite = 1'b0;
                ALUSrcA = 2'b11; // new zero input
                ALUSrcB = 2'b10; // sign extended immediate
                //ALUControl = 3'b000; // add
                ResultSrc = 2'b00; // saved ALU out
                AdrSrc = 1'b0;
                RegWrite = 1'b0;
                MemWrite = 1'b0;
                //ImmSrc = 3'b100; // LUI
                IRWrite = 1'b0;
            end

            // F S15
            ErrorState:
            begin
 //               temp_data = 8'h0F;

                IRWrite = 1'b0;
            end

            default:
            begin
                //$display("[CTRL.OUTPUT.?] No case in always @(current_state) current_state = %d", current_state);
 //               temp_data = 8'h10;
            end
        endcase
    end

    //
    // next state combinational logic
    //
    // combinational logic of the Moore FSM
    // to determine next state
    //

    wire [6:0] newOp;
    assign newOp = ReadData[6:0];

    always @(current_state, resetn, newOp, oldOp)
    //always @(current_state)
    begin

        if (resetn == 0)
        begin
            next_state = FetchState_1;
        end
        else
        begin

        case(current_state)

            // // This causes a combinational loop in nextpnr
            // // S0 "Reset" State
            ResetState:
            begin
                // //$display("resetn: %d", resetn);
                // if (resetn == 1)
                // begin
                //     $display("[controller] goto ResetState -> FetchState_1");
                //     next_state = FetchState_1;
                // end
                next_state = FetchState_1;
            end

            // S1 "Fetch_1" State
            FetchState_1:
            begin
                $display("[controller] goto FetchState_1 -> DecodeState");
                next_state = DecodeState;
            end

            // // S2 "Fetch_2" State
            // FetchState_2:
            // begin
            // end

            // S3 "Decode" State
            DecodeState:
            begin

                $display("[controller DecodeState] op: %b", newOp);
                if ((newOp == 7'b0000011) || (newOp == 7'b0100011)) // lw or sw
                begin
                    $display("[controller] goto DecodeState -> MemAddrState");
                    next_state = MemAddrState; // 0x04
                end
                else if (newOp == 7'b0110011) // R-Type
                begin
                    $display("[controller] goto DecodeState -> ExecuteRState");
                    next_state = ExecuteRState;
                end
                else if (newOp == 7'b0010011) // I-Type ALU (xori, addi, ...)
                begin
                    $display("[controller] goto DecodeState -> ExecuteIState");
                    next_state = ExecuteIState; // 0x0A
                end
                else if (newOp == 7'b1101111) // JAL
                begin
                    $display("[controller] goto DecodeState -> JALState");
                    next_state = JALState;
                end
                else if (newOp == 7'b1100011) // BEQ // 7'b1100011 == 63dec
                begin
                    $display("[controller] goto DecodeState -> BEQState");
                    next_state = BEQState; // 0x0D
                end
                else if (newOp == 7'b0000000) // nop
                begin
                    $display("[controller] goto DecodeState -> FetchState_1 for nop");
                    next_state = FetchState_1;
                end
                else if (newOp == 7'b0110111) // lui
                begin
                    $display("[controller] goto DecodeState -> LuiState for lui");
                    next_state = LUI_STATE;
                end
                else
                begin
                    $display("[controller] goto DecodeState -> ErrorState");
                    next_state = ErrorState;
                end

            end

            // S4 "MemAddr" State
            MemAddrState:
            begin
                if (oldOp == 7'b0000011) // lw
                begin
                    $display("[controller] goto MemAddrState -> MemReadState");
                    next_state = MemReadState;
                end
                else if (oldOp == 7'b0100011) // sw
                begin
                    $display("[controller] goto MemAddrState -> MemWriteState");
                    next_state = MemWriteState;
                end
                else
                begin
                    $display("[controller] goto MemAddrState -> ErrorState");
                    next_state = ErrorState;
                end
                // if (op == 7'b0000011) // lw
                // begin
                //     $display("[controller] goto MemAddrState -> MemReadState");
                //     next_state = MemReadState;
                // end
                // else if (op == 7'b0100011) // sw
                // begin
                //     $display("[controller] goto MemAddrState -> MemWriteState");
                //     next_state = MemWriteState;
                // end
                // else
                // begin
                //     $display("[controller] goto MemAddrState -> ErrorState");
                //     next_state = ErrorState;
                // end
            end

            // S5 "MemRead" State
            MemReadState:
            begin
                $display("[controller] goto MemReadState -> MemWBState");
                next_state = MemWBState;
            end

            // S6 "MemWB" State
            MemWBState:
            begin
                $display("[controller] goto MemWBState -> FetchState_1");
                next_state = FetchState_1;
            end

            // S7 "MemWrite" State
            MemWriteState:
            begin
                $display("[controller] goto MemWriteState -> FetchState_1");
                next_state = FetchState_1;
            end

            // S8 "ExecuteR" State
            ExecuteRState:
            begin
                $display("[controller] goto ExecuteRState -> ALUWriteBackState");
                next_state = ALUWriteBackState;
            end

            // S9 "ALUWB" State
            ALUWriteBackState:
            begin
                $display("[controller] goto ALUWriteBackState -> FetchState_1");
                next_state = FetchState_1;
            end

            // A S10 "ExecuteI" State // execute I-Type instruction
            ExecuteIState:
            begin
                $display("[controller] goto ExecuteIState -> ALUWriteBackState");
                next_state = ALUWriteBackState; //
            end

            // B S11 "JAL" State
            JALState:
            begin
                $display("[controller] goto JALState -> ALUWriteBackState");
                next_state = ALUWriteBackState;
            end

            // C S12 "BEQ" State
            BEQState:
            begin
                //$display("[controller] goto BEQState -> BRANCH_TAKEN_CHECK.");
                //next_state = BRANCH_TAKEN_CHECK;

                $display("[controller] goto BEQState -> FetchState_1.");
                next_state = FetchState_1;
            end

            // D S13 "BRANCH_TAKEN_CHECK" State
            BRANCH_TAKEN_CHECK:
            begin
                $display("[controller] goto BRANCH_TAKEN_CHECK -> FetchState_1.");
                next_state = FetchState_1;
            end

            // E S14 "LUI_STATE" State
            LUI_STATE:
            begin
                $display("[controller] goto LUI_STATE -> ExecuteIState.");
                next_state = ExecuteIState;
            end

            default:
            begin
                $display("[controller] default goto default -> ErrorState");
                //next_state = ErrorState;
                next_state = ResetState;
            end

        endcase

    end
    end


endmodule