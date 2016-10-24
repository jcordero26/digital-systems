`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:02:01 09/22/2016
// Module Name:    RING
// Project Name:		CONTROLADOR RTC CON PICOBLAZE
// Target Devices:
// Tool versions:
// Description:			PINTA LA IMAGEN PARA LA ALARMA CUANDO SE ACABA LA CUENTA EN EL RTC
// Additional Comments:  hecho por JOAO SALAS
//////////////////////////////////////////////////////////////////////////////////

module RING(
	  input activar_alarma,
    input [9:0] pixel_y, pixel_x,
    input clk,reset,
    output wire [11:0] rgbtext
  );


	//---------------------------------------------------------------
	//                    PARAMETROS DE LA IMAGEN RING
	//--------------------------------------------------------------

				parameter ghost = 14'd4319;//cantidad de pixeles
				parameter ghostX = 60;     //largo en x
				parameter ghostY = 72;     //ancho en y
				parameter InicioghostX = 460; // coordenada de inicio en pantalla en el eje x
				parameter InicioghostY = 315;  // coordenada de inicio en pantalla en el eje y
				parameter FinghostX =520;  // coordenada de finalizacion en pantalla en el eje x
				parameter FinghostY = 387;  // coordenada de finalizacion en pantalla en el eje y

	//---------------------------------------------------------------
	//             DECLARACION DE REGISTROS Y WIRES A UTILIZAR
	//--------------------------------------------------------------

	      reg [11:0]  GHOST_DATA [0:ghost]; //Memoria donde se almacena la imagen
				reg [11:0] COLOR_IN;              //color rgb de salida
	      reg [4:0]  Selector; //selector para los cases
	      reg  [3:0]Numero; //selector para el color de salida
	      wire [15:0]Adress1;
				reg [15:0]Adress; //direcciones en la memoria, reg and wire
	      reg  [8:0]Y; //Resta en Y
	      reg  [8:0]X; //Resta en X
	      reg  [8:0]MUL; //Multiplica por parametro
	      wire phantom;
				//variables para el parpadeo
				reg [5:0] contador;
		 	  reg enable;
		 	  reg [11:0] rgb;


//activador de la imagen

assign phantom = ((InicioghostX < pixel_x) && (pixel_x < FinghostX) && (InicioghostY < pixel_y) && (pixel_y < FinghostY));


//-----------------------------------------
//    CUERPO
//-----------------------------------------


	always @(posedge clk) begin  //seleccion de acuerdo a la coordenada
			if(reset)
					Selector<=0;
			else begin
				  if (phantom)
			        Selector <= 5'h1;
			    else
			        Selector <= 5'h0;
			end
	end

	//carga en la memoria

	initial begin
	    $readmemh ("ghost.list", GHOST_DATA); //paso de list a memorias
  end

//--------------------------------------------------
//secuencia para recorrer la memoria
//--------------------------------------------------

always @(posedge clk) begin //Dependiendo de el lugar de selector se escogen los paramentros a operar
		if(reset) begin
						Y   <= 9'h000;
						X   <= 9'h000;
						MUL <= 9'h000;
						end
		else begin
			  case(Selector)
			      5'h0 : begin Y <= Y; X= X; MUL<= MUL;  end
			      5'h1 : begin Y <= InicioghostY; X<=InicioghostX; MUL<= ghostY;end
			      default: begin Y <= 0; X<= 0; MUL<= 0; end
			  endcase
			end
end


assign Adress1 = (pixel_y - Y) + (pixel_x - X)*MUL; //Establecimieto de puntero para la memoria

//recorrido por la memoria direccion por direccion

always @(posedge clk) begin
				if(reset)
							Adress <= 0;
				else
							Adress <= Adress1;
				end

always @(posedge clk) begin
		if(reset)
							Numero<=0;
		else begin
			case (Selector)
				      5'h0  : Numero <= 4'hF;
				      5'h1  : Numero <= 4'hB;
							default: Numero <= 4'hF;
			endcase
		end
end

//------------------------------------------------------------------------
//     ASIGNACION FINAL DEL COLOR RGB
//------------------------------------------------------------------------

always @(posedge clk) begin   //de acuerdo al selector se asigna la imagen en memoria que corresponde
			if(reset)
							COLOR_IN<=0;
			else begin
	  		case (Numero)
				      4'hF : COLOR_IN <= 12'h000;
							4'hB : COLOR_IN <= GHOST_DATA[{Adress}];
							default: COLOR_IN <= 12'h000;
				endcase
	  end
end

//------------------------------------------------------------------------
//			CIRCUITO PARA GENERAR EL PARPADEO DE LA IMAGEN DE ALARMA
//------------------------------------------------------------------------

//se genera un conteo cada inicio de imagen, esto para generar un conteo mas lento
	always @(posedge clk) begin
			if(reset)
					contador<=0;
			else if (pixel_y==0)
					contador<=contador+1;
			else
					contador<=contador;
		end
//habilitacion de imagen de salida

always @(posedge clk) begin
		if(reset)
				enable<=0;
		else begin
				if (contador<40)
						enable=1;
				else
						enable=0;
				end
end

//salida parpadeando

always @(posedge clk)begin
			if(reset)
					rgb = 12'h000;
			else begin
					if(activar_alarma) begin
							if(enable)
									rgb =  COLOR_IN;
							else
									rgb = 12'h000;
									end
					else rgb = 12'h000;
	        end
end

assign rgbtext=rgb;  //salida final

endmodule
