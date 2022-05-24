`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		Lab de Sistemas Digitales Grupo 4
// Engineer: 		Danny Mejias, Joao Salas, Javier Cordero
// 
// Create Date:    14:51:14 10/17/2016 
// Design Name: 	 Controlador_RTC_PB 
// Module Name:    Controlador_RTC_PB 
// Project Name: 	 Controlador_RTC_PB 
// Target Devices: Nexys 4
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
module Controlador_RTC_PB(
    input clock, reset, IRQ,
	 //input BTNPi,BTNUi,BTNDi,BTNRi,BTNLi,BTNFi,BTNTi,ringoff,
	 input ps2d,ps2c,rx_en,
	 inout  [7:0] AddressData,
	 output hsync,vsync,
	 output AD,CS,RD,WR,
	 output [11:0] rgb,
	 output speaker
	 /*
	 output [7:0] out_port,
	 output [7:0] port_id,
	 output write_strobe, k_write_strobe,

	 output reg [7:0] anno_vga_port,
	 output reg [7:0] mes_vga_port,
	 output reg [7:0] dia_vga_port,
	 output reg [7:0] rhora_vga_port,
	 output reg [7:0] rmin_vga_port,
	 output reg [7:0] rseg_vga_port,
	 output reg [7:0] thora_vga_port,
	 output reg [7:0] tmin_vga_port,
	 output reg [7:0] tseg_vga_port,
	 output reg [7:0] addressin_rtc_port,
	 output reg [7:0] datain_rtc_port,
	 output reg [7:0] win_port,
	 output reg [7:0] rin_port,
	 output reg [7:0] control_port,
	 output reg [7:0] programando_port,
	 output reg [7:0] donew_port,
	 output reg [7:0] doner_port
	 */
    );
wire	[11:0]	address;
wire	[17:0]	instruction;
wire			bram_enable;
wire	[7:0]		port_id;
wire	[7:0]		out_port;
reg	[7:0]		in_port;
wire			write_strobe;
wire			k_write_strobe;
wire			read_strobe;
wire			interrupt;            
wire			interrupt_ack;
wire			kcpsm6_sleep;         
wire			kcpsm6_reset;         

wire			cpu_reset;
wire			rdl;
wire			int_request;


kcpsm6 #(
	.interrupt_vector	(12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		(8'h00))
  processor (
	.address 		(address),
	.instruction 	(instruction),
	.bram_enable 	(bram_enable),
	.port_id 		(port_id),
	.write_strobe 	(write_strobe),
	.k_write_strobe 	(k_write_strobe),
	.out_port 		(out_port),
	.read_strobe 	(read_strobe),
	.in_port 		(in_port),
	.interrupt 		(interrupt),
	.interrupt_ack 	(interrupt_ack),
	.reset 		(kcpsm6_reset),
	.sleep		(kcpsm6_sleep),
	.clk 			(clock)); 
	
assign kcpsm6_sleep = 1'b0;
assign interrupt = 1'b0;



Control_RTC_PB_rom #(
	.C_FAMILY		   ("7S"),   	//Family 'S6' or 'V6'
	.C_RAM_SIZE_KWORDS	(2),  	//Program size '1', '2' or '4'
	.C_JTAG_LOADER_ENABLE	(0))  	//Include JTAG Loader when set to '1' 
  ROM (    				//Name to match your PSM file
 	.rdl 			(kcpsm6_reset),
	.enable 		(bram_enable),
	.address 		(address),
	.instruction 	(instruction),
	.clk 			(clock));

////////////////////////// PUERTOS DE ENTRADA ////////////////////////////////////////

reg [7:0] datao_rtc_port;
reg [7:0] donew_port;//
reg [7:0] doner_port;//
reg [7:0] annow_port, mesw_port, diaw_port, rhoraw_port, rminw_port, rsegw_port, thoraw_port, tminw_port, tsegw_port, rthoraw_port, rtminw_port, rtsegw_port;
reg [7:0] pfh_port, pt_port, pok_port;


always @ (posedge clock)
  begin
      case (port_id) 
        8'h0b : in_port <= datao_rtc_port;
		  8'h10 : in_port <= annow_port;
		  8'h11 : in_port <= mesw_port;
		  8'h12 : in_port <= diaw_port;
		  8'h13 : in_port <= rhoraw_port;
		  8'h14 : in_port <= rminw_port;
		  8'h15 : in_port <= rsegw_port;
		  8'h16 : in_port <= thoraw_port;
		  8'h17 : in_port <= tminw_port;
		  8'h18 : in_port <= tsegw_port;
		  8'h19 : in_port <= rthoraw_port;
		  8'h1a : in_port <= rtminw_port;
		  8'h1b : in_port <= rtsegw_port;
		  8'h20 : in_port <= pfh_port;
		  8'h21 : in_port <= pt_port;
		  8'h22 : in_port <= pok_port;
		  8'h23 : in_port <= donew_port;
		  8'h24 : in_port <= doner_port;
		  
        // To ensure minimum logic implementation when defining a multiplexer always
        // use don't care for any of the unused cases.

        default : in_port <= 8'bXXXXXXXX ;  
      endcase
  end

////////////////////////// PUERTOS DE SALIDA ////////////////////////////////////////

reg [7:0] anno_vga_port;
reg [7:0] mes_vga_port;
reg [7:0] dia_vga_port;
reg [7:0] rhora_vga_port;
reg [7:0] rmin_vga_port;
reg [7:0] rseg_vga_port;
reg [7:0] thora_vga_port;
reg [7:0] tmin_vga_port;
reg [7:0] tseg_vga_port;
reg [7:0] addressin_rtc_port;
reg [7:0] datain_rtc_port;
reg [7:0] win_port;
reg [7:0] rin_port;
reg [7:0] control_port;
reg [7:0] programando_port;

always @ (posedge clock)
  begin
      // 'write_strobe' is used to qualify all writes to general output ports.
      if (write_strobe == 1'b1) begin
		
        if (port_id == 8'h00) begin
          anno_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h01) begin
          mes_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h02) begin
          dia_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h03) begin
          rhora_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h04) begin
          rmin_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h05) begin
          rseg_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h06) begin
          thora_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h07) begin
          tmin_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h08) begin
          tseg_vga_port <= out_port;
        end
		  
		  if (port_id == 8'h09) begin
          addressin_rtc_port <= out_port;
        end
		  
		  if (port_id == 8'h0a) begin
          datain_rtc_port <= out_port;
        end
		  
		  if (port_id == 8'h0e) begin
          win_port <= out_port;
        end
		  
		  if (port_id == 8'h0f) begin
          rin_port <= out_port;
        end
		  
		  if (port_id == 8'h0c) begin
          control_port <= out_port;
        end
		  
		  if (port_id == 8'h0d) begin
          programando_port <= out_port;
        end 
		  
      end
  end
  
/*
always @ (posedge clock)
  begin
      // 'k_write_strobe' is used to qualify all writes to general output ports.
      if (k_write_strobe == 1'b1) begin  
		
			if (port_id == 8'h0e) begin
          win_port <= out_port;
        end
		  
		  if (port_id == 8'h0f) begin
          rin_port <= out_port;
        end
		  
		  if (port_id == 8'h0c) begin
          control_port <= out_port;
        end
		  
		  if (port_id == 8'h0d) begin
          programando_port <= out_port;
        end
		 end
  end


always @ (posedge clk)
  begin
      if (interrupt_ack == 1'b1) begin
         interrupt <= 1'b0;
      end
      else if (int_request == 1'b1) begin
          interrupt <= 1'b1;
      end
      else begin
          interrupt <= interrupt;
      end
  end  */
  
//////////////////////////////////////////////////////////////////////////////

//Debouncer Antirebote(clock,BTNPi,BTNUi,BTNDi,BTNRi,BTNLi,reset,BTNPd,BTNUd,BTNDd,BTNRd,BTNLd);


topkey Teclado(clock,reset,ps2d,ps2c,rx_en, BTNFi,BTNTi,ringoff,BTNPd,BTNUd,BTNDd,BTNLd,BTNRd);

diezns BTNPa(clock,reset,BTNPd,BTNP);
diezns BTNUa(clock,reset,BTNUd,BTNU);
diezns BTNDa(clock,reset,BTNDd,BTND);
diezns BTNRa(clock,reset,BTNRd,BTNR);
diezns BTNLa(clock,reset,BTNLd,BTNL);
diezns BTNFa(clock,reset,BTNFi,BTNFs);
diezns BTNTa(clock,reset,BTNTi,BTNTs);

reg BTNF, BTNT, OK;

always @(posedge clock, posedge reset)
  if (reset)
    BTNF <= 1'b0;
  else
	 case (BTNF)
		1'b0:	if (BTNFs)
					BTNF <= 1'b1;
				else
					BTNF <= BTNF;
		1'b1:	if (control_port[0])
					BTNF <= 1'b0;
				else
					BTNF <= BTNF;
		default: BTNF <= BTNF;
	 endcase

always @(posedge clock, posedge reset)
  if (reset)
    BTNT <= 1'b0;
  else
	 case (BTNT)
		1'b0:	if (BTNTs)
					BTNT <= 1'b1;
				else
					BTNT <= BTNT;
		1'b1:	if (control_port[0])
					BTNT <= 1'b0;
				else
					BTNT <= BTNT;
		default: BTNT <= BTNT;
	 endcase
	 
always @(posedge clock, posedge reset)
  if (reset)
    OK <= 1'b0;
  else
	 case (OK)
		1'b0:	if (BTNP)
					OK <= 1'b1;
				else
					OK <= OK;
		1'b1:	if (control_port[0])
					OK <= OK;
				else
					OK <= 1'b0;
		default: OK <= OK;
	 endcase

always @(posedge clock)
	if (BTNF)
		pfh_port = 8'h1;
	else
		pfh_port = 8'h0;
		
always @(posedge clock)
	if (BTNT)
		pt_port = 8'h1;
	else
		pt_port = 8'h0;
		
always @(posedge clock)
	if (OK)
		pok_port = 8'h1;
	else
		pok_port = 8'h0;
		



wire TS, selecAD;
wire [9:0] pixX,pixY;
wire [7:0] diaw, mesw, annow, rhoraw, rminw, rsegw, thoraw, tminw, tsegw, outAD;
wire [3:0] ustate, dir;
wire [2:0] rstate, wstate;


ReadCycle Lectura(clock, reset, rin_port[0], readselec, doner, rstate, rAD, rCS, rRD, rWR, rTS, reg_enable) ;
WriteCycle Escritura(clock, reset, win_port[0], writeselec, donew, wstate, wAD, wCS, wRD, wWR, wTS) ; 

ControlUsuario Usuario(clock, reset, BTNP, BTNR, BTNL, BTNU, BTND, BTNF, BTNT, ustate, dir, diaw, mesw, annow, rhoraw, rminw, rsegw, thoraw, tminw, tsegw) ; 


assign AD = control_port[0] ? wAD : rAD;
assign CS = control_port[0] ? wCS : rCS;
assign RD = control_port[0] ? wRD : rRD;
assign WR = control_port[0] ? wWR : rWR;
assign TS = control_port[0] ? wTS : rTS;
assign selecAD = control_port[0] ? writeselec : readselec;


assign outAD = selecAD ? datain_rtc_port : addressin_rtc_port;
assign AddressData = TS ? 8'hzz : outAD;


//Registro Leido del RTC
always @(posedge clock, posedge reset)
	if (reset)
		datao_rtc_port = 8'h00;
	else
		if (reg_enable)
			datao_rtc_port = AddressData;
		else
			datao_rtc_port = datao_rtc_port;

//Registro donew
always @(posedge clock, posedge reset)
	if (reset) 
		donew_port = 8'h00;
	else
		case (donew_port)
		8'h00: if (donew)
					donew_port = 8'h01;
				 else
					donew_port = donew_port;
		8'h01: if (win_port[0])
					donew_port = 8'h00;
				 else
					donew_port = donew_port;
		default: donew_port = donew_port;
		endcase

//Registro doner		
always @(posedge clock, posedge reset)
	if (reset) 
		doner_port = 8'h00;
	else
		case (doner_port)
		8'h00: if (doner)
					doner_port = 8'h01;
				 else
					doner_port = doner_port;
		8'h01: if (rin_port[0])
					doner_port = 8'h00;
				 else
					doner_port = doner_port;
		default: doner_port = doner_port;
		endcase
		
//Registro de Data Usuario
always @(posedge clock)
	begin
		annow_port <= annow;
		mesw_port <= mesw;
		diaw_port <= diaw;
		rhoraw_port <= rhoraw;
		rminw_port <= rminw;
		rsegw_port <= rsegw;
		thoraw_port <= thoraw;
		tminw_port <= tminw;
		tsegw_port <= tsegw;
		
		begin
							if ((tminw == 8'b0) & (tsegw == 8'b0))
								if (thoraw == 8'b0)
									rthoraw_port = thoraw;
								else
									if ((thoraw[3:0] == 4'h3)|(thoraw[3:0] == 4'h2)|(thoraw[3:0] == 4'h1)|(thoraw[3:0] == 4'h0))
										rthoraw_port = 8'h24 - thoraw;
									else
										rthoraw_port = 8'h1e - thoraw;
							else
								if ((thoraw[3:0] == 4'h3)|(thoraw[3:0] == 4'h2)|(thoraw[3:0] == 4'h1)|(thoraw[3:0] == 4'h0))
									rthoraw_port = 8'h23 - thoraw;
								else
									rthoraw_port = 8'h1d - thoraw;
							end
		
		begin
							if (tsegw == 8'b0)
								if (tminw == 8'b0)
									rtminw_port = tminw;
								else
									if (tminw[3:0] == 4'h0)
										rtminw_port = 8'h60 - tminw;
									else
										rtminw_port = 8'h5a - tminw;
							else
								rtminw_port = 8'h59 - tminw;
							end
							
		begin
                if (tsegw == 8'h0)
                  rtsegw_port = tsegw;
                else
								  if (tsegw[3:0] == 4'h0)
										rtsegw_port = 8'h60 - tsegw;
									else
										rtsegw_port = 8'h5a - tsegw;
						 end
		
	end



// Registro de VGA

reg [7:0] rhora,rmin,rseg,dia,mes,anno,thora,tmin,tseg;

reg [7:0] rthoravga,
  		   rtminvga,
  			rtsegvga;

  always @(posedge clock, posedge reset) begin
  if (reset)
    {rthoravga,rtminvga,rtsegvga} = {8'h00,8'h00,8'h00};
  else begin
  //Resta de hora
  	if ((tmin_vga_port == 8'b0) & (tseg_vga_port == 8'b0)) begin
  		if (thora_vga_port == 8'b0)
  			rthoravga = thora_vga_port;
  		else begin
  			if ((thora_vga_port[3:0] == 4'h3)|(thora_vga_port[3:0] == 4'h2)|(thora_vga_port[3:0] == 4'h1)|(thora_vga_port[3:0] == 4'h0))
  				rthoravga = 8'h24 - thora_vga_port;
  			else
  				rthoravga = 8'h1e - thora_vga_port;
      end
    end
  	else begin
  		if ((thora_vga_port[3:0] == 4'h3)|(thora_vga_port[3:0] == 4'h2)|(thora_vga_port[3:0] == 4'h1)|(thora_vga_port[3:0] == 4'h0))
  			rthoravga = 8'h23 - thora_vga_port;
  		else
  			rthoravga = 8'h1d - thora_vga_port;
    end

  //Resta de minutos
  	if (tseg_vga_port == 8'b0) begin
  		if (tmin_vga_port == 8'b0)
  			rtminvga = tmin_vga_port;
  		else begin
  			if (tmin_vga_port[3:0] == 4'h0)
  				rtminvga = 8'h60 - tmin_vga_port;
  			else
  				rtminvga = 8'h5a - tmin_vga_port;
      end
    end
  	else
  		rtminvga = 8'h59 - tmin_vga_port;


  //Resta de segundos
  	if (tseg_vga_port == 8'h0)
  		rtsegvga = tseg_vga_port;
  	else begin
  		if (tseg_vga_port[3:0] == 4'h0)
  			rtsegvga = 8'h60 - tseg_vga_port;
  		else
  			rtsegvga = 8'h5a - tseg_vga_port;
    end
    end
  end


wire [7:0] mtseg,mtmin,mthora;
assign mtseg = IRQ ? rtsegvga:8'h00;
assign mtmin = IRQ ? rtminvga:8'h00;
assign mthora = IRQ ? rthoravga:8'h00;



always @(posedge clock)
	if ( (pixX==0)&& (pixY==0)) begin 
		{rhora,rmin,rseg,dia,mes,anno} = {rhora_vga_port,rmin_vga_port,rseg_vga_port,dia_vga_port,mes_vga_port,anno_vga_port};
		if (control_port)
			{thora,tmin,tseg} = {thora_vga_port,tmin_vga_port,tseg_vga_port};
		else
			{thora,tmin,tseg} = {mthora,mtmin,mtseg};
		end
	else
		{rhora,rmin,rseg,dia,mes,anno,thora,tmin,tseg} = {rhora,rmin,rseg,dia,mes,anno,thora,tmin,tseg};
		






////////////////////////////////////////////////////////////////////////////


reg FFalarma;
always @ (posedge clock, posedge reset)
	if (reset)
		FFalarma <= 1'b0;
	else begin
		FFalarma <= FFalarma;
		case (FFalarma)
			1'b0: if (IRQ)
						FFalarma <= 1'b1;
					else
						FFalarma <= 1'b0;
			1'b1: if ((~IRQ && ringoff)|programando_port[0])
						FFalarma <= 1'b0;
					else
						FFalarma <= 1'b1;
			default: FFalarma <= 1'b1;
		endcase
	end

and(alarma,FFalarma,~IRQ);



VGATOP Display(clock,reset,ps2d,ps2c,rx_en,alarma,hsync,vsync,rgb,pixX,pixY,rhora,rmin,rseg,dia,mes,anno,thora,tmin,tseg,programando_port[0],dir);

music Melodia(alarma,clock,speaker);

endmodule
