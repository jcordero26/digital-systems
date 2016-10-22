`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    21:42:30 10/20/2016
// Design Name:
// Module Name:    top
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
module topkey(
  input clk,reset,
  input ps2d,ps2c, rx_en,
  output wire [7:0] dout1,
  output wire rx_done_tick,
  output  a,b,c,d,up,down,left,right
  );

    wire [7:0] dout;
	  assign dout1=dout;
//	 wire rx_done_tick;



     ps2_portreceiver  PS2(
     .clk(clk),.reset(reset),
     .ps2d(ps2d),.ps2c(ps2c), .rx_en(rx_en),
     .rx_done_tick(rx_done_tick),
     .dout(dout)
      );

     keyout  KEY(
        .clk(clk),.reset(reset),.rx_done_tick(rx_done_tick),
        .keycodeout(dout),
        .a(a),.b(b),.c(c),.d(d),.up(up),.down(down),.left(left),.right(right)
        );



endmodule
