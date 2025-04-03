// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Apr  3 19:02:58 2025
// Host        : DESKTOP-91CSLS9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/dev/fpga/arty_s7/vivado/riscv/riscv.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s25csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  output rsta_busy;

  wire [31:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire rsta;
  wire rsta_busy;
  wire [3:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_9 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[5:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 25264)
`pragma protect data_block
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
fURkxASqAATBLnr2sQ==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
