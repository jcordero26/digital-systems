`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    22:02:32 09/22/2016
// Design Name:
// Module Name:    SQUARE
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
module SQUARE(
	input [9:0] pix_y, pix_x,
	 input wire video_on,
	 input reset,
	 output  [11:0] rgbtext

);

//*********************************************************
//SECCION GENERADORA DE CUADROS EN LA PANTALLA


	 wire [11:0] color_rgb; //output de salida


		//tamanos de lineas
//CAJAS GRANDES CREACION, LAS QUE ENCIERRAN,
//comienza la cajote de la hora
//vertical1

	localparam grande1v_left=85;
	localparam grande1v_right=87;
	localparam grande1v_y_t = 54;
	localparam grande1v_y_b = 137;
	wire  grande1v_on;
	assign grande1v_on = (grande1v_left<=pix_x) && (pix_x<=grande1v_right) &&
	(grande1v_y_t<=pix_y) && (pix_y<=grande1v_y_b);
//vertial2
	localparam grande2v_left=423;
	localparam grande2v_right=425;
	localparam grande2v_y_t = 54;
	localparam grande2v_y_b = 137;
	wire  grande2v_on;
	assign grande2v_on = (grande2v_left<=pix_x) && (pix_x<=grande2v_right) &&
	(grande2v_y_t<=pix_y) && (pix_y<=grande2v_y_b);
//horizontal1

	localparam grande1h_left=88;
	localparam grande1h_right=422;
	localparam grande1h_y_t = 54;
	localparam grande1h_y_b = 56;
	wire  grande1h_on;
	assign grande1h_on = (grande1h_left<=pix_x) && (pix_x<=grande1h_right) &&
	(grande1h_y_t<=pix_y) && (pix_y<=grande1h_y_b);
//horizontal2

	localparam grande2h_left=88;
	localparam grande2h_right=422;
	localparam grande2h_y_t = 135;
	localparam grande2h_y_b = 137;
	wire  grande2h_on;
	assign grande2h_on = (grande2h_left<=pix_x) && (pix_x<=grande2h_right) &&
	(grande2h_y_t<=pix_y) && (pix_y<=grande2h_y_b);

//----------------------------------------------------------------------------
//sigue la caja de la fecha

//vertical1

	localparam grandef1v_left=85;
	localparam grandef1v_right=87;
	localparam grandef1v_y_t = 183;
	localparam grandef1v_y_b = 265;
	wire  grandef1v_on;
	assign grandef1v_on = (grandef1v_left<=pix_x) && (pix_x<=grandef1v_right) &&
	(grandef1v_y_t<=pix_y) && (pix_y<=grandef1v_y_b);
//vertial2

	localparam grandef2v_left=423;
	localparam grandef2v_right=425;
	localparam grandef2v_y_t = 183;
	localparam grandef2v_y_b = 265;
	wire  grandef2v_on;
	assign grandef2v_on = (grandef2v_left<=pix_x) && (pix_x<=grandef2v_right) &&
	(grandef2v_y_t<=pix_y) && (pix_y<=grandef2v_y_b);
//horizontal1

	localparam grandef1h_left=88;
	localparam grandef1h_right=422;
	localparam grandef1h_y_t = 183;
	localparam grandef1h_y_b = 185;
	wire  grandef1h_on;
	assign grandef1h_on = (grandef1h_left<=pix_x) && (pix_x<=grandef1h_right) &&
	(grandef1h_y_t<=pix_y) && (pix_y<=grandef1h_y_b);
//horizontal2

	localparam grandef2h_left=88;
	localparam grandef2h_right=422;
	localparam grandef2h_y_t = 263;
	localparam grandef2h_y_b = 265;
	wire  grandef2h_on;
	assign grandef2h_on = (grandef2h_left<=pix_x) && (pix_x<=grandef2h_right) &&
	(grandef2h_y_t<=pix_y) && (pix_y<=grandef2h_y_b);
//---------------------------------------------------------------------

//sigue la caja del cronometro
//vertical1

	localparam grandec1v_left=85;
	localparam grandec1v_right=87;
	localparam grandec1v_y_t = 310;
	localparam grandec1v_y_b = 394;
	wire  grandec1v_on;
	assign grandec1v_on = (grandec1v_left<=pix_x) && (pix_x<=grandec1v_right) &&
	(grandec1v_y_t<=pix_y) && (pix_y<=grandec1v_y_b);
//vertial2

	localparam grandec2v_left=423;
	localparam grandec2v_right=425;
	localparam grandec2v_y_t = 310;
	localparam grandec2v_y_b = 394;
	wire  grandec2v_on;
	assign grandec2v_on = (grandec2v_left<=pix_x) && (pix_x<=grandec2v_right) &&
	(grandec2v_y_t<=pix_y) && (pix_y<=grandec2v_y_b);
//horizontal1

	localparam grandec1h_left=88;
	localparam grandec1h_right=422;
	localparam grandec1h_y_t = 310;
	localparam grandec1h_y_b = 312;
	wire  grandec1h_on;
	assign grandec1h_on = (grandec1h_left<=pix_x) && (pix_x<=grandec1h_right) &&
	(grandec1h_y_t<=pix_y) && (pix_y<=grandec1h_y_b);
//horizontal2

	localparam grandec2h_left=88;
	localparam grandec2h_right=422;
	localparam grandec2h_y_t = 392;
	localparam grandec2h_y_b = 394;
	wire  grandec2h_on;
	assign grandec2h_on = (grandec2h_left<=pix_x) && (pix_x<=grandec2h_right) &&
	(grandec2h_y_t<=pix_y) && (pix_y<=grandec2h_y_b);


//---------------------------------------------------------------------------
//**********************************************************************

//recuadros dentro de la caja del reloj

//cajas para las horas
//primer caja
//vertical1

	localparam media1v_left=92;
	localparam media1v_right=95;
	localparam media1v_y_t = 61;
	localparam media1v_y_b = 130;
	wire  media1v_on;
	assign media1v_on = (media1v_left<=pix_x) && (pix_x<=media1v_right) &&
	(media1v_y_t<=pix_y) && (pix_y<=media1v_y_b);
//vertial2

	localparam media2v_left=159;
	localparam media2v_right=162;
	localparam media2v_y_t = 61;
	localparam media2v_y_b = 130;
	wire  media2v_on;
	assign media2v_on = (media2v_left<=pix_x) && (pix_x<=media2v_right) &&
	(media2v_y_t<=pix_y) && (pix_y<=media2v_y_b);
//horizontal1
	localparam media1h_left=96;
	localparam media1h_right=159;
	localparam media1h_y_t = 61;
	localparam media1h_y_b = 63;
	wire  media1h_on;
	assign media1h_on = (media1h_left<=pix_x) && (pix_x<=media1h_right) &&
	(media1h_y_t<=pix_y) && (pix_y<=media1h_y_b);
//horizontal2
	localparam media2h_left=96;
	localparam media2h_right=159;
	localparam media2h_y_t = 128;
	localparam media2h_y_b = 130;
	wire  media2h_on;
	assign media2h_on = (media2h_left<=pix_x) && (pix_x<=media2h_right) &&
	(media2h_y_t<=pix_y) && (pix_y<=media2h_y_b);
//------------------------------------------
//segunda caja
//------------------------------------------

//vertical1

	localparam media1v2_left=220;
	localparam media1v2_right=224;
	localparam media1v2_y_t = 61; //listos
	localparam media1v2_y_b = 130;
	wire  media1v2_on;
	assign media1v2_on = (media1v2_left<=pix_x) && (pix_x<=media1v2_right) &&
	(media1v2_y_t<=pix_y) && (pix_y<=media1v2_y_b);
//vertial2

	localparam media2v2_left=287;
	localparam media2v2_right=290;
	localparam media2v2_y_t = 61;
	localparam media2v2_y_b = 130;
	wire  media2v2_on;
	assign media2v2_on = (media2v2_left<=pix_x) && (pix_x<=media2v2_right) &&
	(media2v2_y_t<=pix_y) && (pix_y<=media2v2_y_b);
//horizontal1
	localparam media1h2_left=224;
	localparam media1h2_right=287;
	localparam media1h2_y_t = 61;
	localparam media1h2_y_b = 63;
	wire  media1h2_on;
	assign media1h2_on = (media1h2_left<=pix_x) && (pix_x<=media1h2_right) &&
	(media1h2_y_t<=pix_y) && (pix_y<=media1h2_y_b);
//horizontal2
	localparam media2h2_left=224;
	localparam media2h2_right=287;
	localparam media2h2_y_t = 128; //ready
	localparam media2h2_y_b = 130;
	wire  media2h2_on;
	assign media2h2_on = (media2h2_left<=pix_x) && (pix_x<=media2h2_right) &&
	(media2h2_y_t<=pix_y) && (pix_y<=media2h2_y_b);

//tercera caja
//------------------------------------------

//vertical1

	localparam media1v3_left=348;
	localparam media1v3_right=352;
	localparam media1v3_y_t = 61; //ready
	localparam media1v3_y_b = 130;
	wire  media1v3_on;
	assign media1v3_on = (media1v3_left<=pix_x) && (pix_x<=media1v3_right) &&
	(media1v3_y_t<=pix_y) && (pix_y<=media1v3_y_b);
//vertial2

	localparam media2v3_left=415;
	localparam media2v3_right=418;
	localparam media2v3_y_t = 61;
	localparam media2v3_y_b = 130;
	wire  media2v3_on;
	assign media2v3_on = (media2v3_left<=pix_x) && (pix_x<=media2v3_right) &&
	(media2v3_y_t<=pix_y) && (pix_y<=media2v3_y_b);
//horizontal1
	localparam media1h3_left=352;
	localparam media1h3_right=415;
	localparam media1h3_y_t = 61;
	localparam media1h3_y_b = 63;
	wire  media1h3_on;
	assign media1h3_on = (media1h3_left<=pix_x) && (pix_x<=media1h3_right) &&
	(media1h3_y_t<=pix_y) && (pix_y<=media1h3_y_b);
//horizontal2
	localparam media2h3_left=352;
	localparam media2h3_right=415;
	localparam media2h3_y_t = 128; //ready
	localparam media2h3_y_b = 130;
	wire  media2h3_on;
	assign media2h3_on = (media2h3_left<=pix_x) && (pix_x<=media2h3_right) &&
	(media2h3_y_t<=pix_y) && (pix_y<=media2h3_y_b);
//------------------------------------------------------------------------------

//********************************************
//CREACION DE CAJAS QUE VAN DENTRO DE LA CAJA DE FECHA las que encierran a los numeros
//-----------------------
//primer caja
//vertical1

	localparam fecha1v_left=92;
	localparam fecha1v_right=96;
	localparam fecha1v_y_t = 189;
	localparam fecha1v_y_b = 258;
	wire  fecha1v_on;
	assign fecha1v_on = (fecha1v_left<=pix_x) && (pix_x<=fecha1v_right) &&
	(fecha1v_y_t<=pix_y) && (pix_y<=fecha1v_y_b);
//vertial2

	localparam fecha2v_left=160;
	localparam fecha2v_right=162;
	localparam fecha2v_y_t = 189; //listo
	localparam fecha2v_y_b = 258;
	wire  fecha2v_on;
	assign fecha2v_on = (fecha2v_left<=pix_x) && (pix_x<=fecha2v_right) &&
	(fecha2v_y_t<=pix_y) && (pix_y<=fecha2v_y_b);
//horizontal1
	localparam fecha1h_left=96;
	localparam fecha1h_right=159;
	localparam fecha1h_y_t = 189; //listo
	localparam fecha1h_y_b = 191;
	wire  fecha1h_on;
	assign fecha1h_on = (fecha1h_left<=pix_x) && (pix_x<=fecha1h_right) &&
	(fecha1h_y_t<=pix_y) && (pix_y<=fecha1h_y_b);
//horizontal2
	localparam fecha2h_left=96;
	localparam fecha2h_right=159;
	localparam fecha2h_y_t = 256; //ok
	localparam fecha2h_y_b = 258;
	wire  fecha2h_on;
	assign fecha2h_on = (fecha2h_left<=pix_x) && (pix_x<=fecha2h_right) &&
	(fecha2h_y_t<=pix_y) && (pix_y<=fecha2h_y_b);

//segunda caja en la fecha

//vertical1

	localparam fecha1v2_left=220;
	localparam fecha1v2_right=224;
	localparam fecha1v2_y_t = 189;  //listo
	localparam fecha1v2_y_b = 258;
	wire  fecha1v2_on;
	assign fecha1v2_on = (fecha1v2_left<=pix_x) && (pix_x<=fecha1v2_right) &&
	(fecha1v2_y_t<=pix_y) && (pix_y<=fecha1v2_y_b);
//vertial2

	localparam fecha2v2_left=288;
	localparam fecha2v2_right=290;
	localparam fecha2v2_y_t = 189;
	localparam fecha2v2_y_b = 258;
	wire  fecha2v2_on;
	assign fecha2v2_on = (fecha2v2_left<=pix_x) && (pix_x<=fecha2v2_right) &&
	(fecha2v2_y_t<=pix_y) && (pix_y<=fecha2v2_y_b);
//horizontal1
	localparam fecha1h2_left=224;
	localparam fecha1h2_right=287;
	localparam fecha1h2_y_t = 189;//ok
	localparam fecha1h2_y_b = 191;
	wire  fecha1h2_on;
	assign fecha1h2_on = (fecha1h2_left<=pix_x) && (pix_x<=fecha1h2_right) &&
	(fecha1h2_y_t<=pix_y) && (pix_y<=fecha1h2_y_b);
//horizontal2
	localparam fecha2h2_left=224;
	localparam fecha2h2_right=287;
	localparam fecha2h2_y_t = 256;//ok
	localparam fecha2h2_y_b = 258;
	wire  fecha2h2_on;
	assign fecha2h2_on = (fecha2h2_left<=pix_x) && (pix_x<=fecha2h2_right) &&
	(fecha2h2_y_t<=pix_y) && (pix_y<=fecha2h2_y_b);

//tercera caja dentro de fecha

//vertical1

	localparam fecha1v3_left=348;
	localparam fecha1v3_right=352;
	localparam fecha1v3_y_t = 189; //listo
	localparam fecha1v3_y_b = 258;
	wire  fecha1v3_on;
	assign fecha1v3_on = (fecha1v3_left<=pix_x) && (pix_x<=fecha1v3_right) &&
	(fecha1v3_y_t<=pix_y) && (pix_y<=fecha1v3_y_b);
//vertial2

	localparam fecha2v3_left=416;
	localparam fecha2v3_right=418;
	localparam fecha2v3_y_t = 189;
	localparam fecha2v3_y_b = 258;
	wire  fecha2v3_on;
	assign fecha2v3_on = (fecha2v3_left<=pix_x) && (pix_x<=fecha2v3_right) &&
	(fecha2v3_y_t<=pix_y) && (pix_y<=fecha2v3_y_b);
//horizontal1
	localparam fecha1h3_left=352;
	localparam fecha1h3_right=415;
	localparam fecha1h3_y_t = 189;//ok
	localparam fecha1h3_y_b = 191;
	wire  fecha1h3_on;
	assign fecha1h3_on = (fecha1h3_left<=pix_x) && (pix_x<=fecha1h3_right) &&
	(fecha1h3_y_t<=pix_y) && (pix_y<=fecha1h3_y_b);
//horizontal2
	localparam fecha2h3_left=352;
	localparam fecha2h3_right=415;
	localparam fecha2h3_y_t = 256;//ok
	localparam fecha2h3_y_b = 258;
	wire  fecha2h3_on;
	assign fecha2h3_on = (fecha2h3_left<=pix_x) && (pix_x<=fecha2h3_right) &&
	(fecha2h3_y_t<=pix_y) && (pix_y<=fecha2h3_y_b);

//---------------------------------------------------------------------------
//-----------------------------------------------------------------
//***************************************************
//---------------------------------------------------------------
//CAJAS QUE VAN DENTRO DEL CRONOMETRO


//vertical1

	localparam crono1v_left=92;
	localparam crono1v_right=95;
	localparam crono1v_y_t = 317;
	localparam crono1v_y_b = 386;
	wire  crono1v_on;
	assign crono1v_on = (crono1v_left<=pix_x) && (pix_x<=crono1v_right) &&
	(crono1v_y_t<=pix_y) && (pix_y<=crono1v_y_b);
//vertial2

	localparam crono2v_left=159;
	localparam crono2v_right=162;
	localparam crono2v_y_t = 317;
	localparam crono2v_y_b = 386;
	wire  crono2v_on;
	assign crono2v_on = (crono2v_left<=pix_x) && (pix_x<=crono2v_right) &&
	(crono2v_y_t<=pix_y) && (pix_y<=crono2v_y_b);
//horizontal1
	localparam crono1h_left=96;
	localparam crono1h_right=159;
	localparam crono1h_y_t = 317;
	localparam crono1h_y_b = 319;
	wire  crono1h_on;
	assign crono1h_on = (crono1h_left<=pix_x) && (pix_x<=crono1h_right) &&
	(crono1h_y_t<=pix_y) && (pix_y<=crono1h_y_b);
//horizontal2
	localparam crono2h_left=96;
	localparam crono2h_right=159;
	localparam crono2h_y_t = 384;
	localparam crono2h_y_b = 386;
	wire  crono2h_on;
	assign crono2h_on = (crono2h_left<=pix_x) && (pix_x<=crono2h_right) &&
	(crono2h_y_t<=pix_y) && (pix_y<=crono2h_y_b);

//segunda caja crono
//si algo comienza a dar problemas es porque aqui el pixel 307 coincide en la cajas, igual pasa en las cajas de la hora
//vertical1

	localparam crono1v2_left=220;
	localparam crono1v2_right=223;
	localparam crono1v2_y_t = 317;
	localparam crono1v2_y_b = 386;
	wire  crono1v2_on;
	assign crono1v2_on = (crono1v2_left<=pix_x) && (pix_x<=crono1v2_right) &&
	(crono1v2_y_t<=pix_y) && (pix_y<=crono1v2_y_b);
//vertial2

	localparam crono2v2_left=287;
	localparam crono2v2_right=290;
	localparam crono2v2_y_t = 317;
	localparam crono2v2_y_b = 386;
	wire  crono2v2_on;
	assign crono2v2_on = (crono2v2_left<=pix_x) && (pix_x<=crono2v2_right) &&
	(crono2v2_y_t<=pix_y) && (pix_y<=crono2v2_y_b);
//horizontal1
	localparam crono1h2_left=224;
	localparam crono1h2_right=287;
	localparam crono1h2_y_t = 317;
	localparam crono1h2_y_b = 319;
	wire  crono1h2_on;
	assign crono1h2_on = (crono1h2_left<=pix_x) && (pix_x<=crono1h2_right) &&
	(crono1h2_y_t<=pix_y) && (pix_y<=crono1h2_y_b);
//horizontal2
	localparam crono2h2_left=224;
	localparam crono2h2_right=287;
	localparam crono2h2_y_t = 384;
	localparam crono2h2_y_b = 386;
	wire  crono2h2_on;
	assign crono2h2_on = (crono2h2_left<=pix_x) && (pix_x<=crono2h2_right) &&
	(crono2h2_y_t<=pix_y) && (pix_y<=crono2h2_y_b);

//tercera caja crono

//vertical1

	localparam crono1v3_left=348;
	localparam crono1v3_right=351;
	localparam crono1v3_y_t = 317;
	localparam crono1v3_y_b = 386;
	wire  crono1v3_on;
	assign crono1v3_on = (crono1v3_left<=pix_x) && (pix_x<=crono1v3_right) &&
	(crono1v3_y_t<=pix_y) && (pix_y<=crono1v3_y_b);
//vertial2

	localparam crono2v3_left=415;
	localparam crono2v3_right=418;
	localparam crono2v3_y_t = 317;
	localparam crono2v3_y_b = 386;
	wire  crono2v3_on;
	assign crono2v3_on = (crono2v3_left<=pix_x) && (pix_x<=crono2v3_right) &&
	(crono2v3_y_t<=pix_y) && (pix_y<=crono2v3_y_b);
//horizontal1
	localparam crono1h3_left=352;//ok
	localparam crono1h3_right=415;
	localparam crono1h3_y_t = 317;
	localparam crono1h3_y_b = 319;
	wire  crono1h3_on;
	assign crono1h3_on = (crono1h3_left<=pix_x) && (pix_x<=crono1h3_right) &&
	(crono1h3_y_t<=pix_y) && (pix_y<=crono1h3_y_b);
//horizontal2
	localparam crono2h3_left=352;
	localparam crono2h3_right=415;
	localparam crono2h3_y_t = 384;
	localparam crono2h3_y_b = 386;
	wire  crono2h3_on;
	assign crono2h3_on = (crono2h3_left<=pix_x) && (pix_x<=crono2h3_right) &&
	(crono2h3_y_t<=pix_y) && (pix_y<=crono2h3_y_b);


//-----------------------------------------------------------------------
//CAJAS QUE ENCERRAN EL RTC
//*************************************************************************
//vertical1

	localparam B1v2_left=10;
	localparam B1v2_right=11;
	localparam B1v2_y_t = 45;
	localparam B1v2_y_b = 147;
	wire  B1v2_on;
	assign B1v2_on = (B1v2_left<=pix_x) && (pix_x<=B1v2_right) &&
	(B1v2_y_t<=pix_y) && (pix_y<=B1v2_y_b);
//vertial2

	localparam B2v2_left=435;
	localparam B2v2_right=436;
	localparam B2v2_y_t = 45;
	localparam B2v2_y_b = 147;
	wire  B2v2_on;
	assign B2v2_on = (B2v2_left<=pix_x) && (pix_x<=B2v2_right) &&
	(B2v2_y_t<=pix_y) && (pix_y<=B2v2_y_b);
//horizontal1
	localparam B1h2_left=12;
	localparam B1h2_right=434;
	localparam B1h2_y_t = 45;
	localparam B1h2_y_b = 46;
	wire  B1h2_on;
	assign B1h2_on = (B1h2_left<=pix_x) && (pix_x<=B1h2_right) &&
	(B1h2_y_t<=pix_y) && (pix_y<=B1h2_y_b);
//horizontal2
	localparam B2h2_left=12;
	localparam B2h2_right=434;
	localparam B2h2_y_t = 146;
	localparam B2h2_y_b = 147;
	wire  B2h2_on;
	assign B2h2_on = (B2h2_left<=pix_x) && (pix_x<=B2h2_right) &&
	(B2h2_y_t<=pix_y) && (pix_y<=B2h2_y_b);


//**********************************************************************
//SEGUNDO BORDE
//*************************************************************************
//vertical1
	localparam B1v2b_left=10;
	localparam B1v2b_right=11;
	localparam B1v2b_y_t = 173;
	localparam B1v2b_y_b = 275;
	wire  B1v2b_on;
	assign B1v2b_on = (B1v2b_left<=pix_x) && (pix_x<=B1v2b_right) &&
	(B1v2b_y_t<=pix_y) && (pix_y<=B1v2b_y_b);
//vertial2

	localparam B2v2b_left=435;
	localparam B2v2b_right=436;
	localparam B2v2b_y_t = 173;
	localparam B2v2b_y_b = 275;
	wire  B2v2b_on;
	assign B2v2b_on = (B2v2b_left<=pix_x) && (pix_x<=B2v2b_right) &&
	(B2v2b_y_t<=pix_y) && (pix_y<=B2v2b_y_b);
//horizontal1
	localparam B1h2b_left=12;
	localparam B1h2b_right=434;
	localparam B1h2b_y_t = 173;
	localparam B1h2b_y_b = 174;
	wire  B1h2b_on;
	assign B1h2b_on = (B1h2b_left<=pix_x) && (pix_x<=B1h2b_right) &&
	(B1h2b_y_t<=pix_y) && (pix_y<=B1h2b_y_b);
//horizontal2
	localparam B2h2b_left=12;
	localparam B2h2b_right=434;
	localparam B2h2b_y_t = 274;
	localparam B2h2b_y_b = 275;
	wire  B2h2b_on;
	assign B2h2b_on = (B2h2b_left<=pix_x) && (pix_x<=B2h2b_right) &&
	(B2h2b_y_t<=pix_y) && (pix_y<=B2h2b_y_b);

//*********************************************************
//tercer borde

//vertical1
	localparam B1v2c_left=10;
	localparam B1v2c_right=11;
	localparam B1v2c_y_t = 300;
	localparam B1v2c_y_b = 404;
	wire  B1v2c_on;
	assign B1v2c_on = (B1v2c_left<=pix_x) && (pix_x<=B1v2c_right) &&
	(B1v2c_y_t<=pix_y) && (pix_y<=B1v2c_y_b);
//vertial2

	localparam B2v2c_left=435;
	localparam B2v2c_right=436;
	localparam B2v2c_y_t = 300;
	localparam B2v2c_y_b = 404;
	wire  B2v2c_on;
	assign B2v2c_on = (B2v2c_left<=pix_x) && (pix_x<=B2v2c_right) &&
	(B2v2c_y_t<=pix_y) && (pix_y<=B2v2c_y_b);
//horizontal1
	localparam B1h2c_left=12;
	localparam B1h2c_right=434;
	localparam B1h2c_y_t = 300;
	localparam B1h2c_y_b = 301;
	wire  B1h2c_on;
	assign B1h2c_on = (B1h2c_left<=pix_x) && (pix_x<=B1h2c_right) &&
	(B1h2c_y_t<=pix_y) && (pix_y<=B1h2c_y_b);
//horizontal2
	localparam B2h2c_left=12;
	localparam B2h2c_right=434;
	localparam B2h2c_y_t = 403;
	localparam B2h2c_y_b = 404;
	wire  B2h2c_on;
	assign B2h2c_on = (B2h2c_left<=pix_x) && (pix_x<=B2h2c_right) &&
	(B2h2c_y_t<=pix_y) && (pix_y<=B2h2c_y_b);
//**********************************************************************
//------------------------------------------------------------------



//*********************************************************
//caja para el teclado

//vertical1
	localparam key1v2c_left = 456;
	localparam key1v2c_right = 457;
	localparam key1v2c_y_t = 32;
	localparam key1v2c_y_b = 276;
	wire  key1v2c_on;
	assign key1v2c_on = (key1v2c_left<=pix_x) && (pix_x<=key1v2c_right) &&
	(key1v2c_y_t<=pix_y) && (pix_y<=key1v2c_y_b);
//vertical2

	localparam keyv2c_left=583;
	localparam keyv2c_right=584;
	localparam keyv2c_y_t = 32;
	localparam keyv2c_y_b = 276;
	wire  keyv2c_on;
	assign keyv2c_on = (keyv2c_left<=pix_x) && (pix_x<=keyv2c_right) &&
	(keyv2c_y_t<=pix_y) && (pix_y<=keyv2c_y_b);
//horizontal1
	localparam key1h2c_left=458;
	localparam key1h2c_right=582;
	localparam key1h2c_y_t = 32;
	localparam key1h2c_y_b = 33;
	wire  key1h2c_on;
	assign key1h2c_on = (key1h2c_left<=pix_x) && (pix_x<=key1h2c_right) &&
	(key1h2c_y_t<=pix_y) && (pix_y<=key1h2c_y_b);
//horizontal2
	localparam keyh2c_left=458;
	localparam keyh2c_right=582;
	localparam keyh2c_y_t = 275;
	localparam keyh2c_y_b = 276;
	wire  keyh2c_on;
	assign keyh2c_on = (keyh2c_left<=pix_x) && (pix_x<=keyh2c_right) &&
	(keyh2c_y_t<=pix_y) && (pix_y<=keyh2c_y_b);


//**********************************************************************
//------------------------------------------------------------------

wire [11:0] color;
assign color=12'h009;
reg [11:0] rgbtext1=12'hfff;

always@*
			if(reset)
					rgbtext1<=12'h000;
			else begin
						case(video_on)
						0: begin
								rgbtext1<=12'h000;
								end

						1: begin
									if (grandec2h_on | grandec1h_on | grandec1v_on |grandec2v_on | grandef2h_on | grandef1h_on | grandef2v_on | grandef1v_on | grande2h_on | grande1h_on | grande2v_on | grande1v_on)
										rgbtext1<=12'h00f;
									else if (media1v_on | media2v_on | media1h_on | media2h_on |media1v2_on | media2v2_on|media1h2_on |media2h2_on |media1v3_on | media2v3_on|media1h3_on |media2h3_on)
										rgbtext1<=color;
									else if(fecha1v_on | fecha2v_on | fecha1h_on | fecha2h_on |fecha1v2_on | fecha2v2_on | fecha1h2_on | fecha2h2_on |fecha1v3_on | fecha2v3_on | fecha1h3_on | fecha2h3_on)
										rgbtext1<=color;
									else if(crono1v_on | crono2v_on | crono1h_on | crono2h_on |crono1v2_on | crono2v2_on | crono1h2_on | crono2h2_on |crono1v3_on | crono2v3_on | crono1h3_on | crono2h3_on)
										rgbtext1<=color;
									else if(B2h2_on | B1h2_on |B1v2_on | B2v2_on|B2h2b_on | B1h2b_on |B1v2b_on | B2v2b_on|B2h2c_on | B1h2c_on |B1v2c_on | B2v2c_on)
											rgbtext1<=12'h049;
									else if(key1h2c_on | keyh2c_on | key1v2c_on | keyv2c_on)
											rgbtext1<=12'hfff;
									else
									rgbtext1<=12'h000;
						   end

						default:rgbtext1<=12'hfff;
						endcase
end

assign rgbtext=rgbtext1;

endmodule
