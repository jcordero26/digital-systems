`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:50 10/21/2016 
// Design Name: 
// Module Name:    Testbench_Overall 
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
module Testbench_Overall;

	 reg clock_tb;
	 reg [7:0] datao_rtc_port_tb, donew_port_tb, doner_port_tb;
	 reg [7:0] annow_port_tb, mesw_port_tb, diaw_port_tb, rhoraw_port_tb, rminw_port_tb, rsegw_port_tb, thoraw_port_tb, tminw_port_tb, tsegw_port_tb;
	 reg [7:0] pfh_port_tb, pt_port_tb, pok_port_tb;
	 
	 wire [7:0] out_port_tb;
	 wire write_strobe_tb;
	 wire	[7:0]	port_id_tb;

	Controlador_RTC_PB dut(
	.clock (clock_tb),
	.datao_rtc_port(datao_rtc_port_tb), 
	.donew_port(donew_port_tb), 
	.doner_port(doner_port_tb),
	.annow_port(annow_port_tb), 
	.mesw_port(mesw_port_tb), 
	.diaw_port(diaw_port_tb), 
	.rhoraw_port(rhoraw_port_tb), 
	.rminw_port(rminw_port_tb), 
	.rsegw_port(rsegw_port_tb), 
	.thoraw_port(thoraw_port_tb), 
	.tminw_port(tminw_port_tb), 
	.tsegw_port(tsegw_port_tb),
	.pfh_port(pfh_port_tb), 
	.pt_port(pt_port_tb), 
	.pok_port(pok_port_tb),
	.out_port(out_port_tb),
	.write_strobe (write_strobe_tb),
	.port_id(port_id_tb)
	);
	
initial
	begin
		clock_tb = 0;
	forever
		begin
		 #5 clock_tb = ~clock_tb; 
		end //Se establece el clock
	end
	
	initial
		begin
			datao_rtc_port_tb = 0; 
			donew_port_tb = 0; 
			doner_port_tb = 0; 
			annow_port_tb = 0;  
			mesw_port_tb = 0; 
			diaw_port_tb = 0; 
			rhoraw_port_tb = 0; 
			rminw_port_tb = 0;  
			rsegw_port_tb = 0; 
			thoraw_port_tb = 0;  
			tminw_port_tb = 0; 
			tsegw_port_tb = 0; 
			pfh_port_tb = 0;  
			pt_port_tb = 0; 
			pok_port_tb = 0; 
			
			#310
			donew_port_tb = 8'h01;
			
			
			#50
			donew_port_tb = 8'h00;
	
			/*
			#2000
			Switches_tb = 8'hff;
			
			#200
			Switches_tb[0] = 0;
			
			#400
			Switches_tb[2] = 0;
			*/
			#2000
			$stop;
		end
	




endmodule
