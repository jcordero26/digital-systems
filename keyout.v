`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:44:21 10/19/2016
// Design Name:
// Module Name:    keyout
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
module keyout(
  input clk,reset,rx_done_tick,
  input [7:0] keycodeout,
  output  a,b,c,d,up,down,left,right
  );

//-----------------------------------------------
//      declaracion de registros a utilizar
//-----------------------------------------------

reg [7:0] hexacode;
reg a_code,b_code,c_code,d_code,up_code,down_code,right_code,left_code;

//------------------------------------------------
//                   CUERPO
//------------------------------------------------

always @(posedge clk) begin
    if(reset) begin
    		hexacode <= 8'h00;
        end
    else begin
        case(rx_done_tick)
        1: begin
            hexacode <= keycodeout[7:0];
           end
        0: begin
        		hexacode <= 8'h00;
           end
      endcase
    end
end

always @* begin

          case(hexacode)
             8'h1C: begin   //letra A
                        a_code=1'b1;
                  end
             8'h32: begin   //letra B
                        b_code=1'b1;
                  end
             8'h21: begin   //letra C
                        c_code=1'b1;
                  end
             8'h23: begin   //letra D
                        d_code=1'b1;
                  end
             8'h75: begin    //letra up
                        up_code=1'b1;
                  end
             8'h72: begin   //letra down
                        down_code=1'b1;
                  end
             8'h74: begin   //letra right
                        right_code=1'b1;
                  end
             8'h6B: begin   //letra left
                        left_code=1'b1;
                  end
             default:  begin {a_code,b_code,c_code,d_code,up_code,down_code,right_code,left_code}={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};end
        	endcase
  end

//salidas

assign a = a_code;
assign b = b_code;
assign c = c_code;
assign d = d_code;
assign up = up_code;
assign down = down_code;
assign right = right_code;
assign left = left_code;

endmodule
