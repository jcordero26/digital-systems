`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:53:31 10/26/2016
// Design Name:   VGATOP
// Module Name:   /home/joao/Documents/Xilinx ISE/PICOBLAZE/VGA_blaze_nolatch/VGAPICOBLAZE/TEST.v
// Project Name:  VGAPICOBLAZE
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGATOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////



	module TEST;



	// Inputs
	reg activar_alarma;
	reg clk;
	reg reset;
	reg [7:0] timer_in1;
	reg [7:0] timer_in2;
	reg [7:0] timer_in3;
	reg [7:0] hour_in1;
	reg [7:0] hour_in2;
	reg [7:0] hour_in3;
	reg [7:0] fecha_in1;
	reg [7:0] fecha_in2;
	reg [7:0] fecha_in3;
	reg programar_on;
	reg [3:0] direccion_actual_pantalla;

	// Outputs
	wire hsync;
	wire vsync;
	wire video_on1;
	wire [11:0] rgb;
	wire [11:0] rgbIMAGE;
	wire [9:0] pixX;
	wire [9:0] pixY;

	// Instantiate the Unit Under Test (UUT)
	VGATOP uut (
	   .activar_alarma(activar_alarma),
		.clk(clk),
		.reset(reset),
		.hsync(hsync),
		.vsync(vsync),
		.video_on1(video_on1),
		.rgb(rgb),.rgbIMAGE(rgbIMAGE),
		.pixX(pixX),
		.pixY(pixY),
		.timer_in1(timer_in1),
		.timer_in2(timer_in2),
		.timer_in3(timer_in3),
		.hour_in1(hour_in1),
		.hour_in2(hour_in2),
		.hour_in3(hour_in3),
		.fecha_in1(fecha_in1),
		.fecha_in2(fecha_in2),
		.fecha_in3(fecha_in3),
		.programar_on(programar_on),
	   .direccion_actual_pantalla(direccion_actual_pantalla)
	);

	always #5 clk=~clk;
	integer i;
	integer j;


	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		timer_in1 = 0;
		timer_in2 = 0;
		timer_in3 = 0;
		hour_in1 = 0;
		hour_in2 = 0;
		hour_in3 = 0;
		fecha_in1 = 0;
		fecha_in2 = 0;
		fecha_in3 = 0;
		direccion_actual_pantalla=0;

		// Wait 100 ns for global reset to finish
		//PRIMERA PANTALLA
		#100
		reset=1;
		#10
		reset=0;
    #10
		reset = 1;

		//arranca la primer pantalla

		#50
		direccion_actual_pantalla=0;
		programar_on=0;
		activar_alarma=1;
		reset = 0;
		timer_in1 = 8'h00;
		timer_in2 = 8'h00;
		timer_in3 = 8'h00;
		hour_in1 = 8'h00;
		hour_in2 = 8'h00;
		hour_in3 = 8'h00;
		fecha_in1 = 8'h00;
		fecha_in2 = 8'h00;
		fecha_in3 = 8'h00;
		    //archivo txt para observar los bits, simulando una pantalla
		    i = $fopen("joaoVGA.txt","w");
		    for(j=0;j<383520;j=j+1) begin
		      #40
		      if(video_on1) begin
		        $fwrite(i,"%h",rgb);
		      end
		      else if(pixX==641)
		        $fwrite(i,"\n");
		    end


		    $fclose(i);
		    $stop;


		end




endmodule
