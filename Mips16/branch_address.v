`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:05 04/06/2015 
// Design Name: 
// Module Name:    branch_address 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module branch_address(pc, immediate, branch_address);
input [9:0] pc;
input [6:0] immediate;
output [9:0] branch_address;

// branch_adder adds a 10-bit unsigned input and a 7-bit signed input
// the adder allows for usigned overflow and underflow
// the test bench demonstrates a case each for overflow and underflow
branch_adder a1 (.a(pc), .b(immediate), .s(branch_address));

endmodule
