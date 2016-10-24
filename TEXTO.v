`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    22:02:40 09/22/2016
// Design Name:
// Module Name:    TEXTO
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments: hecho por JOAO SALAS
//
//////////////////////////////////////////////////////////////////////////////////
module TEXTO(
	 input [9:0] pixel_y, pixel_x,
	 input clk,
	 output [11:0] rgbtext
    );

//---------------------------------------------------------------
//                    PARAMETROS DE LAS IMAGENES
//--------------------------------------------------------------

//			texto fecha

		parameter fecha = 12'd1800;
		parameter fechaX = 60;
		parameter fechaY = 30;
		parameter IniciofechaX = 15;
		parameter IniciofechaY = 210;
		parameter FinfechaX = 75;
		parameter FinfechaY = 240;

//			texto timer

		parameter timer = 12'd1800;
		parameter timerX = 60;
		parameter timerY = 30;
		parameter IniciotimerX = 15;
		parameter IniciotimerY = 328;
		parameter FintimerX =75;
		parameter FintimerY = 358;

//			texto hora

		parameter hora = 13'd2280;
		parameter horaX = 60;
		parameter horaY = 38;
		parameter IniciohoraX = 15;
		parameter IniciohoraY = 72;
		parameter FinhoraX = 75;
		parameter FinhoraY = 110;

//			texto teclado

		parameter teclado = 13'd2280;
		parameter tecladoX = 95;
		parameter tecladoY = 24;
		parameter IniciotecladoX = 470;
		parameter IniciotecladoY = 36;
		parameter FintecladoX = 565;
		parameter FintecladoY = 60;

//---------------------------------------------------------------
//             DECLARACION DE REGISTROS Y WIRES A UTILIZAR
//--------------------------------------------------------------

		      reg [11:0]  HORA_DATA[0:hora]; //Memoria donde se almacena los datos de plantilla 1
		      reg [11:0]  FECHA_DATA[0:fecha]; //Memoria donde se almacena los datos de plantilla 2
		      reg [11:0]  TIMER_DATA[0:timer]; //Memoria donde se almacena los datos de plantilla 3
					reg [11:0]  TECLADO_DATA[0:teclado];
					reg [11:0] COLOR_IN;                    //COLOR DE SALIDA
		      reg [4:0]Selector; //SELECCION EN LOS CASES
		      reg  [3:0]Numero_RTC;
		      wire [15:0]Adress1;
		      reg  [8:0]Y ; //Resta en Y
		      reg  [8:0]X ; //Resta en X
		      reg  [8:0]MUL; //Multiplica por parametro
		      reg [15:0]Adress;

//-----------------------------------
//				CUERPO
//----------------------------------

always @(posedge clk) begin
		if(reset)
					Selector<=0;
		else begin
				if((IniciofechaX < pixel_x) && (pixel_x < FinfechaX) && (IniciofechaY < pixel_y) && (pixel_y < FinfechaY))
		      Selector <= 5'h1;
		  	else if((IniciotimerX < pixel_x) && (pixel_x < FintimerX) && (IniciotimerY < pixel_y) && (pixel_y < FintimerY))
		      Selector <= 5'h2;
		    else if((IniciohoraX < pixel_x) && (pixel_x < FinhoraX) && (IniciohoraY < pixel_y) && (pixel_y < FinhoraY))
		        Selector <= 5'h3;
				else if((IniciotecladoX < pixel_x) && (pixel_x < FintecladoX) && (IniciotecladoY < pixel_y) && (pixel_y < FintecladoY))
				      Selector <= 5'h4;
		    else
		      Selector <= 5'h0;
		end
end

//carga en la memoria

initial begin
		    $readmemh ("fecha.list", FECHA_DATA); //paso de listas txt a memorias
		    $readmemh ("timer.list", TIMER_DATA); //paso de listas txt a memorias
		    $readmemh ("hora.list", HORA_DATA); //paso de listas txt a memorias
				$readmemh ("teclado.list", TECLADO_DATA); //paso de listas txt a memorias
end

//--------------------------------------------------
//       secuencia para recorrer la memoria
//--------------------------------------------------

always @(posedge clk) begin
		if(reset) begin
					Y <= 0; X<=0; MUL<=0;
				  end
		else begin
		  case(Selector)
			      5'h0 : begin Y <= Y; X <= X; MUL <= MUL;  end
			      5'h1 : begin Y <= IniciofechaY; X <= IniciofechaX; MUL <= fechaY;  end
			      5'h2 : begin Y <= IniciotimerY; X <= IniciotimerX; MUL <= timerY;  end
			      5'h3 : begin Y <= IniciohoraY; X <=IniciohoraX; MUL <= horaY;  end
						5'h4 : begin Y <= IniciotecladoY; X <= IniciotecladoX; MUL <= tecladoY;  end
			      default begin Y <= Y; X<= X; MUL <= MUL; end
		  endcase
		end
end

		assign Adress1 = (pixel_y - Y) + (pixel_x - X)*MUL; //Establecimieto de puntero para memoria de plantilla

//recorrido por la memoria direccion por direccion

always @(posedge clk)begin
	if(reset)
			Adress <=0;
	else
		  Adress <= Adress1;
end

always @(posedge clk) begin
	if(reset)
				Numero_RTC<=0;
	else	begin
		 case (Selector)
		      5'h0  : Numero_RTC <= 4'hF;
		      5'h1  : Numero_RTC <= 4'hB;
		      5'h2  : Numero_RTC <= 4'hC;
		      5'h3  : Numero_RTC <= 4'hD;
					5'h4  : Numero_RTC <= 4'hA;
		   		default Numero_RTC <= 4'hF;
			endcase
		end
end


// seleccion de salida rgb

always @(posedge clk) begin
		if(reset)
				COLOR_IN<=0;
		else begin
		  case (Numero_RTC)
		      4'hF : COLOR_IN <= 12'h000;
		      4'hB : COLOR_IN <= FECHA_DATA[{Adress}];
		      4'hC : COLOR_IN <= TIMER_DATA[{Adress}];
		      4'hD : COLOR_IN <= HORA_DATA[{Adress}];
					4'hA : COLOR_IN <= TECLADO_DATA[{Adress}];
		  		default COLOR_IN <= 12'h000;
		  endcase
		end
end

//salida final rgb

assign rgbtext = COLOR_IN;

endmodule
