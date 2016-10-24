`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    21:42:30 10/20/2016
// Module Name:    top
// Project Name:   CONTROLADOR RTC CON PICOBLAZE
// Target Devices:  ARTIX 7
// Tool versions:
// Description:   modulo top para el control del teclado 
// Additional Comments: hecho por JOAO SALAS
//
//////////////////////////////////////////////////////////////////////////////////
module topkey(
  input clk,reset,
  input ps2d,ps2c, rx_en,
  output wire [7:0] dout1,
  output wire rx_done_tick,
  output  a,b,c,d,up,down,left,right,
  output  a_vga_out,b_vga_out,c_vga_out,d_vga_out,up_vga_out,down_vga_out,left_vga_out,right_vga_out
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
        .a(a),.b(b),.c(c),.d(d),.up(up),.down(down),.left(left),.right(right),
         .a_vga_out(a_vga_out),
         .b_vga_out(b_vga_out),
         .c_vga_out(c_vga_out),
         .d_vga_out(d_vga_out),
         .up_vga_out(up_vga_out),
         .down_vga_out(down_vga_out),
         .left_vga_out(left_vga_out),
         .right_vga_out(right_vga_out)
        );



endmodule
