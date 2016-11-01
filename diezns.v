`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:51:58 09/24/2016
// Design Name:
// Module Name:    diezns
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
module diezns(
		input clock,
		input reset,
		input BTNd,
		output BTN

      );

FFD DF1(BTNd,clock,reset,BTN1);
not(BTN1n,BTN1);
FFD DF2(BTN1n,clock,reset,BTN2);
and(BTN,BTN1,BTN2,~reset);


endmodule

module FFD (
data   , // Data Input
clk    , // Clock Input
reset  , // Reset input
q        // Q output
);
//-----------Input Ports---------------
input data, clk, reset ;

//-----------Output Ports---------------
output q;

//------------Internal Variables--------
reg q;

//-------------Code Starts Here---------
always @ ( posedge clk)
if (reset) begin
  q <= 1'b0;
end  else begin
  q <= data;
end

endmodule //End Of Module dff_sync_reset
