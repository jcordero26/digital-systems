`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:14 10/17/2016 
// Design Name: 
// Module Name:    Controlador_RTC_PB 
// Project Name: 
// Target Devices: 
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
    input clock, /*reset, IRQ,
	 inout  [7:0] AddressData,
	 output hsync,vsync,
	 output AD,CS,RD,WR,
	 output [11:0] rgb,*/
	 
	 input [7:0] datao_rtc_port,
	 input [7:0] donew_port,
	 input [7:0] doner_port,
	 input [7:0] annow_port, mesw_port, diaw_port, rhoraw_port, rminw_port, rsegw_port, thoraw_port, tminw_port, tsegw_port,
	 input [7:0] pfh_port, pt_port, pok_port,
	 
	 output [7:0] out_port,
	 output [7:0] port_id,
	 output write_strobe
    );
wire	[11:0]	address;
wire	[17:0]	instruction;
wire			bram_enable;
//wire	[7:0]		port_id;
//wire	[7:0]		out_port;
reg	[7:0]		in_port;
//wire			write_strobe;
wire			k_write_strobe;
wire			read_strobe;
wire			interrupt;            //See note above
wire			interrupt_ack;
wire			kcpsm6_sleep;         //See note above
wire			kcpsm6_reset;         //See note above

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

always @ (posedge clock)
  begin
      case (port_id) 
        8'h0b : in_port <= datao_rtc_port;
		  8'h0c : in_port <= donew_port;
		  8'h0d : in_port <= doner_port;
		  8'h10 : in_port <= annow_port;
		  8'h11 : in_port <= mesw_port;
		  8'h12 : in_port <= diaw_port;
		  8'h13 : in_port <= rhoraw_port;
		  8'h14 : in_port <= rminw_port;
		  8'h15 : in_port <= rsegw_port;
		  8'h16 : in_port <= thoraw_port;
		  8'h17 : in_port <= tminw_port;
		  8'h18 : in_port <= tsegw_port;
		  8'h20 : in_port <= pfh_port;
		  8'h21 : in_port <= pt_port;
		  8'h22 : in_port <= pok_port;
		  
        // To ensure minimum logic implementation when defining a multiplexer always
        // use don't care for any of the unused cases.

        default : in_port <= 8'bXXXXXXXX ;  
      endcase
  end

////////////////////////// PUERTOS DE SALIDA ////////////////////////////////////////
/*
always @ (posedge clock)
  begin

      // 'write_strobe' is used to qualify all writes to general output ports.
      if (write_strobe == 1'b1) begin

        // Write to output_port_w at port address 01 hex
        if (port_id[1:0] == 2'b10) begin
          LED_port <= out_port;
        end

        // Write to output_port_x at port address 02 hex
        if (port_id[1] == 1'b1) begin
          output_port_x <= out_port;
        end

        // Write to output_port_y at port address 04 hex
        if (port_id[2] == 1'b1) begin
          output_port_y <= out_port;
        end

        // Write to output_port_z at port address 08 hex
        if (port_id[3] == 1'b1) begin
          output_port_z <= out_port;
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
  

//ReadCycle Lectura(clock, reset, rin, readselec, doner, rstate, rAD, rCS, rRD, rWR, rTS, reg_enable) ;
//WriteCycle Escritura(clock, reset, win, writeselec, donew, wstate, wAD, wCS, wRD, wWR, wTS) ; 

//ControlUsuario Usuario(clock, reset, BTNP, BTNR, BTNL, BTNU, BTND, switchp, mstate, ustate, dir, diaw, mesw, annow, rhoraw, rminw, rsegw, thoraw, tminw, tsegw) ; 
















endmodule
