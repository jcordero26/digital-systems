`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:01:09 09/22/2016
// Module Name:    SIMBOLOS
// Project Name:    CONTROLADOR RTC CON PICOBLAZE
// Target Devices:  ARTIX 7
// Tool versions:
// Description:   SIMBOLOS EN PANTALLA VGA, COMO LOS PUNTOS SEPARADORES DE HORAS
//                  Y BARRAS SEPARADORAS DE FECHA

// Additional Comments:  hecho por JOAO SALAS
//
//////////////////////////////////////////////////////////////////////////////////
module SIMBOLOS(
input [9:0] pix_y, pix_x,
input clk,reset,
output wire [11:0] rgbtext
);

//---------------------------------------------------------------
//             DECLARACION DE REGISTROS Y WIRES A UTILIZAR
//--------------------------------------------------------------


    reg  [3:0]Numero_RTC ;
    wire [15:0]Adress1;
    reg  [8:0]Y  ; //Resta en Y
    reg  [8:0]X  ; //Resta en X
    reg  [8:0]MUL ; //Multiplica por parametro
    reg [15:0]Adress;
    reg [11:0]  PUNTOS_DATA[0:puntos]; //Memoria donde se almacena los datos de plantilla 1
    reg [11:0]  SLASH_DATA[0:slash]; //Memoria donde se almacena los datos de plantilla 2
    reg [11:0] COLOR_IN;                    //COLOR DE SALIDA
    reg [4:0]  Selector; //SELECCION EN LOS CASES
    wire ruedaon1_on,ruedaon1_on2,ruedaon1_on3,ruedaon1_on4;
    wire barrafecha_on,barrafecha_on2;

//---------------------------------------------------------------
//                    PARAMETROS DE LAS IMAGENES
//--------------------------------------------------------------

//  PARA PUNTOS

parameter puntos = 12'd1399;
parameter puntosX = 25;
parameter puntosY = 56;

//      primero

parameter IniciopuntosX = 180;
parameter IniciopuntosY = 68;
parameter FinpuntosX =210;
parameter FinpuntosY = 124;

//    segundo
parameter IniciopuntosX2 = 180;
parameter IniciopuntosY2 = 324;
parameter FinpuntosX2 =210;
parameter FinpuntosY2 = 380;

//    tercer

parameter IniciopuntosX3 = 308;
parameter IniciopuntosY3 = 68;
parameter FinpuntosX3 =333;
parameter FinpuntosY3 = 124;

//    cuarto
parameter IniciopuntosX4 = 308;
parameter IniciopuntosY4 = 324;
parameter FinpuntosX4 =333;
parameter FinpuntosY4 = 380;

//  PARA SLASH 1 Y 2

parameter slash = 1512;
parameter slashX = 21;
parameter slashY = 72;

parameter InicioslashX = 184;
parameter InicioslashY = 188;
parameter FinslashX = 205;
parameter FinslashY = 260;

parameter InicioslashX2 = 310;
parameter InicioslashY2 = 188;
parameter FinslashX2 = 331;
parameter FinslashY2 = 260;


//-----------------------------------------
//    CUERPO
//-----------------------------------------


//      habilitadores de acuerdo a la coordenada actual


assign ruedaon1_on = (IniciopuntosX <= pix_x) && (pix_x <= FinpuntosX) && (IniciopuntosY <= pix_y) && (pix_y <= FinpuntosY);
assign ruedaon1_on2 =  (IniciopuntosX2 <= pix_x) && (pix_x <= FinpuntosX2) && (IniciopuntosY2 <= pix_y) && (pix_y <= FinpuntosY2);
assign ruedaon1_on3 = (IniciopuntosX3 <= pix_x) && (pix_x <= FinpuntosX3) && (IniciopuntosY3 <= pix_y) &&  (pix_y <= FinpuntosY3);
assign ruedaon1_on4 =  (IniciopuntosX4 <= pix_x) && (pix_x <= FinpuntosX4) &&(IniciopuntosY4 <= pix_y) && (pix_y <= FinpuntosY4);

assign barrafecha_on = (InicioslashX<=pix_x) && (pix_x<=FinslashX) && (InicioslashY<=pix_y) && (pix_y<=FinslashY);
assign barrafecha_on2 = (InicioslashX2<=pix_x) && (pix_x<=FinslashX2) && (InicioslashY2<=pix_y) && (pix_y<=FinslashY2);




always @(posedge clk) begin
    if(reset)
        Selector<=0;
else begin
        //PUNTOS
        if (ruedaon1_on)
                      Selector <= 5'h1;
        else if (ruedaon1_on2)
                      Selector <= 5'h2;
        else if (ruedaon1_on3)
                      Selector <= 5'h3;
        else if (ruedaon1_on4)
                      Selector <= 5'h4;
        //SLASH 1 Y 2
        else if (barrafecha_on)
                      Selector <= 5'h5;
        else if (barrafecha_on2)
                      Selector <= 5'h6;
        else
                Selector <= 5'h0;
  end
end


//carga en la memoria

initial begin
		    $readmemh ("puntos.list", PUNTOS_DATA); //paso de listas txt a memorias
		    $readmemh ("slash.list", SLASH_DATA); //paso de listas txt a memorias
end


//--------------------------------------------------
//       secuencia para recorrer la memoria
//--------------------------------------------------

always @(posedge clk) begin
    if(reset)begin
            Y <= 0; X <= 0; MUL <= 0;end
   else
    	begin
      case(Selector)
          5'h0 : begin Y <= Y; X<= X; MUL<= MUL;  end
          5'h1 : begin Y <= IniciopuntosY; X <= IniciopuntosX; MUL<= puntosY;  end
          5'h2 : begin Y <= IniciopuntosY2; X <= IniciopuntosX2; MUL<= puntosY;  end
          5'h3 : begin Y <= IniciopuntosY3; X<=IniciopuntosX3; MUL<= puntosY;  end
          5'h4 : begin Y <= IniciopuntosY4; X<= IniciopuntosX4; MUL<= puntosY;  end

          5'h5 : begin Y <= InicioslashY; X<= InicioslashX; MUL<= slashY;  end
          5'h6 : begin Y <= InicioslashY2; X<= InicioslashX2; MUL<= slashY;  end

          default: begin Y <= Y; X<= X; MUL<= MUL; end
    	  endcase
    	end
    end


	assign Adress1 = (pix_y - Y) + (pix_x - X)*MUL;


//recorrido por la memoria direccion por direccion

always @(posedge clk)begin
    if(reset)
        Adress <= 0;
    else
        Adress <= Adress1;
end

always @(posedge clk)begin
  if(reset)
        Numero_RTC <= 4'h0;
  else
    begin
        case (Selector)
          5'h0  : Numero_RTC <= 4'hF;

          5'h1  : Numero_RTC <= 4'hB;
          5'h2  : Numero_RTC <= 4'hB;
          5'h3  : Numero_RTC <= 4'hB;
          5'h4  : Numero_RTC <= 4'hB;

          5'h5  : Numero_RTC <= 4'hC;
          5'h6  : Numero_RTC <= 4'hC;

        default Numero_RTC <= 4'hF;
        endcase
    end
end

// seleccion de SALIDA

always @(posedge clk) begin
      if(reset)
            COLOR_IN <= 12'h000;
      else begin
            case (Numero_RTC)
            4'hF : COLOR_IN <= 12'h000;
            4'hB : COLOR_IN <= PUNTOS_DATA[{Adress}];
            4'hC : COLOR_IN <= SLASH_DATA[{Adress}];

            default COLOR_IN <= 12'h000;
            endcase
    end
end

//salida final

assign rgbtext=COLOR_IN;

endmodule
