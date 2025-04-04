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
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
9CXE4Fny2yeNMw==
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
