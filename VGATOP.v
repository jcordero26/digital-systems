`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:03:06 09/22/2016

// Module Name:    VGATOP
// Project Name:  CONTROL RTC CON PICOBLAZE
// Target Devices:   ARTIX 7
// Tool versions:
// Description:  MODULO TOP DE PANTALLA VGA

// Additional Comments: hecho por JOAO SALAS
//
///////////////////////////////////////////////////////////////////////////////////
module VGATOP(
	 input wire clk,reset,
	 input ps2d,ps2c, rx_en,
   input activar_alarma,
   output wire hsync, vsync,
     output wire [11:0] rgb,
  output [9:0] pixX,pixY,
input [7:0] hour_in1,hour_in2,hour_in3,
input wire [7:0] fecha_in1,fecha_in2,fecha_in3,
input wire [7:0] timer_in1,timer_in2,timer_in3,

//	input [7:0] hour_in1,
	input programar_on,
	input [3:0] direccion_actual_pantalla
);

wire a,b,c,d,up,down,left,right;

//de prueba
/*
wire [7:0] hour_in2,hour_in3;
wire [7:0] fecha_in1,fecha_in2,fecha_in3;
wire [7:0] timer_in1,timer_in2,timer_in3;

assign{hour_in2,hour_in3,fecha_in1,fecha_in2,fecha_in3,timer_in1,timer_in2,timer_in3}=
			{hour_in1,hour_in1,hour_in1,hour_in1,hour_in1,hour_in1,hour_in1,hour_in1};
*/
//-----------------------------------------------------------------------------------------------------
//					WIRES Y REGS DE PROPOSITO GENERAL: PARA TESTBENCH O CONEXION FINAL PARA LA IMPLEMENTACION
//-----------------------------------------------------------------------------------------------------

  wire [9:0] pixel_y,pixel_x;
  wire video_on , pixel_tick;

	wire [11:0] rgb_ring,rgb_letra,rgb_bordes;

  wire [11:0] rgb_ring_next,rgb_letra_next,rgb_bordes_next;

	//para numeros
	wire [11:0] rgb_numero_hora;


	wire [11:0] rgb_numero_fecha;


	wire [11:0] rgb_numero_timer;


	wire [11:0] rgb_simbolo;


	wire [11:0] rgb_imagenes;

  wire [11:0] rgb_animado;

	wire okh,okf,okt;


//PARA EL TESBENCH

  assign pixX=pixel_x;
  assign pixY=pixel_y;
  //assign video_on1=video_on;



//---------------------------------------------
//					LLAMADO A MODULOS INFERIORES
//---------------------------------------------


SIMBOLOS simb(
.pix_y(pixel_y),
.pix_x(pixel_x),
.clk(clk),
.reset(reset),
.rgbtext(rgb_simbolo)
);


HOURNUMBERS horasvga(
 .okmaquina(okh),
 .pix_y(pixel_y),
 .pix_x(pixel_x),
 .video_on(video_on),
 .programar_on(programar_on),
 .direccion_actual_pantalla(direccion_actual_pantalla),
 .clk(clk),.reset(reset),
 .rgbtext(rgb_numero_hora),
 .hour_in1(hour_in1),
 .hour_in2(hour_in2),
 .hour_in3(hour_in3)
 );


DATENUMBERS datevg(
	.okmaquina(okf),
  .pix_y(pixel_y),
	.pix_x(pixel_x),
  .video_on(video_on),
	.programar_on(programar_on),
  .direccion_actual_pantalla(direccion_actual_pantalla),
  .clk(clk),.reset(reset),
  .rgbtext(rgb_numero_fecha),
  .fecha_in1(fecha_in1),
	.fecha_in2(fecha_in2),
	.fecha_in3(fecha_in3)
  );



TIMERNUMBERS cronovga(
	 .okmaquina(okt),
   .pix_y(pixel_y),
	 .pix_x(pixel_x),
   .video_on(video_on),
	 .programar_on(programar_on),
   .direccion_actual_pantalla(direccion_actual_pantalla),
   .clk(clk),.reset(reset),
   .rgbtext(rgb_numero_timer),
   .timer_in1(timer_in1),
	 .timer_in2(timer_in2),
	 .timer_in3(timer_in3)
);

SINCRONIZADOR sync(
		.clk(clk),
		.reset(reset),
		.hsync(hsync),
		.vsync(vsync),
		.video_activado(video_on),
		.instante_pulso(pixel_tick),
		.pixel_x(pixel_x),
		.pixel_y(pixel_y)
);


RING finish(
		.activar_alarma(activar_alarma),
		.pixel_y(pixel_y),
		.pixel_x(pixel_x),
		.clk(clk),
		.reset(reset),
		.rgbtext(rgb_ring)
);

SQUARE sq(
		.pix_y(pixel_y),.pix_x(pixel_x),
		.video_on(video_on),
		.reset(reset),
		.rgbtext(rgb_bordes)
);

TEXTO texto(
		.pixel_y(pixel_y),.pixel_x(pixel_x),
		.clk(clk),
		.reset(reset),
		.rgbtext(rgb_letra)
);

topkey KEYBOARD(
	.clk(clk),
	.reset(reset),
	.ps2d(ps2d),
	.ps2c(ps2c),
	.rx_en(rx_en),
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.up(up),
	.down(down),
	.left(left),
	.right(right)
	);



	animado  LUCES(
	  	.reset(reset),
		  .clk(clk),
			.pix_y(pixel_y),
			.pix_x(pixel_x),
			.video_on(video_on),
	    .rgbtext(rgb_animado)
	    );



img IMAGENES(
      .clk(clk),
			.reset(reset),
			.aI(a),
			.bI(b),
			.cI(c),
			.dI(d),
			.upI(up),
			.downI(down),
			.leftI(left),
			.rightI(right),
			.pixel_x(pixel_x),
		   .pixel_y(pixel_y),
       .rgb(rgb_imagenes)

);


SELECCIONADOR_RGB selector(
			.clk(clk),
			.video_on(video_on),
			.reset(reset),
			.pix_x(pixel_x),
			.pix_y(pixel_y),
			.rgb_numero_hora(rgb_numero_hora),
			.rgb_numero_fecha(rgb_numero_fecha),
			.rgb_numero_timer(rgb_numero_timer),
			.rgb_ring(rgb_ring),
			.rgb_letra(rgb_letra),
			.rgb_bordes(rgb_bordes),
			.rgb_simbolo(rgb_simbolo),
			.rgb_imagen(rgb_imagenes),
			.rgb_animado(rgb_animado),
			.rgb_screen(rgb),
			.okh(okh),.okf(okf),.okt(okt)
);

//---------------------------------------------
//					CUERPO
//---------------------------------------------
/*
always @(posedge clk) begin
		if(reset)begin
			rgb_reg <= 0;

		  rgb_numero_hora_reg<=0;
		  rgb_numero_fecha_reg<=0;
		  rgb_numero_timer_reg<=0;

		  rgb_ring_reg<=0;
		  rgb_letra_reg<=0;
		  rgb_bordes_reg<=0;
			rgb_simbolo_reg<=0;

			rgb_imagenes_reg<=0;

		end
		else if(pixel_tick) begin
		  rgb_reg <= rgb_next;

		  rgb_numero_hora_reg<=rgb_numero_hora_next;
		  rgb_numero_fecha_reg<=rgb_numero_fecha_next;
		  rgb_numero_timer_reg<=rgb_numero_timer_next;

		  rgb_ring_reg<=rgb_ring_next;
		  rgb_letra_reg<=rgb_letra_next;
		  rgb_bordes_reg<=rgb_bordes_next;
			rgb_simbolo_reg<=rgb_simbolo_next;

			rgb_imagenes_reg<=rgb_imagenes_next;
		end
end

//salidas a modulos

assign rgb_simbolo=rgb_simbolo_reg;
assign rgb_numero_hora=rgb_numero_hora_reg;
assign rgb_numero_fecha=rgb_numero_fecha_reg;
assign rgb_numero_timer=rgb_numero_timer_reg;
assign rgb_imagenes=rgb_imagenes_reg;
assign rgb_ring=rgb_ring_reg;
assign rgb_letra=rgb_letra_reg;
assign rgb_bordes = rgb_bordes_reg;

//salida final a pantalla

assign rgb=rgb_reg;
*/
endmodule
