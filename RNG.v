`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:28 05/11/2016 
// Design Name: 
// Module Name:    RNG 
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
module RNG( clk, out
    );
	 
	 input clk;
	 output reg [7:0] out;
	 
	 reg [20:0] rand;
	 initial rand = ~(20'b0);
	 reg [20:0] rand_next;
	 wire feedback;
	 
	 assign feedback = rand[20] ^ rand[17];
	 
	 always @ (posedge clk)
	 begin
		rand <= rand_next;
		out = rand[7:0];
	 end
	 
	 always @ *
	 begin
		rand_next = {rand[19:0], feedback};
	 end

endmodule
