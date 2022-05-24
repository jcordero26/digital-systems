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
	 reg reset_tb;
	 reg BTNPi_tb;
	 reg BTNUi_tb;
	 reg BTNDi_tb;
	 reg BTNRi_tb;
	 reg BTNLi_tb;
	 reg BTNFi_tb;
	 reg BTNTi_tb;
	
	 wire AD_tb;
	 wire CS_tb;
	 wire RD_tb;
	 wire WR_tb;
	 
	 wire [7:0] out_port_tb;
	 wire write_strobe_tb;
	 wire k_write_strobe_tb;
	 wire	[7:0]	port_id_tb;
	
	 wire [7:0] anno_vga_port_tb;
	 wire [7:0] mes_vga_port_tb;
	 wire [7:0] dia_vga_port_tb;
	 wire [7:0] rhora_vga_port_tb;
	 wire [7:0] rmin_vga_port_tb;
	 wire [7:0] rseg_vga_port_tb;
	 wire [7:0] thora_vga_port_tb;
	 wire [7:0] tmin_vga_port_tb;
	 wire [7:0] tseg_vga_port_tb;
	 wire [7:0] addressin_rtc_port_tb;
	 wire [7:0] datain_rtc_port_tb;
	 wire [7:0] win_port_tb;
	 wire [7:0] rin_port_tb;
	 wire [7:0] control_port_tb;
	 wire [7:0] programando_port_tb;
	 wire [7:0] donew_port_tb;
	 wire [7:0] doner_port_tb;

	Controlador_RTC_PB dut(
	.clock (clock_tb),
	.reset (reset_tb),
	.BTNPi (BTNPi_tb),
	.BTNRi (BTNRi_tb),
	.BTNLi (BTNLi_tb),
	.BTNUi (BTNUi_tb),
	.BTNDi (BTNDi_tb),
	.BTNFi (BTNFi_tb),
	.BTNTi (BTNTi_tb),
	.AD (AD_tb),
	.CS (CS_tb),
	.RD (RD_tb),
	.WR (WR_tb),
	.out_port(out_port_tb),
	.write_strobe (write_strobe_tb),
	.k_write_strobe(k_write_strobe_tb),
	.port_id(port_id_tb),
	.anno_vga_port(anno_vga_port_tb),
	.mes_vga_port(mes_vga_port_tb),
	.dia_vga_port(dia_vga_port_tb),
	.rhora_vga_port(rhora_vga_port_tb),
	.rmin_vga_port(rmin_vga_port_tb),
	.rseg_vga_port(rseg_vga_port_tb),
	.thora_vga_port(thora_vga_port_tb),
	.tmin_vga_port(tmin_vga_port_tb),
	.tseg_vga_port(tseg_vga_port_tb),
	.addressin_rtc_port(addressin_rtc_port_tb),
	.datain_rtc_port(datain_rtc_port_tb),
	.win_port(win_port_tb),
	.rin_port(rin_port_tb),
	.control_port(control_port_tb),
	.programando_port(programando_port_tb),
	.donew_port(donew_port_tb),
	.doner_port(doner_port_tb)
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
			reset_tb = 0;
			BTNPi_tb = 0;
	      BTNUi_tb = 0;
	      BTNDi_tb = 0;
	      BTNRi_tb = 0;
	      BTNLi_tb = 0;
	      BTNFi_tb = 0;
	      BTNTi_tb = 0;
			
		
			
			
			
			#5000
			$stop;
		end
	




endmodule
