`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:48:00 05/27/2016
// Design Name:   NERP_demo_top
// Module Name:   E:/CS M152A/Flappy Bird/top_tb.v
// Project Name:  NERP_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: NERP_demo_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg jump_btn;
	reg enable_btn;
	reg rst_btn;
	reg clk;
	reg clr;

	// Outputs
	wire [6:0] seg;
	wire [3:0] an;
	wire dp;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire hsync;
	wire vsync;

	// Instantiate the Unit Under Test (UUT)
	NERP_demo_top uut (
		.jump_btn(jump_btn), 
		.enable_btn(enable_btn), 
		.rst_btn(rst_btn), 
		.clk(clk), 
		.clr(clr), 
		.seg(seg), 
		.an(an), 
		.dp(dp), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.hsync(hsync), 
		.vsync(vsync)
	);

	initial begin
		// Initialize Inputs
		jump_btn = 1;
		enable_btn = 0;
		rst_btn = 1;
		clk = 0;
		clr = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst_btn = 0;
		clr = 0;
        
		// Add stimulus here

	end
	always # 5 clk = ~clk;
	
	
      
endmodule

