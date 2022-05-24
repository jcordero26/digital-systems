`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:05:26 10/22/2016
// Design Name:   top
// Module Name:   C:/Users/Joao/Documents/ISE projects/spkey/testtop.v
// Project Name:  spkey
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testtop;

		// Inputs
	reg clk;
	reg reset;
	reg ps2d;
	reg ps2c;
	reg rx_en;

	// Outputs
	wire [7:0] regdata;
	wire [2:0] s;
	wire [7:0] dout1;
	wire rx_done_tick;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk),
		.reset(reset),
		.ps2d(ps2d),
		.ps2c(ps2c),
		.rx_en(rx_en),.rx_done_tick(rx_done_tick),
		.led(regdata),.dout1(dout1)
	);
	always #10 clk=~clk;
	always #4000 ps2c=~ps2c;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		ps2d = 1;
		ps2c = 0;
		rx_en = 1;

		// Wait 100 ns for global reset to finish
		#100 reset = 0;  #100 reset = 1;		  #100 reset = 0;
  
			#8000
			ps2d = 1;
			#80000 ps2d = 0; //inicio 
			//byte de datos
			#8000 ps2d = 1;
			#8000 ps2d = 0;
			#8000 ps2d = 0;
			#8000 ps2d = 0;
			#8000 ps2d = 0;
			#8000 ps2d = 0;
			#8000 ps2d = 1;
			#8000 ps2d = 1;
			//paridad
			#8000 ps2d = 0;
			//final
			#8000 ps2d = 1;
			#180000

		$stop;


	end
endmodule
