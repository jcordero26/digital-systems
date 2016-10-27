`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
e:    22:21:15 10/14/2016
// Design Name:
// Module Name:    img



//CREADO POR: JOAO SALAS
////////IMAGENES PARA LA PANTALLA VGA /////////////////////////////////
module img(
       input  clk,reset,
       input aI,bI,cI,dI,upI,downI,leftI,rightI,
       input [9:0] pixel_x, pixel_y,
       output [11:0] rgb  //bits de color hacia la VGA
);


//---------------------------------------------------------------------------------------------------
//          PARAMETROS GENERALES CON LA INFORMACION DE LA POSICION Y TAMAÑO DE LAS IMAGENES
//--------------------------------------------------------------------------------------------------

//                FLECHAS

// fecflecha arriba: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla
parameter arrow = 8280;   //cantidad de pixeles de la imagen
parameter arrowX = 120;    //largo en x
parameter arrowY = 69;     //ancho en y
parameter endarrowX = 580;  //fin en pantalla, eje x
parameter endarrowY = 270;  //fin en pantalla, eje y
parameter beginarrowX = 460; //inicio en pantalla en el eje x
parameter beginarrowY = 201; //inicio en pantalla en el eje y


//                 LETRAS

// A: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter Awhite = 840;
parameter Ared = 840;
parameter AX = 30;
parameter AY = 28;
parameter beginAX = 460;
parameter beginAY = 64;
parameter endAX = 490;
parameter endAY = 92;

// B: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter Bwhite = 840;
parameter Bred = 840;
parameter BX = 30;
parameter BY = 28;
parameter beginBX = 460;
parameter beginBY = 94;
parameter endBX = 490;
parameter endBY = 122;

// C: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter Cwhite = 840;
parameter Cred = 840;
parameter CX = 30;
parameter CY = 28;
parameter beginCX = 460;
parameter beginCY = 124;
parameter endCX = 490;
parameter endCY = 152;

// D: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter Dred = 840;
parameter Dwhite = 840;
parameter DX = 30;
parameter DY = 28;
parameter beginDX = 460;
parameter beginDY = 154;
parameter endDX = 490;
parameter endDY = 182;

//                  TEXTO INFORMATIVO

// fecha: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter pfecha= 900;
parameter pfechaX = 50;
parameter pfechaY = 18;
parameter beginpfechaX = 491;
parameter beginpfechaY = 72;
parameter endpfechaX = 541;
parameter endpfechaY = 89;

// tamaño en pixeles, largo en x y Y, inicio y fin en pantalla  ...timer

parameter phora = 850;
parameter phoraX = 50;
parameter phoraY = 17;
parameter beginphoraX = 491;
parameter beginphoraY = 102;
parameter endphoraX = 541;
parameter endphoraY = 119;

// alarma: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter alarma = 850;
parameter alarmaX = 50;
parameter alarmaY = 17;
parameter beginalarmaX = 491;
parameter beginalarmaY = 128;
parameter endalarmaX = 541;
parameter endalarmaY = 145;

// enter: tamaño en pixeles, largo en x y Y, inicio y fin en pantalla

parameter enter = 650;
parameter enterX = 50;
parameter enterY = 13;
parameter beginenterX = 491;
parameter beginenterY = 160;
parameter endenterX = 541;
parameter endenterY = 173;

//-------------------------------------------------------------------------------------------------------------------------
///                              DECLARACION DE REGISTROS UTILIZADOS PARA CONTENER LAS IMAGENES
//-------------------------------------------------------------------------------------------------------------------------

//    MemoriaS donde se almacena los datos

      reg [11:0]  ARRIBA_DATA[0:arrow];
      reg [11:0]  ABAJO_DATA[0:arrow];

      reg [11:0]  IZQUIERDA_DATA[0:arrow];
      reg [11:0]  DERECHA_DATA[0:arrow];

      reg [11:0]  FLECHAS_DATA[0:arrow];

      reg [11:0]  awhite_DATA[0:Awhite];
      reg [11:0]  ared_DATA[0:Ared];

      reg [11:0]  bwhite_DATA[0:Bwhite];
      reg [11:0]  bred_DATA[0:Bred];

      reg [11:0]  cred_DATA[0:Cred];
      reg [11:0]  cwhite_DATA[0:Cwhite];

      reg [11:0]  dred_DATA[0:Dred];
      reg [11:0]  dwhite_DATA[0:Dwhite];

      reg [11:0]  alarma_DATA[0:alarma];
      reg [11:0]  enter_DATA[0:enter];
      reg [11:0]  phora_DATA[0:phora];
      reg [11:0]  pfecha_DATA[0:pfecha];

//------------------------------------------------------------------------------------------
//--------DECLARACION DE REGS Y WIRES UTILIZADOS-------------------------------------------
//------------------------------------------------------------------------------------------

      reg [11:0] COLOR_IN;  //COLOR DE SALIDA
      reg [4:0]Selector;    //SELECCION EN LOS CASES
      reg  [3:0] Numero;
      wire [15:0]Adress1;
      reg  [8:0]Y;       //Resta en Y =9'h1FF
      reg  [8:0]X;        //Resta en X
      reg  [8:0]MUL;      //Multiplica por parametro
      reg [15:0]Adress;



//----------------------------------------------------------------------------
//                     activacion de imagenes segun la posicion en pantalla
//----------------------------------------------------------------------------

//FLECHAS EN PANTALLA
always @(posedge clk) begin
      if(reset)
          Selector<=5'h0;

      else begin

      //up arrow
      		if((beginarrowX <= pixel_x) && (pixel_x < endarrowX) && (beginarrowY < pixel_y) && (pixel_y < endarrowY)) begin
                Selector <= 5'h1;
            end

      //siguen las letras del teclado

      //-------letra A
        	else if((beginAX <= pixel_x) && (pixel_x < endAX) && (beginAY < pixel_y) && (pixel_y < endAY))begin
                  Selector <= 5'h5;
              end
      //-------LETRA B
          else if((beginBX <= pixel_x) && (pixel_x < endBX) && (beginBY < pixel_y) && (pixel_y < endBY))begin
                  Selector <= 5'h6;
              end
      //-----------LETRA C
          else if((beginCX <= pixel_x) && (pixel_x < endCX) && (beginCY < pixel_y) && (pixel_y < endCY))begin
                  Selector <= 5'h7;
              end
      //---------LETRA D
        	else if((beginDX <= pixel_x) && (pixel_x < endDX) && (beginDY < pixel_y) && (pixel_y < endDY))begin
                  Selector <= 5'h8;
              end

      //FIN DE LAS LETRAS ... comienzan los textos informativos

      //  fecha
          else if((beginpfechaX <= pixel_x) && (pixel_x < endpfechaX) && (beginpfechaY < pixel_y) && (pixel_y < endpfechaY))begin
                  Selector <= 5'h9;
              end
      //  hora
          else if((beginphoraX <= pixel_x) && (pixel_x < endphoraX) && (beginphoraY < pixel_y) && (pixel_y < endphoraY))begin
                  Selector <= 5'hA;
              end
      //  alarma
          else if((beginalarmaX <= pixel_x) && (pixel_x < endalarmaX) && (beginalarmaY < pixel_y) && (pixel_y < endalarmaY))begin
                  Selector <= 5'hB;
               end
      //  enter
          else if((beginenterX <= pixel_x) && (pixel_x < endenterX) && (beginenterY < pixel_y) && (pixel_y < endenterY))begin
                  Selector <= 5'hC;
              end
      //  else

          else begin
            Selector <= 5'h0;

            end
          end
end

//------------------------------------------------------------

//            CARGA DE IMAGENES EN MEMORIAS

//------------------------------------------------------------

initial
begin
//flechas   //paso de listas txt a memorias

    $readmemh ("arriba.list", ARRIBA_DATA);
    $readmemh ("abajo.list", ABAJO_DATA);
    $readmemh ("izquierda.list", IZQUIERDA_DATA);
    $readmemh ("derecha.list", DERECHA_DATA);
    $readmemh ("flechas.list", FLECHAS_DATA);

//letras  //paso de listas txt a memorias

    $readmemh ("ared.list", ared_DATA);
    $readmemh ("awhite.list", awhite_DATA);

    $readmemh ("bred.list", bred_DATA);
    $readmemh ("bwhite.list", bwhite_DATA);

    $readmemh ("cred.list", cred_DATA);
    $readmemh ("cwhite.list", cwhite_DATA);

    $readmemh ("dred.list", dred_DATA);
    $readmemh ("dwhite.list", dwhite_DATA);

//texto //paso de listas txt a memorias
    $readmemh ("enter.list", enter_DATA);
    $readmemh ("alarma.list", alarma_DATA);
    $readmemh ("phora.list", phora_DATA);
    $readmemh ("pfecha.list", pfecha_DATA);

end

//---------------------------------------------------
//          Cuerpo del modulo
//---------------------------------------------------

always @(*) begin //Dependiendo de el lugar de selector se escogen los paramentros a operar
          case(Selector)
              5'h0 : begin Y = 0; X= 0; MUL= 0;  end  //default
              //flechas
              5'h1 : begin Y = beginarrowY; X = beginarrowX; MUL = arrowY;  end
              //letras
              5'h5 : begin Y = beginAY; X = beginAX; MUL = AY;  end
              5'h6 : begin Y = beginBY; X = beginBX; MUL = BY;  end
              5'h7 : begin Y = beginCY; X = beginCX; MUL = CY;  end
              5'h8 : begin Y = beginDY; X = beginDX; MUL = DY;  end
              //text
              5'h9 : begin Y = beginpfechaY; X = beginpfechaX; MUL = pfechaY;  end
              5'hA : begin Y = beginphoraY; X = beginphoraX; MUL = phoraY;  end
              5'hB : begin Y = beginalarmaY; X = beginalarmaX; MUL = alarmaY;  end
              5'hC : begin Y = beginenterY; X = beginenterX; MUL = enterY;  end
              default: begin Y = beginarrowY; X = beginarrowX; MUL = arrowY;  end
          endcase
end


//-------------------------------------------------------------------------------------------------------

assign Adress1 = (pixel_y - Y) + (pixel_x - X)*MUL; //Establecimieto de puntero para memoria de plantilla



//                        SELECCION FINAL DE SALIDA

always @(posedge clk) begin
    if(reset) Adress <= 0;
    else
      Adress <= Adress1;
    end

always @(posedge clk) begin
  if(reset)
      Numero <= 4'h0;
	else
    begin
		case (Selector)
      5'h0  : Numero <= 4'hF;

      5'h1  : Numero <= 4'hD;


      5'h5  : Numero <= 4'h9;
      5'h6  : Numero <= 4'h8;
      5'h7  : Numero <= 4'h7;
      5'h8  : Numero <= 4'h6;

      5'h9  : Numero <= 4'h5;
      5'hA  : Numero <= 4'h4;
      5'hB  : Numero <= 4'h3;
      5'hC  : Numero <= 4'h2;

		  default Numero <= 4'h0;
		endcase
	end
end


//---------------------------------------------------------------------------------------
//se debe generar el control adecuado de acuerdo a la letra que se presiona en el teclado
//---------------------------------------------------------------------------------------

always @(posedge clk) begin
    if(reset)
          COLOR_IN<=12'h000;
    else
  	begin
  		case (Numero)
      4'hF : COLOR_IN <= 12'h000; //negro

      4'hD :begin
            if( upI==1'b1 )
                COLOR_IN <= ARRIBA_DATA[{Adress}];
            else  if( downI==1'b1 )
                    COLOR_IN <= ABAJO_DATA[{Adress}];
            else if( leftI==1'b1 )
                        COLOR_IN <= IZQUIERDA_DATA[{Adress}];
            else if( rightI==1'b1 )
                  COLOR_IN <= DERECHA_DATA[{Adress}];
            else
                COLOR_IN <= FLECHAS_DATA[{Adress}];
            end

      4'h9 :begin
            if( aI==1'b1 )
                  COLOR_IN <= ared_DATA[{Adress}];
            else
                  COLOR_IN <= awhite_DATA[{Adress}];
            end
      4'h8 : begin
            if( bI==1'b1 )
                  COLOR_IN <= bred_DATA[{Adress}];
            else
                  COLOR_IN <= bwhite_DATA[{Adress}];
            end
      4'h7 : begin
            if( cI==1'b1 )
                  COLOR_IN <= cred_DATA[{Adress}];
            else
                  COLOR_IN <= cwhite_DATA[{Adress}];
            end
      4'h6 :begin
            if( dI==1'b1 )
                  COLOR_IN <= dred_DATA[{Adress}];
            else
                  COLOR_IN <= dwhite_DATA[{Adress}];
            end

      4'h5 : COLOR_IN <= pfecha_DATA[{Adress}];
      4'h4 : COLOR_IN <= phora_DATA[{Adress}];
      4'h3 : COLOR_IN <= alarma_DATA[{Adress}];
      4'h2 : COLOR_IN <= enter_DATA[{Adress}];

  		default COLOR_IN <= 12'h000;
  		endcase
  end
end


//-----------------------------------------------------------------------------------------
//                        SALIDA FINAL RGB
//-----------------------------------------------------------------------------------------

assign rgb = COLOR_IN;
/*
assign rgb[0] = COLOR_IN[11];
assign rgb[1] = COLOR_IN[11];
assign rgb[2] = COLOR_IN[11];
assign rgb[3] = COLOR_IN[11];

assign rgb[4] = COLOR_IN[11];
assign rgb[5] = COLOR_IN[11];
assign rgb[6] = COLOR_IN[11];
assign rgb[7] = COLOR_IN[11];

assign rgb[8] = COLOR_IN[11];
assign rgb[9] = COLOR_IN[11];
assign rgb[10] = COLOR_IN[11];
assign rgb[11] = COLOR_IN[11];

*/
endmodule
