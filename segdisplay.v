`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:56 03/19/2013 
// Design Name: 
// Module Name:    segdisplay 
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
module segdisplay(
	input wire [3:0] score,
	input wire segclk,		//7-segment clock
	input wire clr,			//asynchronous reset
	output reg [6:0] seg,	//7-segment display LEDs
	output reg [3:0] an		//7-segment display anode enable
	);

// constants for displaying letters on display
reg [6:0] segments;

// Finite State Machine (FSM) states
parameter left = 2'b00;
parameter midleft = 2'b01;
parameter midright = 2'b10;
parameter right = 2'b11;

// state register
reg [1:0] state;

// FSM which cycles though every digit of the display every 2.62ms.
// This should be fast enough to trick our eyes into seeing that
// all four digits are on display at the same time.
	always @ (*)
			case(score)
				4'd0: segments = 7'b1000000;
				4'd1: segments = 7'b1111001;
				4'd2: segments = 7'b0100100;
				4'd3: segments = 7'b0110000;
				4'd4: segments = 7'b0011001;
				4'd5: segments = 7'b0010010;
				4'd6: segments = 7'b0000010;
				4'd7: segments = 7'b1111000;
				4'd8: segments = 7'b0000000;
				4'd9: segments = 7'b0010000;
				4'd10: segments = 7'b0001000;
				4'd11: segments = 7'b0000011;
				4'd12: segments = 7'b1000110;
				4'd13: segments = 7'b0100001;
				4'd14: segments = 7'b0000110;
				4'd15: segments = 7'b0001110;
				default: segments = 7'b1111111;
			endcase
			
always @(posedge segclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		seg <= 7'b1111111;
		an <= 7'b1111;
		state <= left;
	end
	// display the character for the current position
	// and then move to the next state
	else

	begin
		case(state)
			left:
			begin
				seg <= 7'b1000000;
				an <= 4'b0111;
				state <= midleft;
			end
			midleft:
			begin
				seg <= 7'b1000000;
				an <= 4'b1011;
				state <= midright;
			end
			midright:
			begin
				seg <= 7'b1000000;
				an <= 4'b1101;
				state <= right;
			end
			right:
			begin
				seg <= segments;
				an <= 4'b1110;
				state <= left;
			end
		endcase
	end
end

endmodule
