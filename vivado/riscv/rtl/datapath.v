module datapath(

    // clock and resetn
    input   wire            clk,
    input   wire            fast_clk,
    input   wire            resetn,

    // output
    output  wire [6:0]      op,             // operation code from within the instruction
    output  reg [6:0]       oldOp,
    output  wire [2:0]      funct3,         // funct3 for instruction identification
    output  wire            funct7b5,       // funct7b5
    output  wire            Zero,           // the ALU has computed a result that is zero (for branching instructions)
    output  wire [31:0]     ReadData,       // output from instruction memory

    // input
    input  wire             PCWrite,        // the PC flip flop enable line, the flip flop stores PCNext and outputs PC
    input  wire             AdrSrc,         // address source selector
    input  wire             MemWrite,       // write enable for the memory module
    input  wire             IRWrite,        // instruction register write
    input  wire [1:0]       ResultSrc,      // controls the multiplexer that decides what goes onto the Result bus
    input  wire [2:0]       ALUControl,     // tells the ALU which operation to perform
    input  wire [1:0]       ALUSrcB,        // decides which line goes into the ALU B parameter input
    input  wire [1:0]       ALUSrcA,        // decides which line goes into the ALU A parameter input
    input  wire [2:0]       ImmSrc,         // enable sign extension of the immediate value
    input  wire             RegWrite,       // write enable for the register file

    // output
    output wire [31:0]      toggle_value    // RAM toggle signal
);

    wire [31:0]     PC;
    
    wire [31:0] OldPC;
    wire [31:0] adr;
    wire [31:0] data;
    wire [31:0] Instr;
    //wire [31:0] InstrNext;
    wire [31:0] RD1;
    wire [31:0] RD2;
    wire [31:0] register_output_A;
    wire [31:0] WriteData;
    wire [31:0] ALUResult;
    wire [31:0] ALUOut;

    // ALU signals
    wire [31:0] ImmExt;
    wire [31:0] SrcB;
    wire [31:0] Result;
    wire [31:0] SrcA;
    
    reg [31:0] toggle_value_reg;
    
    always @(fast_clk)
    begin
        if (adr == 32'd52)
        begin
            toggle_value_reg = WriteData;
        end
    end
    assign toggle_value = toggle_value_reg;
    
    blk_mem_gen_0 ram (
      .clka(fast_clk),      // input wire clka
      .rsta(!resetn),       // input wire rsta
      .ena(resetn),         // input wire ena
      .wea({4{MemWrite}}),  // input wire [3 : 0] wea
      .addra(adr),          // input wire [31 : 0] addra
      .dina(WriteData),     // input wire [31 : 0] dina
      .douta(ReadData)      // output wire [31 : 0] douta
    );

    //            clk     write enable    addr        data            output read data
    //dmem dmem(  clk,    MemWrite,       Result,     WriteData,      ReadDData);

    //                    clock     reset,      enable,     input       output
    flopenr #(32) OldPCFF(clk,      resetn,      IRWrite,   PC,         OldPC);

    // next PC logic (PCNext is the input which is stored in posedge clock.)
    // The flip flop will output the stored data onto PC
    //                  clock       reset,      enable,     input       output
    flopenr #(32) pcreg(clk,        resetn,     PCWrite,    Result,     PC);
    
    //                 input A     input B     selector    muxed output
    mux2 #(32) addrmux(PC,         Result,     AdrSrc,     adr);

    //                    clock     reset,      enable,     input       output
    flopenr #(32) InstrFF(clk,      resetn,      IRWrite,    ReadData,    Instr);

    //                 clock    reset   data-in     data-out
    flopr #(32) DataFF(clk,     resetn,  ReadData,   data);

    assign op = Instr[6:0];
    assign funct3 = Instr[14:12];
    assign funct7b5 = Instr[30];

    always @(posedge clk)
    begin
        oldOp = op;
    end

    // register file logic
    regfile rf (

        // clock write enable
        .clk(clk),              // [in] clock
        .resetn(resetn),        // [in] resetn

        .we3(RegWrite),         // [in] write enable for register 3. if high, register a3 is written with wd3

        // read
        .a1(Instr[19:15]),      // [in] register 1 to read (no clock tick needed)
        .a2(Instr[24:20]),      // [in] register 2 to read (no clock tick needed)

        // write
        .a3(Instr[11:7]),       // [in] register to write
        .wd3(Result),           // [in] data value to write

        // output
        .rd1(RD1),              // [out] the output where the value from register a1 appears
        .rd2(RD2)               // [out] the output where the value from register a2 appears
    );
                                 //   d    q
    flopr #(32) Data_RD1(clk, resetn, RD1, register_output_A);
    flopr #(32) Data_RD2(clk, resetn, RD2, WriteData);

    // sign extend module
    // param 1 = instruction bits (part of the instruction to sign extend)
    // param 2 = type of instruction that is sign extension applied to
    // param 3 = output
    //extend ext(ReadData[31:0], ImmSrc, ImmExt);
    extend ext(Instr[31:0], ImmSrc, ImmExt);
    
    // ALU input muxes
    //                 Input A      Input B     Input C         SelectSignal        Output
    //                 Input A      Input B     Input C     Input D        SelectSignal        Output
    mux4 #(32) srcamux(PC,          OldPC,      register_output_A,      32'b0,        ALUSrcA,            SrcA);
    //                 Input A      Input B     Input C         SelectSignal        Output
    mux3 #(32) srcbmux(WriteData,   ImmExt,     32'h00000004,   ALUSrcB,            SrcB);

    // ALU
    //      input A     input B     operation       result output       zero flag
    alu #(32) alu(SrcA,       SrcB,       ALUControl,     ALUResult,          Zero);

    flopr #(32) aluResult(clk, resetn, ALUResult, ALUOut);

    // this mux decides, which value is driving the result BUS
    //                      Input A (00)     Input B (01)       Input C (10)        SelectSignal        Output
    mux3 #(32) resultmux(   ALUOut,          data,              ALUResult,          ResultSrc,          Result);

endmodule