`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    14:44:21 10/19/2016
// Module Name:    keyout
// Project Name:   CONTROLADOR RTC CON PICOBLAZE
// Target Devices:  ARTIX 7
// Tool versions:
// Description:     GENERA PULSOS DE ACUERDO A LAS TECLAS QUE SE NECESITAN PARA EL PROYECTO
//                  LAS DEMAS TECLAS SON IGNORADAS
// Additional Comments:  hecho por JOAO SALAS
//////////////////////////////////////////////////////////////////////////////////
module keyout(
  input clk,reset,rx_done_tick,
  input [7:0] keycodeout,
  output  a,b,c,d,up,down,left,right,
  output  a_vga_out,b_vga_out,c_vga_out,d_vga_out,up_vga_out,down_vga_out,left_vga_out,right_vga_out
  );

//-----------------------------------------------
//      declaracion de registros a utilizar
//-----------------------------------------------

reg [7:0] hexacode=8'h00;
reg [7:0] hexacode_vga=8'h00;
reg a_code=0,b_code=0,c_code=0,d_code=0,up_code=0,down_code=0,right_code=0,left_code=0;
reg  a_vga=0,b_vga=0,c_vga=0,d_vga=0,up_vga=0,down_vga=0,left_vga=0,right_vga=0;

//------------------------------------------------
//                   CUERPO
//------------------------------------------------

//REGISTROS CON LOS DATOS PROVENIENTES DEL TECLADO

always @(posedge clk) begin
    if(reset) begin
    		hexacode <= 8'h00;
        hexacode_vga <= 8'h00;
        end
    else begin
        case(rx_done_tick)
        1: begin
            hexacode <= keycodeout[7:0];
            hexacode_vga<= keycodeout[7:0];
           end
        0: begin
        		hexacode <= 8'h00;
            hexacode_vga<=hexacode_vga;
           end
      endcase
    end
end

//---------------------------------------
//        PARA PICOBLAZE
//---------------------------------------

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

//---------------------------------------
//        PARA VGA
//---------------------------------------

  always @* begin
            case(hexacode_vga)
               8'h1C: begin   //letra A
                          a_vga=1'b1;
                    end
               8'h32: begin   //letra B
                          b_vga=1'b1;
                    end
               8'h21: begin   //letra C
                          c_vga=1'b1;
                    end
               8'h23: begin   //letra Dsim:/TEST/activar_alarma

                          up_vga=1'b1;
                    end
               8'h72: begin   //letra down
                          down_vga=1'b1;
                    end
               8'h74: begin   //letra right
                          right_vga=1'b1;
                    end
               8'h6B: begin   //letra left
                          left_vga=1'b1;
                    end
               default:  begin {a_vga,b_vga,c_vga,d_vga,up_vga,down_vga,right_vga,left_vga}={1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};end
          	endcase
    end


//salidas para el picoblaze

assign a = a_code;
assign b = b_code;
assign c = c_code;
assign d = d_code;
assign up = up_code;
assign down = down_code;
assign right = right_code;
assign left = left_code;

//salidas para vga

assign {a_vga_out,b_vga_out,c_vga_out,d_vga_out,up_vga_out,down_vga_out,right_vga_out,left_vga_out}={a_vga,b_vga,c_vga,d_vga,up_vga,down_vga,right_vga,left_vga};


endmodule
