////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: branch_adder.v
// /___/   /\     Timestamp: Mon Apr  6 21:35:12 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/branch_adder.ngc /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/branch_adder.v 
// Device	: 6vlx75tff484-3
// Input file	: /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/branch_adder.ngc
// Output file	: /home/preston/Documents/MIPSProcessor/Mips16/ipcore_dir/tmp/_cg/branch_adder.v
// # of Modules	: 1
// Design Name	: branch_adder
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

module branch_adder (
a, b, s
)/* synthesis syn_black_box syn_noprune=1 */;
  input [9 : 0] a;
  input [6 : 0] b;
  output [9 : 0] s;
  
  // synthesis translate_off
  
  wire \blk00000001/sig0000002f ;
  wire \blk00000001/sig0000002e ;
  wire \blk00000001/sig0000002d ;
  wire \blk00000001/sig0000002c ;
  wire \blk00000001/sig0000002b ;
  wire \blk00000001/sig0000002a ;
  wire \blk00000001/sig00000029 ;
  wire \blk00000001/sig00000028 ;
  wire \blk00000001/sig00000027 ;
  wire \blk00000001/sig00000026 ;
  wire \blk00000001/sig00000025 ;
  wire \blk00000001/sig00000024 ;
  wire \blk00000001/sig00000023 ;
  wire \blk00000001/sig00000022 ;
  wire \blk00000001/sig00000021 ;
  wire \blk00000001/sig00000020 ;
  wire \blk00000001/sig0000001f ;
  wire \blk00000001/sig0000001e ;
  wire \blk00000001/sig0000001d ;
  wire \blk00000001/sig0000001c ;
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001f  (
    .I0(a[9]),
    .I1(b[6]),
    .O(\blk00000001/sig00000025 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001e  (
    .I0(a[8]),
    .I1(b[6]),
    .O(\blk00000001/sig0000001d )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001d  (
    .I0(a[7]),
    .I1(b[6]),
    .O(\blk00000001/sig0000001e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001c  (
    .I0(a[6]),
    .I1(b[6]),
    .O(\blk00000001/sig0000001f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001b  (
    .I0(a[5]),
    .I1(b[5]),
    .O(\blk00000001/sig00000020 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk0000001a  (
    .I0(a[4]),
    .I1(b[4]),
    .O(\blk00000001/sig00000021 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000019  (
    .I0(a[3]),
    .I1(b[3]),
    .O(\blk00000001/sig00000022 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000018  (
    .I0(a[2]),
    .I1(b[2]),
    .O(\blk00000001/sig00000023 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000017  (
    .I0(a[1]),
    .I1(b[1]),
    .O(\blk00000001/sig00000024 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000001/blk00000016  (
    .I0(a[0]),
    .I1(b[0]),
    .O(\blk00000001/sig00000026 )
  );
  MUXCY   \blk00000001/blk00000015  (
    .CI(\blk00000001/sig0000001c ),
    .DI(a[0]),
    .S(\blk00000001/sig00000026 ),
    .O(\blk00000001/sig0000002f )
  );
  MUXCY   \blk00000001/blk00000014  (
    .CI(\blk00000001/sig0000002f ),
    .DI(a[1]),
    .S(\blk00000001/sig00000024 ),
    .O(\blk00000001/sig0000002e )
  );
  MUXCY   \blk00000001/blk00000013  (
    .CI(\blk00000001/sig0000002e ),
    .DI(a[2]),
    .S(\blk00000001/sig00000023 ),
    .O(\blk00000001/sig0000002d )
  );
  MUXCY   \blk00000001/blk00000012  (
    .CI(\blk00000001/sig0000002d ),
    .DI(a[3]),
    .S(\blk00000001/sig00000022 ),
    .O(\blk00000001/sig0000002c )
  );
  MUXCY   \blk00000001/blk00000011  (
    .CI(\blk00000001/sig0000002c ),
    .DI(a[4]),
    .S(\blk00000001/sig00000021 ),
    .O(\blk00000001/sig0000002b )
  );
  MUXCY   \blk00000001/blk00000010  (
    .CI(\blk00000001/sig0000002b ),
    .DI(a[5]),
    .S(\blk00000001/sig00000020 ),
    .O(\blk00000001/sig0000002a )
  );
  MUXCY   \blk00000001/blk0000000f  (
    .CI(\blk00000001/sig0000002a ),
    .DI(a[6]),
    .S(\blk00000001/sig0000001f ),
    .O(\blk00000001/sig00000029 )
  );
  MUXCY   \blk00000001/blk0000000e  (
    .CI(\blk00000001/sig00000029 ),
    .DI(a[7]),
    .S(\blk00000001/sig0000001e ),
    .O(\blk00000001/sig00000028 )
  );
  MUXCY   \blk00000001/blk0000000d  (
    .CI(\blk00000001/sig00000028 ),
    .DI(a[8]),
    .S(\blk00000001/sig0000001d ),
    .O(\blk00000001/sig00000027 )
  );
  XORCY   \blk00000001/blk0000000c  (
    .CI(\blk00000001/sig0000002f ),
    .LI(\blk00000001/sig00000024 ),
    .O(s[1])
  );
  XORCY   \blk00000001/blk0000000b  (
    .CI(\blk00000001/sig0000002e ),
    .LI(\blk00000001/sig00000023 ),
    .O(s[2])
  );
  XORCY   \blk00000001/blk0000000a  (
    .CI(\blk00000001/sig0000002d ),
    .LI(\blk00000001/sig00000022 ),
    .O(s[3])
  );
  XORCY   \blk00000001/blk00000009  (
    .CI(\blk00000001/sig0000002c ),
    .LI(\blk00000001/sig00000021 ),
    .O(s[4])
  );
  XORCY   \blk00000001/blk00000008  (
    .CI(\blk00000001/sig0000002b ),
    .LI(\blk00000001/sig00000020 ),
    .O(s[5])
  );
  XORCY   \blk00000001/blk00000007  (
    .CI(\blk00000001/sig0000002a ),
    .LI(\blk00000001/sig0000001f ),
    .O(s[6])
  );
  XORCY   \blk00000001/blk00000006  (
    .CI(\blk00000001/sig00000029 ),
    .LI(\blk00000001/sig0000001e ),
    .O(s[7])
  );
  XORCY   \blk00000001/blk00000005  (
    .CI(\blk00000001/sig00000028 ),
    .LI(\blk00000001/sig0000001d ),
    .O(s[8])
  );
  XORCY   \blk00000001/blk00000004  (
    .CI(\blk00000001/sig00000027 ),
    .LI(\blk00000001/sig00000025 ),
    .O(s[9])
  );
  XORCY   \blk00000001/blk00000003  (
    .CI(\blk00000001/sig0000001c ),
    .LI(\blk00000001/sig00000026 ),
    .O(s[0])
  );
  GND   \blk00000001/blk00000002  (
    .G(\blk00000001/sig0000001c )
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
