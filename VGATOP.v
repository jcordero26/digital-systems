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
   input activar_alarma,
   output wire hsync, vsync,
   output video_on1,
   output wire [11:0] rgb,
	 output wire [11:0] rgbIMAGE,
   output [9:0] pixX,pixY,
   input [7:0] hour_in1,hour_in2,hour_in3,
   input wire [7:0] fecha_in1,fecha_in2,fecha_in3,
	 input wire [7:0] timer_in1,timer_in2,timer_in3,

	//input [7:0] hour_in1,
	input programar_on,
	input [3:0] direccion_actual_pantalla
);


//-----------------------------------------------------------------------------------------------------
//					WIRES Y REGS DE PROPOSITO GENERAL: PARA TESTBENCH O CONEXION FINAL PARA LA IMPLEMENTACION
//-----------------------------------------------------------------------------------------------------

  wire [9:0] pixel_y,pixel_x;
  wire video_on , pixel_tick;
  reg [11:0] rgb_reg;
  wire [11:0] rgb_next;
	wire [11:0] rgb_ring,rgb_letra,rgb_bordes;
  reg [11:0] rgb_ring_reg;
  reg [11:0]rgb_letra_reg;
  reg [11:0]rgb_bordes_reg;
  wire [11:0] rgb_ring_next,rgb_letra_next,rgb_bordes_next;

	//para numeros
	wire [11:0] rgb_numero_hora;
	wire [11:0] rgb_numero_hora_next;
	reg [11:0] rgb_numero_hora_reg;

	wire [11:0] rgb_numero_fecha;
	wire [11:0] rgb_numero_fecha_next;
	reg [11:0] rgb_numero_fecha_reg;

	wire [11:0] rgb_numero_timer;
	wire [11:0] rgb_numero_timer_next;
	reg [11:0] rgb_numero_timer_reg;

	wire [11:0] rgb_simbolo;
	wire [11:0] rgb_simbolo_next;
	reg [11:0] rgb_simbolo_reg;

	wire [11:0] rgb_imagenes;
	wire [11:0] rgb_imagenes_next;
	reg [11:0] rgb_imagenes_reg;

	wire okh,okf,okt;


//PARA EL TESBENCH

  assign pixX=pixel_x;
  assign pixY=pixel_y;
  assign video_on1=video_on;
	assign rgbIMAGE=rgb_imagenes;

//SIMULANDO BOTONES DEL TECLADO

	wire aI,bI,cI,dI,upI,downI,leftI,rightI;
	assign {aI,bI,cI,dI,upI,downI,leftI,rightI} = {1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};


//---------------------------------------------
//					LLAMADO A MODULOS INFERIORES
//---------------------------------------------


SIMBOLOS simb(
.pix_y(pixel_y),
.pix_x(pixel_x),
.clk(clk),
.reset(reset),
.rgbtext(rgb_simbolo_next)
);


HOURNUMBERS horasvga(
 .okmaquina(okh),
 .pix_y(pixel_y),
 .pix_x(pixel_x),
 .video_on(video_on),
 .programar_on(programar_on),
 .direccion_actual_pantalla(direccion_actual_pantalla),
 .clk(clk),.reset(reset),
 .rgbtext(rgb_numero_hora_next),
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
  .rgbtext(rgb_numero_fecha_next),
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
   .rgbtext(rgb_numero_timer_next),
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
		.rgbtext(rgb_ring_next)
);

SQUARE sq(
		.pix_y(pixel_y),.pix_x(pixel_x),
		.video_on(video_on),
		.reset(reset),
		.rgbtext(rgb_bordes_next)
);

TEXTO texto(
		.pixel_y(pixel_y),.pixel_x(pixel_x),
		.clk(clk),
		.rgbtext(rgb_letra_next)
);


img IMAGENES(
      .clk(clk),
			.reset(reset),
			.aI(aI),
			.bI(bI),
			.cI(cI),
			.dI(dI),
			.upI(upI),
			.downI(downI),
			.leftI(leftI),
			.rightI(rightI),
			.pixel_x(pixX),
		  .pixel_y(pixY),
      .rgb(rgb_imagenes_next)

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
			.rgb_screen(rgb_next),
			.okh(okh),.okf(okf),.okt(okt)
);

//---------------------------------------------
//					CUERPO
//---------------------------------------------

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

endmodule
