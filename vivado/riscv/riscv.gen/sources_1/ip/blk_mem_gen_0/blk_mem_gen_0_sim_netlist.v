// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Apr  3 21:16:18 2025
// Host        : DESKTOP-91CSLS9 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_0_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 24976)
`pragma protect data_block
yrj+TwJ2jev8FnNm4WXcyB53byZiOzI9PsAp8evfVeTCQysgLLWrPTPtv40NwCZMfwUhQm5t7/rH
/CWBv08EzMQ/tTkEHATVMC6cF1vD7eNM2t3RhLtQSbl/lx/ojMhXF8/yZJHVhSmIxHvx02SM/C5J
e/I8tLzERgYzHGSDGzs8tiziq1mKbhHiE4Rv9nYT1HKPYGwzY78hkHA5DFLYMJxj/4D+u/yEHpq2
S+btNXp1osyG1x+UcdiGsiLaZlO0E9zjEtie+UUgrol7jqTIWhB1mcVhxxNOjdPQRJHklB1aGzFN
0GwFnEjXW3iyh949HkzTFb0bvnng6n7hBR0Zr7l6Sp+G89X+w2HmJpniOHIbyYJTtWu0zhDhF+gW
Zp/wLyJPO6YJgU+DFi8UfNBqwbSd2Dy+dhgbJsM0fNKIHqLeJrI7ld4VquzlJ4xjs7JuGo9gpQKQ
NWtfBhnsiZIWTHIV4HeOkSZcx52RwVCL2RaaIZJOsVEOe2Ie1X1wPvDZFcLfArbWYUAiJtrhFjPA
VLCuGcXujkWFI15Q95iIh1d7sUreCiCmJlaRml2pw9JcGc8bdZFOjWs2h64ll2DHWPFkAFh5GgrJ
hPGlejO8mkngqTxxx/PA3spUP+WswEFCn1HWYdHjoWAfrSBjGTWhkzJpamRI47I45xAMG+CvPcNc
dvjqGAdPaddvdDX1siJ+9YvIFlD+ivDiihSw+bwGmNubxm+Gyvel0B4R6rDQvLyuUPLV45IcnxS5
FxBWLDJhNn1jXx6jxhZVTgzlrvdkMyzs9HsRmkivjw6NQ3ES5AvCgq9dw3PvgtOYz+161QgWk1nc
OUfn7uF3uLPFF8L5HxLvhbgrUcSf6LuCyScocCIkrdKQI8CQjUNjKcPNFvrV29pzT+6c1RagUMJn
mwrE5WsdYArizWTgeSUh/EvRJR6tjw+gGhSpWJe0iRAtNaRbXx91Q8uD5yt4OjMymn3P8blLC+AK
p65bIfMuYHpMzoDLUqOPMVBnJyP+x/IGIi0xte3Y0xITX1HwUauW4H0oGBUx+UAP87A/WkWGOeab
7ZR6zOM0CzdV0p+cdj0Xr1XLoJ7NO95ajturHSNuVvQorsp61FCHIBIdHh9iqeF1e7C3FWfFxzei
P9A7oHfywePM0oVXVPIrU+rRRGhJBorcsTQqSBkiV7S/2c4/kS5Dbm3ignfNE55jJiGbCeloi9Ep
6fftgpLldoiIaEB/sP/QYuysy3onjViDTO27LRPC8QdLX1b4gbnsbH8rIvXwIXVt1Jy5kAS7RZzN
JJEtKljGp4X5XhQSMgQI2kqazi8hjIa6fm+JRPSXGI+TA9u0pSrc+5rHsOS2GOzuRwdkidtilcRZ
lC3BFwKlX46Wa8uITt3XcKmC/+6yuRMPyBtahs65jPq+9Rh5CMs5JOGGe+4a7e8gLXwjhbyTuySy
ML9jGQarrDOIX7Ia8Ryy3SO909bBY+loqTay+rAM++aAL+TPjA7LTjR/KpPtIGfR26lmQ20hmeTV
4XKaqd7/xedLWwruhjuXXkNEALPvbyUdLnuVuo6OaM5VoqNbAGBKh6CISPXZCX/CSZH7rR9NcHhe
HMZUaloaD4AUohBj/wGuqcUCUmjYf4zQcySuPC3a9C0y4JnZ16xEoc6fBE4ueVhHpM1i975Jnnxh
4Xuvac/WuOpPgyKu6ieFTERFozeUW3laVwKlBbaDGfvPArG64EjxfaBn+JBg8Ttbo9AU2EcdoFtC
GNcGghb4tOGFQGZuoge1E52TvrfOE/hJvaFQ9JE5g9lSB+fIaMQ5GnFLUWLwrxbOGhKC2EYdOaKv
KFxO0vF7vbmAOGx74xKEuAEyr4lPkhAHMdK6WxvZ19RL8R1Ga5KoSZs9aekaNDUUm64NZ5IMXPXy
oXiQp1I6K65o8IkNk10Oz8N2RGsKUS1aWvIciSqkef01H/OTXKm3hy8OyBCLpm33Glr2O+Vs+gup
3uD4P4KFz9i2yQofDg10kZ1ZLoTJLjtWxr2YFd38uqBWdjTDsJ14p+qtFCwUihKLfpIxioVuR9fE
vb/av0TSDQlsu8+Nga8P+ccrPXGVo+RjY3Anuf3SIApf4gc9WFLw/jnyQPmngU97UKwOtQqjDeo5
uOWj2N1xoT/oXfq5sYAfiOMq0L3v5bb4zSFPJP4iSnLR/9MvQvVKTT8pGEeXLU9JN85vRCAGvgfu
JkJOoDUY682wTObm/Um3m3jIiGsaBUarTPKHzoPZZBZrZJ8YvpEgNyeumgxKaNfigm/TeSnldxTm
609+TWNU/6dVX8RXlnbqHMtbCKeFOZNLcU3dU+/BmEZiVg3KeUDWB6WxleMpFsXsiMjPwxwVe2Nm
EuE57RMq/KWp861ve7ld9n4TGlVX0tb1+vrA0L1sjBoZFIYW88Unq4NB6XQ8HgEk1t1eh29ignNO
dkpBObZMKqVdZNW+RJ8vyh2dPGJ38zA8sQEty792yYgkl1DH6mb0/xLoSuMSpx2OQXU7U6o9Og7p
TV4gfKGddanBBIsNQFqB5/59ywngDWRihVCRxbjehlgM1KBBHl+EkbDIbrhD6aFlW1A7V6ADx8ev
a+zNSmL+6cOVT8FjOYhlC+RJEUj8Ye3g0hZd/LnLjdS7e6ynHMPoAUoxbxEPHoBYG7KeHaXUSLJq
CIALM8bUfDpMiZ8qFVaCc8V0rvRrp5l6oHtQYH7EIA6bhb3ion+U+aA2p18pPJtyC2aGOcp6i0o+
McrgO8cRjG8iGoCdWC4Ym1BIj20tqRfiuYTyK36EGUVPnydQ7HuoJhnCcjxiuTQuSdbPELaowx6Q
YfzgIxSyHCTzqXwpbAHUVxgdbr2hdWi3f5HsuXhIKPtjxKZ2q/At/Q+dpQwUDk5kvB+hZwwJ8w1y
OgXowbC4jRcfNoBaIvWxWjx9YOagYGk9kd7vQ81qz3gxCWW4UO5KBfY7YFzvHYBw+RaPAk3sv8IW
sc+sobZk+ZXtLbzMLb4EiZEgJ4UaI5Gtc+vkt6LyliktmfyRcFyjJ5NAx8yeAErFtAuv8cIwtwM5
6FbWnu4lMNNu0zfKXlo5brqJlgsHqovf8xjPAx6cqYlPhB7KWNHZU69Z6xbc1aT4FXVB+jQprpYZ
NRyWCRy5HAtPBkP/WaBdtxRKDrfjNmjK2s8Cu3xK7+4ieJ26UYrS+2+YduPbhWx3wl3ZsKtBekAp
eKa1xqh6pMpR0p7w9Fh+FQPc1/JxYdQgImNbqfHYoxVNfyOSIhmUmYmjoIQSLRMyVhFvejtv/p6a
EZjvNgMkICrM9sd4BdAycu0btTvtYbZgob6f0H5vJGr+r6uqXaBvXsUXyj+KFDBLcNwRRcFnvGQh
TBvmexlksgToHbfHJiNKjg71lRVWTuVHaVaxjp6+g3Z/inrStobzIM2meOQAAFKYQw06DJ1coxzu
jJXik57CSSzccIYK3JvV1WqbTUfDuZ4eyaxYX+7m4J6JlUUi3dra1QpHffND+J45xgdqdl5IVvVu
3eQUUIGPy6fCVO3FJ9IkfoifhIdJkBtJe+l1G6xUlmDPwxN8ps8FWN0g/l/pUD8t5wtxNbMnoE8Y
B4IRsogsnU62KgKlI0e+DcLHswfKAcjEqskQLfIf4VPyX5Y1UadfgGPlpVfnBGYmBYY9ZbN14Y7E
QSniRQvNRL78Gdc5UaIx0uPdri1baLC7aIJ/Rq/aXRq98MsCQtW3MAwJCoV+9wz5xrco4+wX4m0O
Mnxm5xdh3En5EzPIVPNqTD9YYsjOYD3vSesM6EIwiDkW94TKUCFfWMQkhp4n1y7SyNosfW9C5SMC
yNzheiI6lRXjhkHJgSmYoDFqOzI4MRzoT1lC/yNeeKERqKq5/cqLuqCgWIcYoadnt8BTAeQKGlei
IaBSBBhd0VYcFmev61X77wUQ+pKr/xBhEFEQvtGkwWh2GjViL+P3N/5cNCMrVisihBbzxDG3Bk2J
yIE6191KdkQTaWd6M3ROBc7DqpkMl5VhQa+6/0pK/XHaoNUy4F40T7gRazxJM/jSqquSx8g7YS4g
5qDz64WrdA7bGr7OWuwfWvYF6SYUTq/oUVgFTUdOEJL09p0GNa2egCHghlWchcF08TEghynEAwzK
RReVVoocKICjVKuDEfyS3SthIj9HFsJcKfhZ13Km0i/Snufhs/LiIjVqENmKu4vvieUh3lHFwtUQ
RNVicbHb66UEtxItp7R9nY3XvEze2MbOhTOTDbYkVsxDLVmrHRj8b3bITmEyv5wIkO+P4FB/s1HG
9T2GtMGXcq2JAe7620+C+Lz1uRFBp47Mu8kCXKHGUafSlpH9pKyzUVqLEGC1FlJFWY1PBYuWN5jI
QWgDNf7XGC9DNc5tI+Kh3TR1GWdc1dXsvXLODmrItZOEZlcFsqoj41DLzBCBeFZ/buMJeJXn39fi
8hkP4wo4gE1fBQk8tomqU/5ZxwmiNQ4ldeirNb9+Dfde6gdhoVJ4XRZFBFXd4KM6cO7CsmbLHUxZ
BRIUGtvfkEgZrsHySpbSP4e3rDYYNzSgWOroWbxqn9Y7CML/QYNqcnGYnYl8hVPeGaBqVGS4Mjyl
eXRRPoHlUYiCu6x76ee4jyGDJrMk0FXu7p8fb5llCpGF9xcjpGmVG4dKczrcB2yg/C8u6L95rIbi
MaAgUGqchBN9WAOCyO2JaJSWWhE6dckn7McUyiXIBEK56rBbTnLj7hc5L1VeeLdYOO+cc+21M8zX
mMkMRV4WniGWul62a/OKRCjkCkLRUzQWjgBXsr4/S/soqPv2fAGl/IYJAO7XP5GMdZXqeWYUcERd
sSUgsFW93gRUopfV8YyTXxPtdMUfTEz1j9Lz0VF/u17pMfICg/F7WvqcbuiJFTdCwx2O+9x+Q6ML
DtSsUrWidi2UACV0BgFDcEMMGaEMb/o17srAZrw9tXLMeCsHi2t9zfZG7M5Ftk+jyYpsV7JC/nZT
NlalOP1RJCA5F9byLS+r7GJ0tuuh0vP0cYq1J2IK10qDW2/E5gpT3A2TzIQVf8IXIIZ6DG5VquY+
iQZHutpQDFRwWJRt/4ORFhbJ3SPRoAlrPNhiZT8BFkSBZebeghKFK7BGCEJ4aw5Y4PKWM2pTwk4c
zO/LdkdnxZjNDjt9OAnWtJFOiT+Izvobodaxtd+2vvL9CTgYd+rQ02smhuYEVYRHhAH14bcGFxom
AO6NUDwhVtZU5WgfVv4AxXJ0t4dOFTSWWIVG7qe3QUAejHvaAdtnrj1hEqQbzZ5NyQMohfTbS+sQ
NqaKbOShC2fLICJMU5DH0vFGTpZEACCFRmKfe8FB9MSYrbM67d8IozxmPyLP7Zy480pkS0+oACxa
2UajNNcjrrtni7BTaywKYuOan8KcsUMpbVA2Gn3znJqy+rImVra+4JVKq3QpcmzL6JTHTyK/u+Ae
Ga+Dh5iHSK8ucvGHs69q7tJXrZSKSdgBDYs0bQPMtYuH6QpmvlfWt4rIiUU4GSu4bOc9/gwyxYW5
ecPpJNlstxyc5BBKsooXNI64W0ynfiZ7k2lte/aWA+AiYsTMnqDNf1Nt1GFL2PE4v32XzzaP4S2S
m8i+8HzcbAv7kbXvF4zoovYit7Jj6xlCtRIkq4Z9dVeYkcRguJ+H/3TqO17TGHWCD/IAeZKeAOxy
TSMg+ILO70cRAOtrOcNwsab9MGeeLFk/u9ENzb1/ATRjOT9ezGvK0iP93mrN1cCAn6Ou2QvEh8aB
LR5lIROfeOEo1gis2IPxiJAS3scE13Z3GjrRsJ2oxEoa9stCrissYoOsU85yaLo2Sit9YAE0YVx7
ybYUD611/J9c2YeNdxBGbcTrkF0MA7K2quUJKFyVknAZNreTpNHTcbkjkfBIX7jDIQt+YliA8hiH
HWAb0EMbCsb22cJjrl6mtKBRGoAB2Zxhkcsw/KOzIclmwBrLnisc8944uXYDviPiATggng+Aw6gO
R9yZB5y2gEOYIU3cRyATeMoD7CErq8y9qxwv8E+P8KW2D2VP9FXx4eTa99Hi22oT2GOu1UmDB1oZ
NS91BhEcMw/XEcmsnlaQ+VAGed9fXxhnhqYrY/9+tDjNazOEuKHZM6bGoJDieZLy7xeT/3FaLw26
f1p3ZfXNYpH4iDQyDz8e6uuapjP3mSU6YWolqldRIROS/pczCKu3CrQiiHEhRfioSqoaWf5vdhji
H7QTjFcgYrefyXJdRjyNM1N10dFr91XlZl+VzsSYeXzdPxbGGlTc9zdbQnjuYE9rVE0xI9NMkJuP
tMoTA/14T9JYgnr4zuo/1TGZrlF2pSB1nYovgpqROhZuAVNT3EACMfeAh/RmkuuzmWPOPdAhzRvi
khxnRBoBonRob3X6me44shU8UzYIWCaR3kx2iW74otQiPfA3V37NiiuPFEutZRmxjfKHMOjqfcdW
8bHiUvvKTr4XhwU8QoP9oJ6En/oYjTFzR7n/i0rXJkpdiKC5d0m2us+LpRTKVLDHwvT7LZZhKhSE
z0LoHJJFjLs5GZ1euQZZHvbC1SvsbgaBMMhLRsRNkeK1Fg0a0eg56VnF4f3wou0+tibzrazC0tDO
UA3KvVKKL9ZMeSynbRAhnoGhZnS3VYsc4p/CNBBiZaPRazY7CztpVhHCfGWUUBMXQDmoN2QlFDQx
w1/q5qF07InlK9/M4DwwZ3/yCRInmcfz7GXLslPt5y2pIxXEDSCbSQ/n7oyHM02RqQ5huyS5TXXl
B/WyksjPOuiL8rnGyu96ygcUTuk6JT8u7Uwaiwku1bRLijdatMn9qqMTmRZSaDeHqHS+48eTmENM
Oy8KoPhMKhkj4Q07oDT9lEWRcrcesD1MaJPQIasZZVOXAz0PUwNd/vl31/J3KS6kDy/UEfQzWkp2
fcisFrUTJyzFSunLRwOtxJBYbrHCOKzZy94inE4ItZ/V7Rz7VBIFS/ZDXuG1cUIClMExVjAqOPRs
efXc4YZJioAF/tItnye/RimuPKg9RUKCDzDP8pS0bG1Py3XFnPv7+xxQ166YJeyDc981GKsEyWky
DqmlMh5+PkWvzpQ5kd8X9+3AO4WLXwXFxxWyVWbfLswU9JuDSgeQ8HMS0bi43QgIwvCHVuUQPIvF
6sKTDJWy5V1GVu9VhNvR9wxQ6BQPmxCgVTYhT/OjKdkz3ZGY2W5q5dGwktMnmgAuL3BHbFabqXu+
qCGJelkdGrYFTheOp08FMzpPda7/5J/glMwYpfcRigEgMKeCwXj9aR0dN711jf1emlfaT1hFuZsP
FVLwchWZg8OI/ImICmpuPsh4iO9XI/oqUiSSKNm2uLKIam1eWXIiyI+mO/YYxy4D+xcskewnpf9n
NKpHYU3WReribBeFjb4ZVyF4B0x8sZcfX7r48FdOwUZa+szq4z0ViktSLYLk0Hjyg89jJotPdLjr
ZTxUILmtu7beYs5YNDtiAv0kQscwQgS4LBoLgd4NDgPgArmj1jYKYMya9G1sVF98ILkopkymf2Wg
GOHNo20Md10pve2El+7xDDF3hvQXo7i1SC3w6R12hwkEwS/VcR7u/M+/MY/TGp9cYETiDW65l27M
gbo3jBEqZr1JkdJf023qW2EjQTTwtcMQGiulyfIwI+qOfGzOE74zGgxDJC46XTjvn4gLaU8RNYCi
fE5whjfP9Dy1dJg6+qDC9VU9dVuHXFqJAPnRsEdevt+3j5pAnsac1DPM1oAG74IORQg1yoQD8PKE
HvDabdJlWEfk0fQDXKBXUxUS5BPFBdQIJxejmygdPjPXDkisJreLdIJvI/1ipiFhuSkDyygDOfg+
poKRt3owliZavaKUhAw38WfmNvnJ33EsOp7LEvixymSNlvAXSxRbSaWgfUwJZ2fkQm2aYudh4Ud1
km8vANhYM519UYEuGUVSnkmchzacT+MIAeXscYOGxoDR5B2ffYPNEKm5dimYKVJhxFPjAdLRvhB3
DYfcP2oSlAfy2QuyX7YY85uFLOQXAM53jSDIErkW4eCQM6KsH2jCLnm47LJ3PV4+R83KlN+UkwPP
jk1XTCLzIGf0kkCVPayBX9Q536ikQ2j6Af7DOWzeDCxiucNxUiqDvyASoS6525fSGAKXfj9FhQwH
KcGqo8MWadyocAqLD7vQyIIrTPCIqnEkk0b0oVH6Gof9um5KuKSMV1gP8KBJfJGtinfvqC6+e60D
1oDho7F+Cnxk8QASgGYry0q584Q50Cgc4QmC0q/itNGM1o9dla/2qOLwKQzneQv2rE/TgJ9KjigO
ddOytUDDSucmuG4ELuRy1891QamTOzEB2J1T0V58xedAUj3ZKFOdUtSlbkRaaxjK8D8/s5MJf7Pj
2ZDN+ou/hEzEN374fi6gbPb22Ce0mmhZjSz1ATN83KRrItIJTheWnkD5gfoOXwew+2oXQfk72QP3
KvTDFDQua1YHO0uF5e8lapWXtQpK/hzaIKwnuBZvXd/YWy06lQZx6LD9FB0nhdlHeKj6m5SaxD+a
7lJpWVmasSck9uZp0Wm6NzuHiKnknxp1Um+gINn+E4PpXNBoQsB+peZtPAVwU0ZeAEQIDHFkhOAg
HQoQJjNW1DY8zFG/m47SVfbRIGu9Oh40cxs2AjsjGtQ7DpsZaCxoYThelrzy29rmpcmWAQ1MF0uw
AL8QgC+Ty+zKD1sWXgREA2gSMV65L9gsaRfDNz5jgmvNoVE6AJjH3SpoF7tZOLHMOtjzVaFz55qN
+SWleVPuoQ9ItkRrMLi0UY3euSLnN/kbrVEbRQhVSRbB/oaJ6s9FtmFu8kWwdHYEx4rRsfLCdMJR
ORuyTAVv/93Lgijtkkuvl1+dhT0gBtOIjSqDLrtk9p8daMYEy0mZwaoktXBej+Ldy86bosfInYrR
O/OkwitB0WUVDlLxyH7O0/hsvYjPa+BS4bihc4beKv2cSnEnFK63Ohykvt0q5F57q2dKxrg5ASR7
6Ehz4+aWpeGo01F+bSSCzrBlLHGnsGqCuU+2SGPGzoR0FicZrVdj9pvsNBs77OOU5a89zFRbmEVy
0MixQfixOJTraPTrqursiTDgXlM3QcflfxUQ8px9krFotq0gcUn7Qv/PmqerOTez4dlNSd6Ncabv
fG+RGDDkjaYnrwfd8uleHuOBA4deCeOCa6Oc/WtEwZJUne83eBZa/opucLZPhCBelJQB5W85o9Hk
ofr5fbImm5g/TidlUOgvSG6AppQUe444DR6T/DMKJT96AQ6F5lTEcnt/daEL5j/4WIWESKT69isP
i7VuV4bTSUOS+NY7Amt9j4zrdsCPUZEiCvtRLc/VBzfU7Mys3NWBypJhOcrocB10aljNVgSTMt91
gzya09jYnQmL+JZvQLEcPGTdg1Zk4qAm3QF72p0cY4tlzNyvAU1vwDj81WEWRxENdNJyne+Wm3O6
XR4AikF1gIGiqHn+j65G/bpru+jG01rI7TyzRI5nmpQjLKnNfPwh1b658cdUE6gQTQwQGLuUrFa3
+yzGsN1yqxSAc8p0opaJUiwUxrEMisCvYlg6BOWK+peIvGzgDqsaQPIVpwy8T2Dhq+PL5uc1RueG
aveGKCMmDShQMtYLR9tuBMcr/KmKX2yeDGCLmPij3Jq0w4WZNkNr3rxH/drC2hHRoGoTHKNje+ly
cEITZJcBkWEuQ0CwH29EYc38sEEe0OAsmbR5eaAMJJSUE//snwgYmkbX/PHM5LIsZVECybx/Wjzr
cXPNwTeDCMzpsakEWQyoH3V2ECXvFOs7ykRN215f1lRydhM4mYiikiP0t0x6xQtA/q6ds2zr1f5i
1KOgot0Zd8Hbj25FBgU+58E0FmJ4pK8fQahzJyvxoJmYODRBU6mNDzj/eaAt/LuDpNiCYrYXrrGH
mHsiWfevTd7Fmqsk2cb1Bg1cp2ceqlU05L4JOB4opgNmBepZKzLBuO+3dgocCYOMCt3wYVxt7fNq
/OPbuOTqP6CTLr/juqcNsnc9zGcIk0HvsbSgWKG0imUVR2BdwJomtd4j2A3e3I8e8B+48maJR+mP
k3RMrI7f66PD7rDkOK/lo7xhU51cLnDQE6QLvmweN7JDi4ACni3DKPwHKlsaGJqTl7N34KoQkE3m
Zev/hcEbkCSKz54LU6zRKPr2CJb4vB+8j+Ms9Z5ENsrjwTRJkx541teRDcO1DFdJqRpd1scS7dXb
71NHgeQDWjkiYS9i17ZToxHlGukKj8N8jD89RjBzrQA+65UCc9hQ5gqTcINferEV7uR6sBkPvzsd
rLPRzasU8FZMY/j2GEfcWPq9hZAFG5nspHbH+HVK8B69R4SHHjdIu88eBIxKFA6GLBfkcUZ81/Bd
6yL8CDuJkHvLx/z4nI0k7xVv5B/mthYEAys06oTh3T19yjqVA3vOtIsLpyVXAqAUvgaF4mxzLpbv
qWZjcdgFwL9e1StVi9sk9jn4LdHYTMNVXOCSsiyLDireBuBTeTV8bF3IgL3sr03C8tcf9wcYnlYp
MPn0Kz3PxNKlBQ3x+BULv01192c7VgBMabUnXmQ7H1k48BsbTA7R0Iqz6Ls46dgguf3DGe6LXjTp
6Q8eZIZYtzRCHSzyzdD5C9K+eXJiD/UaO5vTFYODlZ4b7Q/n8/io/jlaPQxkftqKZnA5ut0guN/o
Pac8n3C6C8kSqvvTj+L8B5MOzAXrRr/37ObMM9bReOBEnIqwc00OaBxHMjuURmzm86HzNNguhQk8
JXbR/rJO5ypy+3siz4IgkNk2fan8sGs3OYnVO5xzCMEhpj52/nqBuolq2ytdjkkuelIQlBHUp/yL
AG4h/df9dYGLMWl6EUwJhq73/UNizIBbiePGiq5YGz5pHrUrorjvHY7NSaogSFgz0hjgQLORDlBO
C0xfiUqxYnyl1y+SkSHnkxNnGHlnE/RGAvfyda81+oY8ceJnyQyLurmyykAeF9jK8Hj8oPSqYHCo
wmN2ZTj2RU4ry43QZJt+YCFNZd1IWC0tNqBXJlE8AYK2FCVPESwwtdSPUGoWQRSMUtoQkrcDgcxS
8aw94mfr0eNJcaaAy9spjvyA57qF2Xch8bFpss+SiWuib9fhH3E6/zvEbDmQhjMYpK+/nkQCXema
8uRLJOcWLEJnLl1jK0tVL3SaOo9fskNUkzRT7rvzVLaX240iGILgxi7fX/K3tPrLvcPujt0avDAp
HgAv3DEOceLfLnFPCaVnkmNqyCC+Bwmo9Tizsl3v9ub23ne6+Ep4dxUPsZxnnmZ8o3bGHtjNnqQK
0x4y+ebCq3l+ryc0j+EqaauTlztZwWPuJGds218WcqJ2HaoJD86Yhf0pwXKvfHnBxKT+Lq6rn+Ah
CLOGHVpDXV1Ua3drN0xppTbCERiB3ipE1ERhm29OAgmeG3g1O9FtvYs+8XOfYZsjUOMfswKvyPMf
H3oz8gFBxQ9Qg7cOCgBeRZDjnvYR+UdtJ/CnggEG1nPo0lANIsGiTaz4FpfJ/wlc9w9eHbbi37i9
jljiWU08ukbAQP90KLL8eXns325SEVp4wkn6UKuOoxvJvA392+rPyl2eyw1w8wrIwfbaF7vDrm2n
y/F8pgsSiDCY3XR+dTbEEiEi2kObKm6ai28gOBYKfraBJwcOkjS+qHdpnPY8v0d/N/XAVmyAZam+
vQJHci3vF0C1NNauDcY4f0j2nCO1KmgPGfZbQvqsXXgb268+lfbiF0YbUHJvcGdBGdI40zdXP/yN
wszEPG94mug5cmO984iC8vrTiOS23UoTWKYgBSVXP97K7yLKGTl/bpxHZ4DU/iRnOlHBRkOqmJLc
gZATAfTS1uwODxU4WSVy46wt71QaPEPDKTBdyEc6vrQQ98DZUuoidgADVssERr0kYPjs3xGUJ3KK
HtFPP3Dbg3AVhxEDtC2BsV3Ycizgc7pdAiJI7uerVmQlApal+HYVpiZ7X+yArkZIDR1IITImDalN
fsZ/pNxx9PocJZegGDvX821odlpY/f67UIWREVdGZOzyauW+8u5Q2lmrGmVDSaZ++WyMvkZeD9oo
jWGJcvqH4fqqgNtrWtDCmAnrWwUWeM5yd34aDvfx9Rkz0ZRM/nPCzSSmgHWENjmH9LcNZADnZYYl
1TnZEiBJRr//6KsOCW3u/Yx7QP0PwGUJI7je7IpogSRrnQm2tm8UirOoThKYcDqI7ITnopQA9FeN
f+UcCK34c66WUKMxozpO1NPa85Ff+GAEN7wimBREDjUupc4rRuUzkWQJ/eWHh2aNF95Ichb4Io/l
BurEtb5rztd1OisU/Lx47slvvMkTFGYn6XpoZw0if1Oa1/UVuY1y5YJNaSeIs/wQjpJaETG3dj8/
UOs9vlv1DumOgey3PMQu2quoT16d3HR6rOYu2T8ETgTtOcreaWsjOE9TZAABWXPOWyfsBjL/pedX
sF6QfLlGMNL288MiJQWNBvTB/d01Ib1YblnAYYkGN7/OFSQT8Qa/j/Q7az1qPJTpk/kClrXKRgE/
N2cQDajIigvCUfpxy5FelGDOf0S42atjFWqVU3iRPH4+tIF2qIafKIW5LPQ+qHP695biTBbKpXL5
b3Bnjr+rA78EgXgMdPHI44u0hTB9g4kQrYVe0TEPM//97s+yG5JYu7OkKuorgUsbWSgbwGBLeSqe
4BftC8OnVoYDsoM7PyxP8XFZfGhczUDx18+q4nQfZzGjE6/6EEm8t3aTDaNTw/zD7CQgwb44hUMx
hbJSgNB/KswvI2UPHoy46yoaj+8KpUjERdQQh2JjlHZnUMZPoV9EgvfyIE3IUvNkByQo3r4OOZPd
mJfmWkESL8yfzocPrrESlyyuEHQG3s55Wx5QxITf4LZLrtm08o3byrk13M9r888ZsdnUbBRxmXb7
MVJ64MuZbVl7cf4OW68Rlq9igEMWE0nViEpahyTNxjU3mNitoGG9LOJTpNR89sU1br17S0mXvt7P
Gh4PwN34HSMZkDjtwAbSWlUUS6XwJQxoP3J5Z2xitQeXUfJbltaarOSYzy7Vela9zYhfV7VX9Zft
49CPTiLVsdMxLFI4MPS45BcogbKtZYSNlQ1ZIugwQayiMhBkgLPAawhSilltWfZ/r6af8rs0PvWn
m2cfVwMWP3jrDgIsbIIXtK5NFVckGmvrwxgzrZ7sBofac6K0zI07wjjCDqPsytByc3eFJzbVBvgL
lP88bHLGuKe8bHt61naRXjH9ecAUxi6OdKl9EO82Ky+3pNGiuPI1N0K+ib/7PbKOUM/4dnWr0Hxd
ibrwhqg4fbXOsn5DrPfjZnnlVq21LZTg54074wGeKs7xcFpEJanhEaXZcCEdK7FQyAjwqET+u73s
dz7uUMdtGfd9WZ0r9rAZVlThOGLJ0lzX7utXO4KO6ouqGMDTojeFHvj+T3VlFxTk0+gdOxyvxX7m
SdjWDJN3ANsFM7QK6KeHDOnaZTVcAoJeDoTilGu76KKIjLwGHEZTC2RpM7JAowwRaqlu5FP0cgPm
4DgJqd7/99kxQG4ojHNRy2XL2ZN+rxjerScDpZUmsmONt2/XPjMrNFRQVY9jsRpPVS9HtQrl/qx3
iKNE5Il0tgMslR48sBikupaNdeo++ATBHwzjD/DhaiNvVCyOVuW/VhPyztNKPw4joHowpaeWlIIz
eLuMWShb9zgsQAEwkqnquNYZNqnlRA9fZmykrVEB8HLsilhPC1qnFpRfkZnEKcHlRR6dfdIPvV8y
7wMHE3NpYATsKhU+E+NXhssCNRnQatkXQW4d29xWWfRN8galkNgUlAWGVsoESJsi0ZyquOZ2smZ2
PJz1C9g8MgcaP5r/GXMMKtWqG+3UEW4t60ik90tGGfDEuPi5wSFLqAJlgFssg6q3smbpsOSSAi5l
/KFY6RTYBgn7yFWIbOdZRji+E8bXTehLiPbezhp7fZZ1KszmiHb5HV8L7WSpH6snisKcd02084IG
PbcZ+v4iiP9MytDn7U6+oaEgoAW9Fh2jNIgApjycTMZB3+aWGPXIIq+zcJ44QSW6A7RXZurgYWUt
wqjnvWSW4GNHkxKGrga+OerRztJF0PflmKNbMjMcoT9pjF9miLScv6NzXTJyPpSs+FqSdYNnFrHj
+whrgKg2NxRg2oJiPwyy1XujBD+B61Bk418iAbSfH+09LhcjjOMT+BEmjFVkWlvk+V6SF9XHlbM6
sHb5MRDC/C1oCdWkYXJGDGl8F5aTcpXBFH82E4ApZ+SJg9rDY+Oi3qSUsOSghi6c3uGxt4+h7hKt
bmTWx7IbW29V8HBzZQ1Kzmw17zge18qZ9RmbvwjER6Od77LKoyGlvYukLIufZCGKyz2bEkgjoSBA
DzQ35oVyUgX8UDjkzieFJ+GSu4D5jmdofvb2QdDkco8yQ4/035E9mSr5i/EvwxGyo6SKSObM2vxX
DwZbByNnCCyC+uIDiZx0IKytlwY0aZOkudPPVUGucG1LL0Fj9p750LhfbF9dxG3Qw4QnY1/BwCot
vu6ESXLs24g2+EamrwKUsUU/eqZkitrSu+djMEOTxc7VwlwkJczXzg7k+73jJJjDuZVK5mur3Nd0
gG3DBC1kW4lDLIS/9g6BLr+Vet9LbYEE42tWFfrQ7ycFEK4OV5NmbMdXKEdqJl2I3eL2qfg5cYfC
O8qdVB9wZsqVoQFvnQVis4glmHN6lsA+vlUrCm/YCY1J2nTVhlFEIClA+I9OHWedxBH5KPU7fPhR
lKsoQRBgHVT7MFkMlMyzcfMcvqbeoq/IVAgdwxJPdQYEvnyq9Yc7YjtqdYlixVrd4wp1IWGdt6wi
5GBz1HGDbJo71yCVoPEVBNto9jwH/WKX1g7bqTRXUWCwzzmHThBey3id5RWZUhjQhdKQLHT58fPQ
acdH6s7PacIbLgWuC3EI7OL/PR2Whg490bjWWDJ4eedXyKXmRgYTenRLaj20AKKTzSqyOSakob+d
BgoJ7FDwDZbB1EHzjHGTdwIULlWj0P8GuG4R3PIKpxkv8yxjPfp1Qba4mE6q0RU1JP+Ynu3eS6/U
umgqMQsCKhf6zuI28jq17eacsZInAZmGl48we5i9B/3lbSMMbVaucYcAUSEiCuI1D2dpoWRXZWMl
WvKmQ29uk3DZn9n6evnF4AuGxYZC7jgQILPf0DPhhSy75/nDRdj8lmc+/6kJgjPatFkEYDCI0Ixo
rCxdS7KbR1zqB8Qc8QFs18cHIcV+u3pHZ39tC3aRfOTKYuBF8X4Q0mo7UFU/gFKx0bB+zGo9YKPL
tDKZ3m+y6qpndNVOJ+KIDkCwh5mIVtX+DuXQWSUdGqLr1UjdnLZa//p9klypQVaA19LUdskmkgru
zuqNKvq3JFdpBUanNgodkIuFRx7oedVf2+VVO+5dgNYBhn7THfZzeSVbwVI3EEd2BRyLUZuYg6ld
Y4XThNA7S1uu+rWrL7vMFicHv3wI575eJVz8RbTY4kmDNFyABRM/1n/SRu/ptbGaRM+etkrPgMwN
keFWUJU5zGDVaQWUJ2q68mIe8pvM9dXIc56RYG1IATScgFB6umoToMbtbuCx3UbFyWKvcwf09Ljw
ugv0bxzpU1LGpFozM7YMnkm2uwG/4bZpYAeaTNReDfUvfa+FZiuYAduWM5TLe4jM7CD60R1+v5Mz
ffhl4a1LoRyUEdDQJyWYQufLcv2QMf2xoxi54QYu8V7D98djDwb/oedPXUTD/OozYSJdRlO1z9pc
DfiGTWGXMjIHxUuLaHKPtGtEtZpG/vc5+EaLeGNzKrgfC8MRxzxrVU8LrEHDn22U5SEORbwwBRA8
Eg83fbQDFHomq6jp0EY2oly/q9shaDsIEGaqxYvus/+ybMjNDawUNQENsHbUIar//Cdg62Nbe7DP
ghrcO7g7Jv1EzdvXXlEg64trcsX9LDs/wEHPTg8kZFNNAfnYASjGN30jYgfDvtfpavUAavuqBieo
Y6uqSgHNNhAyZPRKt3VjqMCBQ/XuNHz76n5XRBL349NVXZd4/UixyPoWmG2jbBP6/q9rNzWrK+Z8
vgMMJqkv0ZTeHSUL8gSWdhgz9LCFaj8LO45Se0ijmDDItnQL5hKEPPOWSm4fq0Wl1EAIaElAoL/W
c0eqnNUsf1PhxqBUYwUNUtq/lKvRTiFRy6rdoZY7x98eyvvL6GO8QHwJlsW7m9LOLtELXwuNx6U8
MiXQ7/344X/shvoYAMaVd/7voeLh0IKTLktcN8+61hRwOoyMVroePcKbLXLWza6vgfswepK9iibi
us0mRPtnHEN/1PJE5XnM6OHYs4KGO5Tz8RYLDUzn0qJ6tgciTjRv4Tl/tKmHZ7ObRF1U8vOrkg56
6u4J6HF0BNG4JVE9X9GctrBMlkn8Evv5D6L9l1Qvs4Q1ytH+1mCAvD4s0N/fa5GF+5m+suHGo05a
PjJoo9ZgogUL3QARgFj0Hjtcjw6bYMqrZADkoqMqN2cVLPSLrS8gCzea+3OnnevvEwYn1Yvl9Ufq
lRimk+ChKj29T3VOGlPrJ1Y1ozsRzc46fw2s8SLKnlDrB0noEOc8+ahnMNX1GbUuXgvPdL2BMAqI
ZwQCq2pwEutwUJjq84a+JyJffvtKmLJbN46QrKv7AiXuFG4TxEvAqjPJ/XNxif3PW593//NZ0Ty7
KeE0Oe7xgllTzJoa7Do9TTjSQqeAJ4OFdeWHKEjzuzlzzAuQg2TJHkzqxWosnNqLP8wUw6IMw5M8
a9Nt2yNmU8P/R8RXPfzuG9I63fBixLkVCheFKNIv+IlsKam/J8WgAYx2vw6azzPlAb1xFP+9bus3
c68pgq1qK75BQQ4qEogWdhPaSG/jBJe6nISCtBRa12+cJZatpNp9jdVepL421bkdXWG81diq4RcF
N3nXoyqiWJC8yalV0njwj7R5GBdZa4iizmMP4MpLkcOM1ZGugtyma24Zbn8bRsqSVZeL6LWuUu7r
1tkfdDLtDtDAcD/hR8fLag8TXV5iHCEgmlPBAAq+NLi3znitNjTv1EXJY7YTOnd+tSUbzL/AiDKR
MnQGz2IIy498rNleB8+VXX6ENsKmFEFQLD7HJJHVwOShv+FSzMcDisBzVjIsMFkEp6hdOqzyPAMI
4XmzdXt6k+ImPP8Gx9wZ0KHlkL4b4plHygH5Gpn4IUlTfluBW2t2tDaqZx14bs8xINE+fM51TPd/
n1gFpYXqlwmkHY/ey2wRiYCNoY2czF6cANEA7URV0cMHyoKVe9h5Dxl25YOuJygKrKG7oRslDxfE
lZcdcOormbxHQxVMRfmsxmHNNrYops0zvPw59APgVekvra1MmacrBd6hCTjKOer8FTB9QgF0HkbT
l2eRUd0/HdAjpUp0kgIU3V6JYQVWDWQQsqDstRCuZRC7FVwrrJD7PB9tbraqecBUXFXpjiwHfDJu
f6lDbbjjMXulFT+uDs9zh7sHUXyqu/vXT5hT8dhGGrwKP1qLeuAhROqTO5YMHviq8zYL3Q8Sy4Yu
CRBFr6C1lrpa6j5j4kaKNaIub9Nd4YvRtAqJwRy/oBtVNzngBlPk1iOyBq/dFfRRJ9hMP4h9+tbi
0uorpKq4TfZ/NjR99X/SBIH6iDXkH+IrzGWgfMp6WR5S8BdUYDJiUxs/AKXhL9f3PMowkfKmNWKJ
oMv0YJCWeWb/z9ARFH9ctkkVYYm3GY6Djuq4uQNJoncGr1J4FcmWci36LG491cRPIcgzPPV8N0Yv
HuwAsHbqt7d3YDjnfjproho4R5PQVliaoQF4o6RTUKAw/p8GcxFX89GTeQ22k5hk2wiEgypzJpyV
i5qlL8Xe8OCDFlC9bzNmS+c4siBkxeG1Spdzryg1WeFZFOrcQ3q2ii5MD6kCZXs0HZfcEEueNzO0
K0F9bSSELJd6XkU48OIA+lebePj4vZydH0QFOO7SG+504KqSjOC3cxKR3Y8JQRYdKn3iKcP1pmdr
X2kh8KYAeE/tC7XSl2kMOXieml8vb0JmpqxwyyH2gxrae8r+Sv9C5vbU1iMLhiFAJIfogqJJ8bZi
5BawZJ3lDu7tUern25jg7/QTXgVBDFJrEKtFda3rFDDut1aAi/yt4zNtLGU8cVqbp6paW2yAkLvj
7+v1+iUqiWTxNHnd5Ly8Coe7frqJbt9KqgeT3RahWJYuZawuGwnKOz/P9VN+Kv16D0pq6Im33ZZV
VB7+kvusKUuo2NCLlvdCT0dvRWd4+q4/ei+/hUEVXnwdL+dmEISzDPC5FSIs7s2n9sD3j69eqqfA
xWhgtH7mi6miRNgQyI4uYRgzGfUxw3mgyjiQULct9iA4Efnwj0q6kM1Bb8PdGiWSJCcDBmL/IxeT
Rbfp4mTcGqhoJQDFf4eApZHL5GU7hXuOXx0FH9XzEvzhnb6Ezyc+mGTAxqiTn8ZRrs8tZrxDNBlJ
d9h/0ytS67JSaRzgA30VL0LKw0Ed+KMfFOUmdI/lO2DkqTwOI/5a3JvF/btaepkKP0Et9nNPPvGq
20PC5Yt1THRaR+kjJwUuP+roFlWQb6Cv30JDJh12sU6emzJ0tXCNCn0KCYO/v/KWjaOJbX/b7VUn
BY+xCz9KLMYsvGwVNZdPJpDg8BeAWj9uh53hqnIhD5G6MaGdUpw1kVud23u8R43hvgFBuSQCzaOQ
BReAmQ71ziHuoFcMAb6GCEBBl7r4YKhzfFCv7LjHkSXtRktxnXgLDtaCYWI5DAgLVwHqW6vK1VlR
JMqJFjHDDgNhts5Dsz9IGxTCazs0KX1O+ty9hHcm6/GDE1EmRE81ycp02o8rkaQqVRPLA0beJ02y
AXhkoRjlcdbdzEx5FAEEdTQ5ZcA/FMTAIXQ2psQ/cmW6DveWcVB5IKyZ4xtNEZ8jty/Lk/tWIllq
z8t0CtmglMNKg2Dmljcmu1HgyEtroHP3i8C9Sat3jF03ydMd2YR6jL2HjPDyoIFRcMKXEO1vdsQZ
hZyDyHfksjhbxLtEX93EKRz05CbYPpEWZPPy9W0ma4NI8Xd/TcsmX6prztHMQQrL1cObmpXZAAJg
4VP9QBTVVQwMTwC2yKcNVdKgHbzRzw/slhHRne841dquA2bJ+F1o08G/C0YRp7SSyNicWHJuXK4w
lQCC4bSxht8T/Tb3P2hZ+To/y/CgFL8rXVoKwM8KCscMAa/i/RK1oLR0I5cwPXZeO0igBbVSSVPT
0yiXcREJCyVXP4qZ4hvSVY0a74t5LfZkyK3jtSvN1PKGST0yxCA/Tili7VQIW55hHhD09Fl/bpVo
dZKHrujDLxLnRqqb4KSlAYbyKkPAPBlk5Bfk7N2JhQKyYccFaLXmMK1koDIKO5tAA0cg5ZBV9yW7
Ogeoy8oh2bYcO7tdbi/KjDE6EuSnh6fWljpd6PI9fp2PKGsIo+0IDEpReL1YBE27Y+Gagusbzgps
sU5qaP4SL0yNS+sLfUHtFDKsBfzYx8ICnq0bupJdNdeGTb5nYX9l7wcf8b0Ybbk2Dq+bIbSRnRP1
vWS3WvkygLo5VWyBB14WtveJxz1RdeLRN5X2yxhy9zOlo8z0ypc5DlidL72KHcfWuEzetB130Vq1
7jQMTtv0H6ZtrMUHqZCTRlCKmJt2rb2rLjYLnbJbhVSbcqrmDaWXx5hNxUVf+Kr7KO6eM2Xt/Fhl
02qPCE12b/V7QZOMNzg4Wb8vkfczEpIl68RZWrRenpDtXPLnnQ4nvN/JC2pA5kkdnjoE2f7dqfw4
p5x4mn7if8AcUSf8jUyExNv3NRASnGhaS00BmjGg7LUTrBsGyvTjnRtj0xEYt02OuJaoS1JIidJQ
WoIY0YhaYs8RNTvTAIQcdIDrwkf7T63eV1AIXTu8CqK4NZdxDNwfiWneJA3z3tEIQRbOUdOOJf+l
XUPRLfT3SQZN3OeN/u2cw1L8nGMK2Lh5VINQAtqR4VEoKLjPrSxop1zmrJx5/RoIywsXWAZDYCvW
+3fMksPpjVFMZ4JnTcZYMrrpJS20M3sB05GEZ2RghumaoItF/JqxoU2K0l+Fxz4WSnmOk7+Z9SoW
ivpXcd7PwL5biIn3CAdbN7UPUEKP9JVgKmoBrt74TkkPDEVdiq1NcGD+aklsgfjswW9iacjOpSEk
EkksNRfApUL7hR1iYj6ehNn1czaxpRMe/KeRAwXMEJXXkkxgNGD93ho1yPYguvCrg2QgDCM9EYkx
soVRaBQKyBKfngGsa2IodNEGoCdJrNF7giDSJgqA7qSJYF4kZffLfy6x6UI71p461tfjGSyAvSG0
KHMZKO79Vxc/na3QsZuH3eNoCbDvho0ezz+X+jVrpHTPs2NN5UYy1LJE2tebcHy2cDYWqYFBM1be
QieOhkvCsnbVzHgRH8gqSSYwaXz2Cix8ZEwocjvvNZw7S2fZqulhgo7yMlpAYxY3TZ5wCxyuSREx
+/4SMNYgMJL82nb6k+SWEWDXg2TG5VFOyAODfRXDIFNy9eLtJ+rdCw3u122kwXItlCNxx87DX0Te
gVUSiUU+v3IAJT8b9GnWlixH1LVBGaSbzHKRJb9fQoRJdo/hnE4o824iGmBLEpm9Z19PXQ/b/8Ei
6KqWpuqoTC5gxNuVTwAWv0CBPeLWmqeP2mlj1p+ai4bJUd82GZ8VUL/Ytnew1HASzLYFYh/rq5O3
LkELhzmrU8xxGRm3cp1Oz3FX0+rufMPrfZQNofisxJdSdZtRSntC6VQhrnk1d8t3S4zAuPI9W4WA
X/MbUOCTPpMKoCfgK1rpFxh/IdQYz4xbQ3eycisrNQ8tZdczljTudV7pDqoRFTzT+OppKa7iOS9+
G4Ta7XuxvEBq0cV0vZot3PH6RytlVqb22gwHoB0etihjug2+NHMdKA86F4J2anEUMZe8j0vQJe4k
aIEdBNDJA9Gklm7zYSW4k2mWrSSBUN3UW2zQR+6F8T9j8BzA+DdF1IEfQgKt77oQG0zyxoMm/qxm
YO3IlByek8qWBgWsZ+5BXkn2IXORYYE0h7ofQHhgmj6xtjhQwFYwBSyA3BCStf2+dUGsksEt7GD2
VxJQ4ERBijiifSvugRXSVVQrXU7pK2sg3aFGmN7t5XI1PvP1uBfp8rizT3/yb3AZHy8XmHtFWHcB
ZFKpx9jU/qgYvcHP3/M8WV+qDKmjQBCXrir0pKSJENGUrGiCf3USodm/RN3gBAtMYj8d3duTlsu2
Ht333OQQRPM9m0DvpNyvqhVfISifsfBJzn1W7iNnK7CsMXPUSmdGZC0XX0ip0d8HP6toUojp863m
zaiiPCrdgDqkK0ViadqEnuPlUKZBxmzogZS3GUNKvtW7QH/w6EMZ2UDxx8DCfwcI5I0/9mLUO2Xr
l8H+l2g8bU+JZaOfrz5k7wkQlLaPHwmb1s0eGSxl7kwY2CMA3GasLT/Y+AbTejPmDKuVRu5cmajD
Bi4rKH0tpkcS8kG/nbAFdi86YbBH1rP5nIhIMVjlHBzuZwG9xDX9NQ//+HTh9YdsQfA0/eXB2Cv0
DttSYaRxq8ViTWZfcAF8tQOyfvwnQZlZG/9XtAxnXllR7FEa2B4LhvfTb81yBH4PhxO3Wk0Fxjm4
aAxozKT+7BHMT9202bSkX67VxyBVMEf+GGTmZHHezlAThSXIh8hq8LhNBIf3rw5R8SZWwg6R8HfP
AQEKXjZL4cHNDFIuH3kZZOKR4hpGpQvgjaM7/8u0IzgY4DkfqMiCCc5IpsFWTDQf5fO4+cJhtyum
EsvM4+dn+xZE3kILR193KrQlpYW/WGysJUcbxYIbGfZsfH4L0gFFQLi++CIlhsycyLYGcbymbaa3
/tP5jpwszPQtjp2HH8b+c/HXqmYMJ+Sr3ErDpw8d4N/4ZbzGMs1cvMTMqaFOzpPCR8mqTEaeiCby
bhharyVvue/TS/xbB1lYQWfey9SlqFYsb1aihCj8xPtaF3hEprOksAwqAleTDVf3MJNHYYXeuTUT
5tzkVbqu+uOsI8s63MKR4+f1DbKahvHKRoYs2Y1IaQa81Kyl8eUzptBSp1jo2euW46LVbkJmyZKw
CJ87sHIf77U/2Z2pIYtMtA3K+hEZWpZeE7ORXOR7Z76Ff7t5+gOv1aiseV2OYw+h2FMEtlQaEv+c
nS0SCzZYwHBqWUNuYZDdrcSIX3uelTErq6QPWjrJ6th6WFCjsuU6VnohMTxVmZOu4DcpBS23v2Tc
umeua8dEJ2UGY7nnjvsQjl/l0BoWSxIA1zitlDyRsvFbKHqVrMDUjhdipfjOSfuWLY9Crq4SM0KR
kOLvyjLNa7ie46y3C8ERFgLevC2CnWJwpReUX3cJS49GqeJ+kXmPUayqB9wtiJxFjOQI2hw5xAW1
P5kYHrjySvIAVGlMCVwgkJIZLi4eUQFE4GJUbJyT+uGOBf/DcYy/l5aiI9+ZaxNWjo1RdVhOlCkl
MQbdxo8exfB5XyDqaH1m7W/El4MdAwXl63XNgYnC8JDE7v1dS1GjivwUAhtj+GFmAtro9XW7+bmK
fYtV8h0vt01GuT8k+GbfrdVcEtK4UxI+VT0tebBJASGsiyVwO8Oi6v+9AfNL2jRrp/QFJmWaJRxM
OuRqZ4ovnmv29bObKBsWaH/WL7UPJ6Su7kpastfEB+EbQkD46kiOHZyyAy5FrmpjNwbvPYj1s3jd
rb41r6ljmLpfLdDNpqXEKft1ATNZnqwg37wDqWWE04ubiunF8hpNIfrwSHU6nCtFQhu5iUgd4Aqg
2JCPFyfcs3vD83WYP9gK5Fgd71NhvuyIanGAsrisx3uM8YycdQjDScMTIa3Ko77VjzUDXUohJqam
QyaHkBhjQAhIdqsE4G+7AEzP03SHc6pTaxBSObzSVAe7J89bfdG9LHeeDekwuk2WLj+CLzd/0NiL
MfLXnsErDCZ5t3JF+IMzBYN0ySMEVFT3Vo1KL5cgOMj3+uQdoIhsmU9WQexcRIN3m6mFJF740riG
+yEOCD2sZcaNWzaGEtyZpCGlldMl3QU2gBILQISDL4efh9f2wsGHOyR2Z3ZTTsqtpSuz0dHbyMJa
u3GETGYQd04FTYph+s5C9AOKbT68SdYXQKY2t283f9s+9qRwSCi5jw4NfLOZuQeCJITXXe93/5zw
RIx/ZIpPYdhwFCSFalGIGV7z2Fq9tvM97WhGNS0LVS47krbwycEHUdc1gCtAumHY+fbuHTbcFyB+
rDDIW5g7yHPfhU+JQwLBKPrloEFfUfDfhG28zLXuU+r2Dm/kTydtQ8gnM9cv4h2iGKPF+FNj30cQ
ztgS1JhWOlw1CuLA4Z46Ni94hM1bW55dTlfY0EBbrD/qsHE+fTnK9XuNACa1ypvJ6J9mvUnSX/kA
hXoEQBaRO12Y3e/NTRXz9RH8rWE5BfsR5YSV2+GCKXpIGw3aJ77vN+ub78F6je5CyU/lgcIZBHj5
Zu4s0eSwvttVBLQ+MI/tj9uvKkzB9oI2OMSGq1Ckh7nVF9An9AR6QZg4L8Jg8V9Srh0DvyM2FOh7
YF+C3GkAwha3lByA/ZCLODxlvox6a+54ot8H55zk9kTkxwNN/opPIS/0CsQ6glVX7ORfNzrMuKzM
AyxNhB6PbDNblhEAla/r0GsfClvTtDQ/vLsILfWl7d2e7O+UmSPQsNpxPnnKSSprfnYVV1ByWpr7
iRSi9WN1x/QSSudtXWVFDrcUzwKRrBE8RhlZ1yRI8v9PW0kf0rPRvPf0KlZr9fgt5vGIjkEpNXQc
PtGnUWFgf5L7v1xcG0zSvk+Ow+taCmHb34dZa/BlLQZt3iIc3w/QfogQ6tjwdLefYoSRXF1T41FM
xFGivEIkONCb363MF8ZeiOGCcwwY8P8KpLBgUwYGmNco8E42oS2shN7MEJydPe9uBlCREmWSfHmd
G+rIO+B67uLIMIK/nilpL9X7um7UAo7YXDBnT0DI/S9xaIDy0BgNCJYsRl8go9wENnbwVqjY+MEu
whGAH4wOObPnCr0t1bh9ycLhVQBESSoigejpf5AXPrWse7U+goi9Ug7ld0ZhZ1IdrOlWTA94ZCfc
HxdVUlAuXvOJiA8/N8BiOfLfuo0j1PxEqZFkJk8EmIPvnr5mbl7HsT+V77rz7HgW38bnvBJS7Grg
wLWaaIFiSBTsuEcDRxAp2FkTcXoq160SFf3bYx0C73mu55EAS6WiVHc4J74p7uf53vq4SePm0Dms
W85qd/RmjZBFZacI8VHolpU27FsYMHHYSApzCn+63eIuyhR5QZGF1SZDc6ue+ni88vSkp/ESsH9+
/3WQsORMvyXDHLqGnT86TRuf78u0SQVh602wh5mavnwZwwy2aRHk56OL7Ap8wvVseQfmtgk8R3f/
t3KM2f3Pp+1nyDDgmNNKR+j4rWm9FqEJgu3oi7i8AsEpmL8kdxw+Aux7KuW44yyDh+WF3NAL8C6P
p3dGzay3Zfdmw6DKwIRlxdtSKtAULEoW86sHzByfD+GWFuHUjFJYYocIPVi1xBLC7r4Ov06UZ09S
qEJico8oGk1Ja0v+7qT7G3/C3mykmr3u4w3nFYmxs7FOPMrc08epGoOvM2kFd1DAtjnaojEzpfA+
8xUAIRxPVXMkl8ahLb3OhIpJZhBBfyXetI1DUDH0VCwbFkpQ9c+aNUbH4NPg1sDnsxbMuZQfvE9T
ZLv6p93Kb72lAd3OzP7jmTBpGPqgjLGoVjHJxnICmSdXHqEWet7wl1XuyXBneEHoHXOh8ewxApLn
FEmQvHy64qhRaWnlT4m/a2pBU4w4FTgDp3cEUJkjktbKA1EOiM0xEy4AJgaLfw5sRaa0NbsA6Y4D
jzbpS7B7VizHgdbVVeexRVu+e4lG+BUcgkwzy32xQwQ712mJiI+Zi4iczxsTuKgnBTYRkbOtpYJm
DfN4dB6DeHMElH3kUaTendMHcLoE3DXqMd2GaWitLn6s9K7pPpZfgCPULKso2JocIRxfpY/Lp3mJ
NizvemDrmYZzeEnGupFf7dAp3sckc8xlNsaBGHt/rTrsRlHQwdUe68pgC5b1E2m/hIc36i+8Vjo0
2s8KqDfOsTkrD1BTSDzF2qnMDI28vlHx2ct60eKgdWEWEb7nAcCvEBqFRjONeDyvrNCd9mDCAJw6
/WWpiddluChvtN8O9vIz1hGz30ILqxbjj7+CTca8woSgDXjq2kKTj9mVq3+xLxek1+dWrubUsOxc
0j9wUNeb1p02iwwosoWr70S8EEYV/cMqteGkBJQ9AtE16C++Fa/EuIWNAD4IpAYsdFDJ1hSSRW0c
8+5JoJ7A7UWHf06jAXd6mE+5GnjqRMe5ZF02UrLtAP1vCP7li3mu+x4JWnO2cE7MK5LRVPuh3Mll
pcpdLP4KCHultEBqNdO6/c9NvZf8iN8g06VRoQcnyI6UquDfsSv98OOS2AIiA29xXnD1cdrB9gz+
MrHTQQvB55pbu2Axrm+orMin7J2yJQ1z1yqXsJAyOtB/b/rF85ni6e5Jv0iawuo2BgNrF9lWOetl
7XA4y/TOPxEQfe5x99YwyI3X6q4i4GsY/4zSx5s1Pequ3zbapymvwljcZ8sR29miNF4hnaNLS6D8
LF4l/W8jNskhr7fTtv4KWNIIi4IUVlSelrCiTEhAUsqlhV/CzIbJ5P/iuMlagvRUrHpIHq1cDqFX
WoKZGAj3LTJGUHocjzvc0FjVEp/IX4gYV2ub+5u43cfu09SL+2sAdAP3xNfKqZpUW436D/wTG1zl
5cWs4SznP+kphOhVEfvvSFhZdMGg2eaPNyqleEXbrZE3vqBQrykByzDnjBiAM/NfS68R7+jq9azD
js7cl5JL1IEEcxgqDWqkne6E2q4dL6iAQffO5G5kS4y99O5XDXMlMz0ehAsEBhMhogaP821I85T5
AYSNRmn8GRWiCLEZvgcsEkxH7sxYyKD+Q5THi5BTHoUOFDqCHAS52UVrWvdUFHGrvds4ut3ymJw1
Tslv5Hj8/YVYqprCtLVSZFgg9EqvP4nxMwLQvZG3vYZtSVVdGMZ8auU+dcF+J/yfK71jrx6UG4le
jYpOMM1dGrHpL8Q3ZwFdOHsBHUsMEcmXstCE1koJnDoL/6BDvun51KrugUM1HDhKrH69eM1mfRBm
MUkeJWfvMw1JEqOOY3X4xrqg4R01l9nL0aITxMEggaWDrxTwFA/Cv29A8ayw7VqVlPm+KmOTE0xp
Xmcf325UxFfJxpC0YUlaX2otNgY/VUMOPuCnwhMHd7lqu77RWCBjy2FI1SU4n8Znk3+F9BeiVU3c
OCTBh29qHjSKAeLwF9McWu+RqtRgJMMq/jPPaPy3KAZsHvoGkpAeLzMKP0CAPFpJqwBiz2xPk7ky
0lZ5jtKVSd75fSjbJ95nZfrqRJCR5s/HfhCOa2VUEtIlySMQ+7qn7LUGOv0I5FxsJz9m4Bl8dGQu
pnQopO+5SS3C0MB20pLu9Lb07kBTXEC741Zy2yG0od+D6cw0vpGtgbONyi8ikh1hvbmvm/EieQ5o
qBcoPcVl/IPZfb95nGkIhNw+2Vn9HLOSVJPU6wFJJGNOfmpH2gbywEZ/sWzvMAYpO7gFpSwjbw6H
lqRgkOprtwb/K7Wz8EbraDTQODYK/YMyurHZccLE8jq4J/Hm/OlhSlRVs1hZPBj9223bcZR3r3rR
ws65qzjVV8qpe5dxHqE9IyI/Jar8MLAT1szaCZNd6dUnx4/Q/PmPH9fO8zUg3PYLIHlRRD6wAf6p
7rLg1DmPi73odXcfzjsGhKBwIizzC5MZi30iJkInJXprTW707LAJv84mm1h4l5qJ0howOtgkWxN6
mL1MrEqcwUcsiY+uIhgU7HQeB4UCM6IA4jJNj5PbTQSDev5Ha1p8beAkMVcpmHuip17weHCoCn79
Q3UAso16sM8nw1VBl/e2uBsij+Ws+AJKz1DTTN3cmn+ezTkvfQ7cIl+BQQeovDG6I2Hxzj/w4sD8
io9731TG83nGl31d89/F++l9SGqCHERQlemzlgWeMWpfFHZlX90biuexhuY7bZlU8s9+TcUOCxkR
s8wNVwCAMxMfWCK1kLVCZM5ZWsV/Wnyb0eJa9GHWBTY9Q6Nh6e+3V3LqjOIQ2yPZjMw10XnahaWF
NLBjkUQOlTG3SXrTmmtgTU5Kgp9hWIymNhiMm7D6LRLgKzTFECmF5FpwzG3kVtwDDDzbPWauEO6i
OOcPUwI8DyaxDI1veNE5Ks+njsgrhEX8IFNFaRzw8J6It12vMyPrAqmioaNgh3EGmcMqnSSzSPaC
ExG6YBNo3CKv2BN3cYubSLiLvaxUWrSrPAzEry+f9+Z6Xj+jxRBY7nUlJVzA1L7NPfGCDEU9tMIn
pgrERjNaAASG98XuCLeM3x2BbskRfH2ezi3YgpwP3LO35HkmYcg0IHP6pFPCGaFIZDiUzCN+/Blo
zRtMrRzrtFAy30gXZi7m+fq/kLrr/F7EYQGaVmCprebIWrAkAk+18c2CoYb+dEg332ItXKQtEz+U
OE5Q7UhOwnxarXEKJ6K2rzG983+FH86jkE4Djl/2gGZBwmbdUhul9mWCDzYiPLB6hKbkmqj2AdAJ
9QMGDpssyxV5cz5UCkulv6QCbfWuEOLsB/HkIQNS9OhYlJ+x14AZtOmJf2WjzDnrqhcT+JySvpDW
710V7OZKvYcVG11rjeEIZRsV14wpsnF0hTaiVXlDP/jQni7DciQqcY8kfuT8Ju2AzdRDRAy520y6
5N3GbXUqdVvYxnkU0AnzD9chZJultPV7PGFQmiJ2rTyUn/pdJ+x0jDaFr0KthWUh+enA85HboGf+
QU+ZdbGjXS6e0PFnJDGX80DJppeIXxsLlZNFGapetcZANpNuNG0tA/uq4lmEhbCTv0+5MqURkxo4
VjIaKayakcgfee2DHvKXc0RFT1bEJSQCUJXE14i6c78SwV3id98C+8PqXmDMRjSwGJTN76+ozfH9
LIeDlmgi1Y5y1R1vKr2lav0NI/bkN1wwLrgud+ciiZG1kUNuxqhy1yT3TX3pvio1x7WSUUBh6f3x
Kjwymsubx1ttVE8O2T2ZlmvWUhcrdD1WeVkS8c2SMaoKOO7AqXz+2+WhJcg32iTqtZHDql55Zc94
QySLmpvBk5F71RehKGGRANpxYE4pV29ZgXY+OLrvOmU54cbPWSUXnkNkOZ6Eu97m5nCqN3NxzFK+
DVZY69gHRVvKInPG0gx9YI40/8OllkLEB8L/kir0RuBC5aBtnyyGxT/m8IABOppzHGxeIBBuqFrE
h6dII9QsG+n24VzMfYX4uKRxJkm/yi+6TWKC+c6VDIiCMm4zqZSYMkn0Y1qm0lhDl0f2BBLQq0x7
hugHG97ENSPxsloSdUcuzBcFnDFL7RctOcct+8EtJxuRx7js2rSBy5X2nrijhwaU2YWvNHBlf8d2
9RVqWqIpR75I/jDzMNnVoh2Mj0X+toedhA+tGyaA8FtIr8IIlQ7p7AwGFPJLnnXpYVZiUnGmgyLk
fBiEk14C8RyvOAKPPzmLDZjj16l9EdVSSvjMIxafEELWbGKTDCVxh5FDSfuS94nMsoEMRv6vvthg
5ysMluo6Gnaxzt2hTCswnT+4U1Ou2c2me8eOSBADuKRG9O+NrLneIyWCjv1HEzHLUdOhFYpM8uMY
fkeM4tRKb+uH7BGJbx941kIcb70CUxEtxtfO/dVO6fMvOPWvldHETtjqoINWIg2FwIe0waAOBytk
zU4cs0SEF7GH2D/MR9dULX1SBdf7j7WvEn19lHOCMqRAnhQyw4uUo8w42ykBFXVPOAoIm+DtRdYl
wa6iY+4/XYMnah2F2vVYSPDhTTIPHFimRiopAc1XY2Z+NjiRi0HhuiQcxv/vUw9SWd9cG2kWKqRY
syK8asSJgnRWlkhsPxv63SZrJaXA4nXpTK5bRpW/BrI1052S/3X83JlS9Jpj4acdSLq334gI7yR3
7oplZaZ3nE5/VNjBpZVZcgk3S0+hlV2ZzIRn5znBqU8mmoqOr7AQV5VZZWnd6M3F+4RBgZToFKJk
OOeE6UqMalyhgKQ5juprKhptKXHk/f/ysFLRIVFzj95ZcyJEYLCQc0M/6Ua4RQLtfonGz7UE69Cm
33IQDLF9TPkS1NpcHla8eVUUHfslZ0q0Eby5dl0wOO2+8//yCQW9jdc/RaqxBnKdWUhWWV01bnSy
jLJ0mWjluI6Szug5nF5Cg+3980VRuk2h49fHpKlGSgVo+lf+5ckJJfEro9A+mQSqXyvrnILmSfvC
NmYiZ5wh68LaDUSwcSJCmd5ksBjG4oMnKw/RqB2eM2HejosqihpQVnLxRO+a2h8L8+XAV0TAE7qB
vJmQJP35vwTt2iIf5hK5LtODv/WuDfzyb/Cix5KCuOYsNNcnNiYOluHqv0n6VMPNHF1dq0cYAq7u
DuXT+maoYjZrpDMaEu/pw9uaA7XXqCQVuuy4bGuqn9v727+EhhvC6TT1WlyQvhBdQdZklYQNMRvN
Sf8ZI3aPViwa2+qmPYjLG1QtYXJHoKsnC7Vcv7B9hE9UyjOqQsMBnGuFGTRyPZm6fnv+VbOsKIOr
TsNhM2lPS4O4aRNJuiVcJixQrdjjMH0+8ApQsHTXltZIswcdvnvmHUzH7akwDjxfvjKoNNEVFpr2
fFuYfCUbS3VbqUmFZfIOjDmYxrucfAB2PZBlDp04mfemSBqLg8Sn7tdw8lqxxo6U1O3hmg8XkgWB
GioHJKFu0OAcCO9fZAoWfVkSkPT0EYPPW9peKeGoD+2E26WSZPZnnfyDUWnJZzofa+x4unpGdpH8
KECKIdC3JTSJzz/NV6iZVKu5ul7jbbf4LZIuBBZEDztJgjE4uyEQSL+ffoQzaj1/qi02u9ncQNM/
YeJv68nHz5sk3LtqlrPLNNrhKieOKawv3D0XG+bomaKXfHm1a6+wKACEOOEpvAI2TNZVh/PBEdqR
Sg1XPLNVIQIOTU8PxCzVFUCmjuy0tHwlukf8PLPUjEBEUetYe+QdXX50y3gJMqNlaxk594UqjMYK
KiyLSb27N+E++ho4DABGDjItZAlcuTMghzl42N6eoRE6NbFlSTp/FBIKgevYPHx11alrWyFaiWEw
ULW7+J4CC2EgAr/ns5UTbdvGo+Z+8Dz1COOkMKfcLGjLrfXN/fXotN9UF8oACRwJOlFT+GOUaUWn
VV2IOHMC2PvhUb99DQCTHQYaadZIxxX1mcXHYTGxlgQ46kpeoxnITXc7LVJB/4t/IqJNw8kLQ9p8
BT6b/+cFrtkTi9QjYRi3xaFfTFgbQ4v4CTNS12canm5Hi5u/mfULeYDoYauuzfNgJ/EX1I1W8//P
tSD1NHQruP0meRHT1QVELI+S1jQ5IV7SyMFG0zg3gjB3KcF5s9TtecSEGygLSmIEXTtyxfopYom5
mSWqCF8Kn3LiU8mp4WE4RTFqRHwbcVGjrqI76aNm7BbQRb2HaiiSoOwWxKmH2TNGm1TUMyh7zblk
RC9cA1cuG45lgvNVunYEy8O77GYGVXROaW9cEpSD0YPx964//FZIdftDp/jUwNMykM/Y0WEC8trt
hDAbZvQ9QIRSL3SNjz6t0wMWS9Xo0ZzFbCZxTvXRQJ5IysrxLvCMrc8xPeVDWzrHh5/by9U1HyXM
2Xuqk8/A2kOJS8d5hhb5YqA1O81uIHI0xXP/kUnlMKG27ALxOfT/M/j3GEw386SjK3u2SgJ5gPJC
Af2T0J9xS1wSmrOZQ/DlnFsqoajeKooB6BaLsNjILetyv0TWVNdKROmIdBHAl0t6k58XDsGf1Lbi
9OKk7N68MXEVhZsnCb//K0dYkfcrkIfFj316vZg84aF6j84KqY3UplnSaCg0M6DOCRaVcPv5fKXo
CsDOT3ScgAOoP9iaFgcWhxQ6w7bfGXwdD28/GjIeALiFYOZUKhEQwGb+uEzKtzH9R/tN2ttybsBk
vTtiDXF6cYQzeuTOkNAU6gMn2BWlsn/H7I2uo99WL+K0NoNZ0eutgiqxy7vU5N49QDHkeUEJAUUD
20+soXgfn6druw6KSWwpuIXX6kHl4bgOPcmqnGMH9Pobxfnssd5f4ezxZ9FkD6kmLwwk1KabsUsI
ff9auIQM+bhG56wGITWNw1cRRgwzjcWHe4n0nUWIOx08Nm4MRKTz9GEIfzLVVEy5qFo+bLzi8C9E
LbzIWhS55jgPL6gIGSX/Z+hwogYLIxV1FKUS9rbgck2hIT6xCXjPCuMi1n207Z8/4/wShhLwIdQb
XIg+YVzV9atPywC43GYDkbMa/Qybmt3YUSKVssG+sPAWgFmDL0xpFTO4yt9z6e8GhIaCSl2+nG8Z
9vuLJv5UgxktCOgy8CVdiRqahYzFSrAVaUyI7raExCTdHoJ4xtKSzzV6043n6aDm2fIagZQfZ1D0
vnSVZBXv1JNdhhLrHJQ2APfrc99lXcS15rZ6lmJrjS+gLddIUMLxJnqCId65ijP4oi0UYqOkf2Wh
hd0w3+h+tza7ATpM20hE4VaBIAwN7lulTnjgF1318tFTRIewd6tMCzpUgCbnmnqDMoGWRtHWSQG4
RL4VfE8MuJkYuQnk59fUJCfjWE4XuwBnqrgJQ7aZCNQajroL4366lyB40wJSmWulmIFbQ7NJxR0h
TS0MxxpoBwCqOs+9gAoHajAmvneYjlNpZGYzTUt1Xs9S0lYlrCuyMlb1+FlMnXxf0+QUlfpAEEIS
t24zIBsbmIyiN3tnWzm2UpouEbQTUNfWGXw4cd9pO3jDaqykRAryNIu6i9KtIExN036iNJPc6b3r
ySk3CqaXLTJINdXhAQPRvZAiD9KbHDRz1rL05aC1xA+TCNO0MFB3uPBS8XBXsSDRatG/sYa8FI5m
9WlAuuqZS9brz4QYYFK1JiLo+GXj0zL9xH0ohirhua0N3kylMk6ozU2h1DOAkIIF09LxuyKEIDuu
+W+BDxj7eepW930Yx3xe7Nxj9/rnXCsAZ4FEUhm3+2esHN0D9q/y57ChSCvW3FDCh4TufvWIUc5H
GzBI9GG1Jw9w+PgHJNi4txahfTnliTFZsT8eEll3TIXGWRF90naCvQLDFO842kCY2ydWNaJTC5DZ
fZ6i9Cwjaa5SG9EhLv548y6S0q/ca7WlvzXC/DAcsWDyyxAoMUuZIkBkcYLHSf6daDKEIlMKgM/X
6wpbkArCHsMCyF9zx2u40z8dfExVmwV/gWt3inhJgf2RLy5cJCrumYbnnN4q9YOSHua93o2G/qPf
Rlyn3zi5DMeJLOzTlGc2xzswRgXunWQKQTm2uwBs2pAey2UN/gA0NySQaGd3BxrHwnHBgEPqJ5lL
n/gM2pmvKX4vDZ584RmVD1bzH3Ppf8NiAtig6i60aRbh4F3h985W6kURMUk/K9dgd+cdwvNEwja4
OIeI/TPX1OnqTMIrZopQ3rYfwuEHE2y5Mz6O38myqesvwTjLI/GVXUvKPniHjjD3XUkiD9hkVO3V
wLSqCcyHJwAQBEc40bcggHLyTTx4z6cnfH6op7/AX8qSHaDkq8u8/b+g3jofxAsjvwOXuKOKiBRk
CZwjcmqa1Q/DzH+38uATWYRYv+X8jYt6OA87wb2FHYM/i08mLswLvlhAf2vd9x7sb17IT1QQaGIs
7gI8Ocga79+/0viqdIcumjRyxksqqFjzoSDCiVOIVwUiYXe4n43gcsCVYj65qb9wUwHJK82Bfq53
dQ2gRdMLYk6Gq3Uy6+5FpVr+Ihaph218Qd4FjnkCGlYRgu1k6sOPGuTdyYEl8+nu1nTYYW+3Dd4b
QN2L1em4m6Wq3ws7529e3XbrXB3Bv4nD56j0P8iNxf6YTC4LncRPFSI9Z34ssjGzQEU3bkwTz70V
u3u9PRC+8C6kxRyHOyyje0V0UPYOJxbGo8ctGXvd79FSfMJibRKjNsFwi/WUGriD2aVothRstZkX
+auXoeJDti6Y30RWn3jhbXY728Xn5W3wyrjC0iKcXWCCee0fK+iL+thggWCAOBD86l3KoWX6xScJ
8/+sViKVaJWDdmngbrvgqWcu+XZXlHtvale+0K0olPCuuSeL8J1QbAHgOcOfwOofqadGK1xNqjuV
TOWxxCaOUcvcUyGW2IM85btAjygp5IikL2ZteEtqDYgATA3nGWtVwCVuYMrJY1MDkDDTmxmPSrTL
iBKEYvh+OO/i2CEAlvQHfnQ92S4g+Bo7L9VgVBvB8W5YZvab7uTOgqZTylvcLZcrUD43QDS0q5ee
62PLU5TQjCUisi2S+7DLrn/L1PZ7IMMjTWyG0Zqj1Q5wdkclp5vVLKMoZfnIcs1q9+qUIR9dLdjx
eJDaif5FTQUXGoc/X232jW9GnJh2bODW/9NHHRWlXXqiUMk74vW0o1PvUHhexAW+mXvm6DNcR2C6
CLFIt/93SAi0x7Xua3TLt2uPeIq5v+XV0Ka4hAHTBalleO4CHEChb70uv7N95r275yxdXrAJ7x3p
sxhLIc8fTFhIWDRws/lg0spAkeD3rYvMF5CcYZVtF+drrI8lpsbimtJb0IGnCBwmniKoLd8p85bJ
l/AfQ/kxOl3vkUq50l23MwhkwP+6s/ij4gOpBlA+lzwrGxbnTy5qkjxP7Kriu0b6/WnrlVBuTLNm
89HIBKN72i05zQ==
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
