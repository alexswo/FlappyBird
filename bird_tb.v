`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:48:23 05/18/2016
// Design Name:   bird
// Module Name:   E:/CS M152A/Week 8/NERP_demo/bird_tb.v
// Project Name:  NERP_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bird
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bird_tb;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg jump;
	reg [1:0]  fall_accel;
	reg state;

	// Outputs
	wire [9:0] y_coord;

	// Instantiate the Unit Under Test (UUT)
	bird uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.jump(jump), 
		.state(state),
		.fall_accel(fall_accel), 
		.y_coord(y_coord)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		enable = 1;
		jump = 1;
		fall_accel = 1;
		state = 0;
		// Wait 100 ns for global reset to finish
		#100;
		state = 1;
		enable = 1;
		clk = 0;
		rst = 0;
		enable = 1;
		jump = 0;
		fall_accel = 1;
      //jump = 1;
		// Add stimulus here
	end
always #5 clk = ~clk;
	
	
      
endmodule

