////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: word_adder.v
// /___/   /\     Timestamp: Mon Apr  6 15:30:03 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/word_adder.ngc /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/word_adder.v 
// Device	: 6vlx75tff484-3
// Input file	: /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/word_adder.ngc
// Output file	: /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/word_adder.v
// # of Modules	: 1
// Design Name	: word_adder
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module word_adder (
a, b, s
)/* synthesis syn_black_box syn_noprune=1 */;
  input [15 : 0] a;
  input [15 : 0] b;
  output [15 : 0] s;
  
  // synthesis translate_off
  
  wire \blk00000001/sig00000050 ;
  wire \blk00000001/sig0000004f ;
  wire \blk00000001/sig0000004e ;
  wire \blk00000001/sig0000004d ;
  wire \blk00000001/sig0000004c ;
  wire \blk00000001/sig0000004b ;
  wire \blk00000001/sig0000004a ;
  wire \blk00000001/sig00000049 ;
  wire \blk00000001/sig00000048 ;
  wire \blk00000001/sig00000047 ;
  wire \blk00000001/sig00000046 ;
  wire \blk00000001/sig00000045 ;
  wire \blk00000001/sig00000044 ;
  wire \blk00000001/sig00000043 ;
  wire \blk00000001/sig00000042 ;
  wire \blk00000001/sig00000041 ;
  wire \blk00000001/sig00000040 ;
  wire \blk00000001/sig0000003f ;
  wire \blk00000001/sig0000003e ;
  wire \blk00000001/sig0000003d ;
  wire \blk00000001/sig0000003c ;
  wire \blk00000001/sig0000003b ;
  wire \blk00000001/sig0000003a ;
  wire \blk00000001/sig00000039 ;
  wire \blk00000001/sig00000038 ;
  wire \blk00000001/sig00000037 ;
  wire \blk00000001/sig00000036 ;
  wire \blk00000001/sig00000035 ;
  wire \blk00000001/sig00000034 ;
  wire \blk00000001/sig00000033 ;
  wire \blk00000001/sig00000032 ;
  wire \blk00000001/sig00000031 ;
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000031  (
    .I0(a[15]),
    .I1(b[15]),
    .O(\blk00000001/sig00000040 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000030  (
    .I0(a[14]),
    .I1(b[14]),
    .O(\blk00000001/sig00000032 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002f  (
    .I0(a[13]),
    .I1(b[13]),
    .O(\blk00000001/sig00000033 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002e  (
    .I0(a[12]),
    .I1(b[12]),
    .O(\blk00000001/sig00000034 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002d  (
    .I0(a[11]),
    .I1(b[11]),
    .O(\blk00000001/sig00000035 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002c  (
    .I0(a[10]),
    .I1(b[10]),
    .O(\blk00000001/sig00000036 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002b  (
    .I0(a[9]),
    .I1(b[9]),
    .O(\blk00000001/sig00000037 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000002a  (
    .I0(a[8]),
    .I1(b[8]),
    .O(\blk00000001/sig00000038 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000029  (
    .I0(a[7]),
    .I1(b[7]),
    .O(\blk00000001/sig00000039 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000028  (
    .I0(a[6]),
    .I1(b[6]),
    .O(\blk00000001/sig0000003a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000027  (
    .I0(a[5]),
    .I1(b[5]),
    .O(\blk00000001/sig0000003b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000026  (
    .I0(a[4]),
    .I1(b[4]),
    .O(\blk00000001/sig0000003c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000025  (
    .I0(a[3]),
    .I1(b[3]),
    .O(\blk00000001/sig0000003d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000024  (
    .I0(a[2]),
    .I1(b[2]),
    .O(\blk00000001/sig0000003e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000023  (
    .I0(a[1]),
    .I1(b[1]),
    .O(\blk00000001/sig0000003f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000022  (
    .I0(a[0]),
    .I1(b[0]),
    .O(\blk00000001/sig00000041 )
  );
  MUXCY   \blk00000001/blk00000021  (
    .CI(\blk00000001/sig00000031 ),
    .DI(a[0]),
    .S(\blk00000001/sig00000041 ),
    .O(\blk00000001/sig00000050 )
  );
  MUXCY   \blk00000001/blk00000020  (
    .CI(\blk00000001/sig00000050 ),
    .DI(a[1]),
    .S(\blk00000001/sig0000003f ),
    .O(\blk00000001/sig0000004f )
  );
  MUXCY   \blk00000001/blk0000001f  (
    .CI(\blk00000001/sig0000004f ),
    .DI(a[2]),
    .S(\blk00000001/sig0000003e ),
    .O(\blk00000001/sig0000004e )
  );
  MUXCY   \blk00000001/blk0000001e  (
    .CI(\blk00000001/sig0000004e ),
    .DI(a[3]),
    .S(\blk00000001/sig0000003d ),
    .O(\blk00000001/sig0000004d )
  );
  MUXCY   \blk00000001/blk0000001d  (
    .CI(\blk00000001/sig0000004d ),
    .DI(a[4]),
    .S(\blk00000001/sig0000003c ),
    .O(\blk00000001/sig0000004c )
  );
  MUXCY   \blk00000001/blk0000001c  (
    .CI(\blk00000001/sig0000004c ),
    .DI(a[5]),
    .S(\blk00000001/sig0000003b ),
    .O(\blk00000001/sig0000004b )
  );
  MUXCY   \blk00000001/blk0000001b  (
    .CI(\blk00000001/sig0000004b ),
    .DI(a[6]),
    .S(\blk00000001/sig0000003a ),
    .O(\blk00000001/sig0000004a )
  );
  MUXCY   \blk00000001/blk0000001a  (
    .CI(\blk00000001/sig0000004a ),
    .DI(a[7]),
    .S(\blk00000001/sig00000039 ),
    .O(\blk00000001/sig00000049 )
  );
  MUXCY   \blk00000001/blk00000019  (
    .CI(\blk00000001/sig00000049 ),
    .DI(a[8]),
    .S(\blk00000001/sig00000038 ),
    .O(\blk00000001/sig00000048 )
  );
  MUXCY   \blk00000001/blk00000018  (
    .CI(\blk00000001/sig00000048 ),
    .DI(a[9]),
    .S(\blk00000001/sig00000037 ),
    .O(\blk00000001/sig00000047 )
  );
  MUXCY   \blk00000001/blk00000017  (
    .CI(\blk00000001/sig00000047 ),
    .DI(a[10]),
    .S(\blk00000001/sig00000036 ),
    .O(\blk00000001/sig00000046 )
  );
  MUXCY   \blk00000001/blk00000016  (
    .CI(\blk00000001/sig00000046 ),
    .DI(a[11]),
    .S(\blk00000001/sig00000035 ),
    .O(\blk00000001/sig00000045 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig00000045 ),
    .DI(a[12]),
    .S(\blk00000001/sig00000034 ),
    .O(\blk00000001/sig00000044 )
  );
  MUXCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig00000044 ),
    .DI(a[13]),
    .S(\blk00000001/sig00000033 ),
    .O(\blk00000001/sig00000043 )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig00000043 ),
    .DI(a[14]),
    .S(\blk00000001/sig00000032 ),
    .O(\blk00000001/sig00000042 )
  );
  XORCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig00000050 ),
    .LI(\blk00000001/sig0000003f ),
    .O(s[1])
  );
  XORCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig0000004f ),
    .LI(\blk00000001/sig0000003e ),
    .O(s[2])
  );
  XORCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig0000004e ),
    .LI(\blk00000001/sig0000003d ),
    .O(s[3])
  );
  XORCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig0000004d ),
    .LI(\blk00000001/sig0000003c ),
    .O(s[4])
  );
  XORCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig0000004c ),
    .LI(\blk00000001/sig0000003b ),
    .O(s[5])
  );
  XORCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig0000004b ),
    .LI(\blk00000001/sig0000003a ),
    .O(s[6])
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig0000004a ),
    .LI(\blk00000001/sig00000039 ),
    .O(s[7])
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig00000049 ),
    .LI(\blk00000001/sig00000038 ),
    .O(s[8])
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig00000048 ),
    .LI(\blk00000001/sig00000037 ),
    .O(s[9])
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig00000047 ),
    .LI(\blk00000001/sig00000036 ),
    .O(s[10])
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig00000046 ),
    .LI(\blk00000001/sig00000035 ),
    .O(s[11])
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig00000045 ),
    .LI(\blk00000001/sig00000034 ),
    .O(s[12])
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000044 ),
    .LI(\blk00000001/sig00000033 ),
    .O(s[13])
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000043 ),
    .LI(\blk00000001/sig00000032 ),
    .O(s[14])
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000042 ),
    .LI(\blk00000001/sig00000040 ),
    .O(s[15])
  );
  XORCY   \blk00000001/blk00000003  (
    .CI(\blk00000001/sig00000031 ),
    .LI(\blk00000001/sig00000041 ),
    .O(s[0])
  );
  GND   \blk00000001/blk00000002  (
    .G(\blk00000001/sig00000031 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule

`endif

// synthesis translate_on
