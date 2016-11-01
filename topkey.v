`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//
// Create Date:    21:42:30 10/20/2016
// Design Name:
// Module Name:    top


// Additional Comments: hecho por JOAO SALAS
// top para el teclado
//////////////////////////////////////////////////////////////////////////////////
module topkey(
  input clk,reset,
  input ps2d,ps2c, rx_en,
  output a,b,c,d,up,down,left,right

  );

    wire [7:0] dout;
    wire rx_done_tick;


         ps2_portreceiver  PS2(
             .clk(clk),.reset(reset),
             .ps2d(ps2d),.ps2c(ps2c), .rx_en(rx_en),
             .rx_done_tick(rx_done_tick),
             .dout(dout)
           );

          keyout  KEY(
              .clk(clk),
              .reset(reset),
              .rx_done_tick(rx_done_tick),
              .keycodeout(dout),
              .a_code(a),
              .b_code(b),
              .c_code(c),
              .d_code(d),
              .up_code(up),
              .down_code(down),
              .left_code(left),
              .right_code(right)
          );



endmodule
