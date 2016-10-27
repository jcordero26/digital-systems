`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    01:23:31 10/24/2016
// Design Name:
// Module Name:    animado
// Project Name:


// Additional Comments: hecho por joao salas
//
//////////////////////////////////////////////////////////////////////////////////
module animado(
   input reset,clk,
   input [9:0] pix_y, pix_x,
   input wire video_on,
   output  [11:0] rgbtext
    );



    //cajas para las horas
    //primer caja
    //vertical1

    	localparam media1v_left=464;
    	localparam media1v_right=465;
    	localparam media1v_y_t = 279;
    	localparam media1v_y_b = 291;
    	wire  media1v_on;
    	assign media1v_on = (media1v_left<=pix_x) && (pix_x<=media1v_right) &&
    	(media1v_y_t<=pix_y) && (pix_y<=media1v_y_b);
    //vertial2

    	localparam media2v_left=483;
    	localparam media2v_right=484;
    	localparam media2v_y_t = 279;
    	localparam media2v_y_b = 291;
    	wire  media2v_on;
    	assign media2v_on = (media2v_left<=pix_x) && (pix_x<=media2v_right) &&
    	(media2v_y_t<=pix_y) && (pix_y<=media2v_y_b);
    //horizontal1
    	localparam media1h_left=465;
    	localparam media1h_right=483;
    	localparam media1h_y_t = 279;
    	localparam media1h_y_b = 280;
    	wire  media1h_on;
    	assign media1h_on = (media1h_left<=pix_x) && (pix_x<=media1h_right) &&
    	(media1h_y_t<=pix_y) && (pix_y<=media1h_y_b);
    //horizontal2
    	localparam media2h_left=465;
    	localparam media2h_right=483;
    	localparam media2h_y_t = 290;
    	localparam media2h_y_b = 291;
    	wire  media2h_on;
    	assign media2h_on = (media2h_left<=pix_x) && (pix_x<=media2h_right) &&
    	(media2h_y_t<=pix_y) && (pix_y<=media2h_y_b);
    //------------------------------------------
    //segunda caja
    //------------------------------------------

    //vertical1

    	localparam media1v2_left=486;
    	localparam media1v2_right=487;
    	localparam media1v2_y_t = 279; //listos
    	localparam media1v2_y_b = 291;
    	wire  media1v2_on;
    	assign media1v2_on = (media1v2_left<=pix_x) && (pix_x<=media1v2_right) &&
    	(media1v2_y_t<=pix_y) && (pix_y<=media1v2_y_b);
    //vertial2

    	localparam media2v2_left=505;
    	localparam media2v2_right=506;
    	localparam media2v2_y_t = 279;
    	localparam media2v2_y_b = 291;
    	wire  media2v2_on;
    	assign media2v2_on = (media2v2_left<=pix_x) && (pix_x<=media2v2_right) &&
    	(media2v2_y_t<=pix_y) && (pix_y<=media2v2_y_b);
    //horizontal1
    	localparam media1h2_left=487;
    	localparam media1h2_right=505;
    	localparam media1h2_y_t = 279;
    	localparam media1h2_y_b = 280;
    	wire  media1h2_on;
    	assign media1h2_on = (media1h2_left<=pix_x) && (pix_x<=media1h2_right) &&
    	(media1h2_y_t<=pix_y) && (pix_y<=media1h2_y_b);
    //horizontal2
    	localparam media2h2_left=487;
    	localparam media2h2_right=505;
    	localparam media2h2_y_t = 290; //ready
    	localparam media2h2_y_b = 291;
    	wire  media2h2_on;
    	assign media2h2_on = (media2h2_left<=pix_x) && (pix_x<=media2h2_right) &&
    	(media2h2_y_t<=pix_y) && (pix_y<=media2h2_y_b);

    //tercera caja
    //------------------------------------------

    //vertical1

    	localparam media1v3_left=508;
    	localparam media1v3_right=509;
    	localparam media1v3_y_t = 279; //ready
    	localparam media1v3_y_b = 291;
    	wire  media1v3_on;
    	assign media1v3_on = (media1v3_left<=pix_x) && (pix_x<=media1v3_right) &&
    	(media1v3_y_t<=pix_y) && (pix_y<=media1v3_y_b);
    //vertial2

    	localparam media2v3_left=527;
    	localparam media2v3_right=528;
    	localparam media2v3_y_t = 279;
    	localparam media2v3_y_b = 291;
    	wire  media2v3_on;
    	assign media2v3_on = (media2v3_left<=pix_x) && (pix_x<=media2v3_right) &&
    	(media2v3_y_t<=pix_y) && (pix_y<=media2v3_y_b);
    //horizontal1
    	localparam media1h3_left=509;
    	localparam media1h3_right=527;
    	localparam media1h3_y_t = 279;
    	localparam media1h3_y_b = 280;
    	wire  media1h3_on;
    	assign media1h3_on = (media1h3_left<=pix_x) && (pix_x<=media1h3_right) &&
    	(media1h3_y_t<=pix_y) && (pix_y<=media1h3_y_b);
    //horizontal2
    	localparam media2h3_left=509;
    	localparam media2h3_right=527;
    	localparam media2h3_y_t = 290; //ready
    	localparam media2h3_y_b = 291;
    	wire  media2h3_on;
    	assign media2h3_on = (media2h3_left<=pix_x) && (pix_x<=media2h3_right) &&
    	(media2h3_y_t<=pix_y) && (pix_y<=media2h3_y_b);


//----------------cuarta

      	localparam fecha1v_left=530;
      	localparam fecha1v_right=531;
      	localparam fecha1v_y_t = 279;
      	localparam fecha1v_y_b = 291;
      	wire  fecha1v_on;
      	assign fecha1v_on = (fecha1v_left<=pix_x) && (pix_x<=fecha1v_right) &&
      	(fecha1v_y_t<=pix_y) && (pix_y<=fecha1v_y_b);
      //vertial2

      	localparam fecha2v_left=549;
      	localparam fecha2v_right=550;
      	localparam fecha2v_y_t = 279; //listo
      	localparam fecha2v_y_b = 291;
      	wire  fecha2v_on;
      	assign fecha2v_on = (fecha2v_left<=pix_x) && (pix_x<=fecha2v_right) &&
      	(fecha2v_y_t<=pix_y) && (pix_y<=fecha2v_y_b);
      //horizontal1
      	localparam fecha1h_left=531;
      	localparam fecha1h_right=549;
      	localparam fecha1h_y_t = 279; //listo
      	localparam fecha1h_y_b = 280;
      	wire  fecha1h_on;
      	assign fecha1h_on = (fecha1h_left<=pix_x) && (pix_x<=fecha1h_right) &&
      	(fecha1h_y_t<=pix_y) && (pix_y<=fecha1h_y_b);
      //horizontal2
      	localparam fecha2h_left=531;
      	localparam fecha2h_right=549;
      	localparam fecha2h_y_t = 290; //ok
      	localparam fecha2h_y_b = 291;
      	wire  fecha2h_on;
      	assign fecha2h_on = (fecha2h_left<=pix_x) && (pix_x<=fecha2h_right) &&
      	(fecha2h_y_t<=pix_y) && (pix_y<=fecha2h_y_b);

      //segunda caja en la fecha

      //vertical1

      	localparam fecha1v2_left=552;
      	localparam fecha1v2_right=553;
      	localparam fecha1v2_y_t = 279;  //listo
      	localparam fecha1v2_y_b = 291;
      	wire  fecha1v2_on;
      	assign fecha1v2_on = (fecha1v2_left<=pix_x) && (pix_x<=fecha1v2_right) &&
      	(fecha1v2_y_t<=pix_y) && (pix_y<=fecha1v2_y_b);
      //vertial2

      	localparam fecha2v2_left=571;
      	localparam fecha2v2_right=572;
      	localparam fecha2v2_y_t = 279;
      	localparam fecha2v2_y_b = 291;
      	wire  fecha2v2_on;
      	assign fecha2v2_on = (fecha2v2_left<=pix_x) && (pix_x<=fecha2v2_right) &&
      	(fecha2v2_y_t<=pix_y) && (pix_y<=fecha2v2_y_b);
      //horizontal1
      	localparam fecha1h2_left=553;
      	localparam fecha1h2_right=571;
      	localparam fecha1h2_y_t = 279;//ok
      	localparam fecha1h2_y_b = 280;
      	wire  fecha1h2_on;
      	assign fecha1h2_on = (fecha1h2_left<=pix_x) && (pix_x<=fecha1h2_right) &&
      	(fecha1h2_y_t<=pix_y) && (pix_y<=fecha1h2_y_b);
      //horizontal2
      	localparam fecha2h2_left=553;
      	localparam fecha2h2_right=571;
      	localparam fecha2h2_y_t = 290;//ok
      	localparam fecha2h2_y_b = 291;
      	wire  fecha2h2_on;
      	assign fecha2h2_on = (fecha2h2_left<=pix_x) && (pix_x<=fecha2h2_right) &&
      	(fecha2h2_y_t<=pix_y) && (pix_y<=fecha2h2_y_b);





//--------------------------------------------------------------------------------
//    simulacion de luces parametros y asgnaciones a coordenadas de activacion
//--------------------------------------------------------------------------------
localparam inity=280;
localparam endy=290;

localparam beginlight1X=465;
localparam beginlight2X=487;
localparam beginlight3X=509;
localparam beginlight4X=531;
localparam beginlight5X=553;


localparam endlight1X=483;
localparam endlight2X=505;
localparam endlight3X=527;
localparam endlight4X=549;
localparam endlight5X=571;

    wire light1,light2,light3,light4,light;

    assign light1=(beginlight1X<=pix_x) && (pix_x<=endlight1X) &&(inity<=pix_y) && (pix_y<=endy);
    assign light2=(beginlight2X<=pix_x) && (pix_x<=endlight2X) &&(inity<=pix_y) && (pix_y<=endy);
    assign light3=(beginlight3X<=pix_x) && (pix_x<=endlight3X) &&(inity<=pix_y) && (pix_y<=endy);
    assign light4=(beginlight4X<=pix_x) && (pix_x<=endlight4X) &&(inity<=pix_y) && (pix_y<=endy);
    assign light5=(beginlight5X<=pix_x) && (pix_x<=endlight5X) &&(inity<=pix_y) && (pix_y<=endy);

//----------------------------------------------------------------
//										inicio de animacion, cuerpo
//----------------------------------------------------------------
reg [7:0] count1reg;
reg [7:0] count2reg;
reg [2:0] count2regaux;
reg [2:0] count2regaux2;

reg [4:0] fast1;
reg [1:0] fast2;

//----------------------------------------------------------------
//										cuenta lenta
//----------------------------------------------------------------
always @(posedge clk)begin
    if(reset) begin
          count1reg<=0;
			 fast1<=0;
    end
    else if((pix_y==0) && (pix_x==0)) begin
          count1reg<=count1reg+1;
			 fast1<=fast1+1;
			 end

	 else begin
			 count1reg<=count1reg;
			 fast1<=fast1;
    end
end

//----------------------------------------------------------------
//									cuenta por segundo
//----------------------------------------------------------------

always @(posedge clk)begin
    if(reset) begin
      count2reg<=0;
			 count2regaux<=0;
			 count2regaux2<=0;
			 fast2<=0;
          end
    else if(count1reg==255) begin
			 count2regaux<=count2regaux+1;
			 count2regaux2<=count2regaux2+1;
			 end
	 else if(count2regaux==5)begin
			 count2regaux<=0;
			 count2reg<=count2reg+1;
			 end
	else if(fast1==31)begin  //cuenta a un 1/5 de s
			 fast2<=fast2+1;
			 end
//	else if(count2regaux==5)begin  //cuenta a un 1/5 de s
	//		 fast2<=0;
		//	 end
	 else begin
			 count2reg<=count2reg;
			 count2regaux<=count2regaux;
			 fast2<=fast2;
		 end
end


//----------------------------------------------------------------
//		maquina de estados generadora de la secuencia de luces
//----------------------------------------------------------------


reg  [7:0] rgb1;
reg  [7:0] rgb2;
reg  [7:0] rgb3;
reg  [7:0] rgb4;
reg  [7:0] rgb5;


parameter s0=0,s1=1,s2=2,s3=3,s4=4;
reg [1:0] state;

always @(posedge clk) begin
	if(reset)begin
		  rgb1<=0;
		  rgb2<=0;
		  rgb3<=0;
		  rgb4<=0;
		  rgb5<=0;
	end
	else begin
			if(count2regaux==0) begin
					  rgb1 <= {1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};
						rgb2 <=0;
						rgb3 <=0;
						rgb4 <=0;
						rgb5 <=0;
			end
			else if(count2regaux==1) begin
					   rgb1 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb2 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb3 <=0;
						rgb4 <=0;
						rgb5 <=0;
			end
			else if(count2regaux==2) begin
					   rgb1 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb2 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb3 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb4 <=0;
						rgb5 <=0;
			end
			else if(count2regaux==3) begin
					   rgb1 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb2 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb3 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb4 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb5 <=0;
			end
			else if(count2regaux==4) begin
					   rgb1 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb2 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb3 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb4 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
						rgb5 <={1'b0,1'b0,1'b0,1'b0,count2reg[7:4],count2reg[3:0]};;
			end

			else begin
						rgb1 <=count2regaux;
						rgb2 <=count2regaux;
						rgb3 <=count2regaux;
						rgb4 <=count2regaux;
						rgb5 <=count2regaux;
			end
		end
end

//----------------------------------------------------------------
//										salida cajitas
//----------------------------------------------------------------
reg [11:0]  rgbnumero;

always@(posedge clk)
			if(reset)
					rgbnumero<=12'h00;
			else begin
						case(video_on)
						0: begin
								rgbnumero<=12'h00;
								end

						1: begin
									if(light1)
										rgbnumero<=rgb1;
									else if(light2 )
										rgbnumero<=rgb2;
									else if(light3 )
										rgbnumero<=rgb3;
								   else if(light4 )
										rgbnumero<=rgb4;
                    else if(light5 )
                     rgbnumero<=rgb5;
                    else if (media1v_on | media2v_on | media1h_on | media2h_on |media1v2_on | media2v2_on|media1h2_on |media2h2_on |media1v3_on | media2v3_on|media1h3_on |media2h3_on)
                      rgbnumero<=12'hfff;
                    else if(fecha1v_on | fecha2v_on | fecha1h_on | fecha2h_on |fecha1v2_on | fecha2v2_on | fecha1h2_on | fecha2h2_on)
                      rgbnumero<=12'hfff;
                    else
										rgbnumero<=12'h000;
						   end

						default:rgbnumero<=12'h000;
						endcase
end


assign rgbtext=rgbnumero;

endmodule
