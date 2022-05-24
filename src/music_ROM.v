`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:19 10/31/2016 
// Design Name: 
// Module Name:    music_ROM 
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
module music_ROM(
	input clk,
	input [7:0] address,
	output reg [7:0] noteout
);

reg [7:0] note;

always @(posedge clk)
case(address)
	  0: note<= 8'd28;
	  1: note<= 8'd32;
	  2: note<= 8'd25;
	  3: note<= 8'd27;
	  4: note<= 8'd31;
	  5: note<= 8'd25;
	  6: note<= 8'd26;
	  7: note<= 8'd30;
	  8: note<= 8'd25;
	  9: note<= 8'd27;
	 10: note<= 8'd31;
	 11: note<= 8'd25;
	 
	 12: note<= 8'd28;
	 13: note<= 8'd32;
	 14: note<= 8'd25;
	 15: note<= 8'd29;
	 16: note<= 8'd34;
	 17: note<= 8'd25;
	 18: note<= 8'd28;
	 19: note<= 8'd32;
	 20: note<= 8'd25;
	 21: note<= 8'd27;
	 22: note<= 8'd31;
	 23: note<= 8'd25;
	 
	 24: note<= 8'd28;
	 25: note<= 8'd32;
	 26: note<= 8'd25;
	 27: note<= 8'd27;
	 28: note<= 8'd31;
	 29: note<= 8'd25;
	 30: note<= 8'd26;
	 31: note<= 8'd30;
	 32: note<= 8'd25;
	 33: note<= 8'd27;
	 34: note<= 8'd31;
	 35: note<= 8'd25;
	 
	 36: note<= 8'd28;
	 37: note<= 8'd32;
	 38: note<= 8'd25;
	 39: note<= 8'd29;
	 40: note<= 8'd34;
	 41: note<= 8'd25;
	 42: note<= 8'd28;
	 43: note<= 8'd32;
	 44: note<= 8'd25;
	 45: note<= 8'd27;
	 46: note<= 8'd31;
	 47: note<= 8'd25;
	 ////////////////////////////
	 48: note<= 8'd27;
	 49: note<= 8'd31;
	 50: note<= 8'd24;
	 51: note<= 8'd26;
	 52: note<= 8'd30;
	 53: note<= 8'd24;
	 54: note<= 8'd27;
	 55: note<= 8'd31;
	 56: note<= 8'd24;
	 57: note<= 8'd28;
	 58: note<= 8'd32;
	 59: note<= 8'd24;
	 
	 60: note<= 8'd27;
	 61: note<= 8'd31;
	 62: note<= 8'd24;
	 63: note<= 8'd28;
	 64: note<= 8'd32;
	 65: note<= 8'd24;
	 66: note<= 8'd27;
	 67: note<= 8'd31;
	 68: note<= 8'd24;
	 69: note<= 8'd26;
	 70: note<= 8'd30;
	 71: note<= 8'd24;
	 
	 72: note<= 8'd27;
	 73: note<= 8'd31;
	 74: note<= 8'd24;
	 75: note<= 8'd26;
	 76: note<= 8'd30;
	 77: note<= 8'd24;
	 78: note<= 8'd27;
	 79: note<= 8'd31;
	 80: note<= 8'd24;
	 81: note<= 8'd28;
	 82: note<= 8'd32;
	 83: note<= 8'd24;
	 
	 84: note<= 8'd27;
	 85: note<= 8'd31;
	 86: note<= 8'd24;
	 87: note<= 8'd28;
	 88: note<= 8'd32;
	 89: note<= 8'd24;
	 90: note<= 8'd27;
	 91: note<= 8'd31;
	 92: note<= 8'd24;
	 93: note<= 8'd26;
	 94: note<= 8'd30;
	 95: note<= 8'd24;
	 ////////////////////////777
	 96: note<= 8'd31;
	 97: note<= 8'd35;
	 98: note<= 8'd28;
	 99: note<= 8'd32;
	100: note<= 8'd36;
	101: note<= 8'd28;
	102: note<= 8'd31;
	103: note<= 8'd35;
	104: note<= 8'd28;
	105: note<= 8'd30;
	106: note<= 8'd34;
	107: note<= 8'd28;
	
	108: note<= 8'd31;
	109: note<= 8'd35;
	110: note<= 8'd28;
	111: note<= 8'd30;
	112: note<= 8'd34;
	113: note<= 8'd28;
	114: note<= 8'd29;
	115: note<= 8'd33;
	116: note<= 8'd28;
	117: note<= 8'd30;
	118: note<= 8'd34;
	119: note<= 8'd28;
	
	120: note<= 8'd31;
	121: note<= 8'd35;
	122: note<= 8'd28;
	123: note<= 8'd32;
	124: note<= 8'd36;
	125: note<= 8'd28;
	126: note<= 8'd31;
	127: note<= 8'd35;
	128: note<= 8'd28;
	129: note<= 8'd30;
	130: note<= 8'd34;
	131: note<= 8'd28;
	
	132: note<= 8'd31;
	133: note<= 8'd35;
	134: note<= 8'd28;
	135: note<= 8'd30;
	136: note<= 8'd34;
	137: note<= 8'd28;
	138: note<= 8'd29;
	139: note<= 8'd33;
	140: note<= 8'd28;
	141: note<= 8'd30;
	142: note<= 8'd34;
	143: note<= 8'd28;
///////////////////////////
///////////////////////////
	144: note<= 8'd28;
	145: note<= 8'd32;
	146: note<= 8'd25;
	147: note<= 8'd27;
	148: note<= 8'd31;
	149: note<= 8'd25;
	150: note<= 8'd26;
	151: note<= 8'd30;
	152: note<= 8'd25;
	153: note<= 8'd27;
	154: note<= 8'd31;
	155: note<= 8'd25;
	
	156: note<= 8'd28;
	157: note<= 8'd32;
	158: note<= 8'd25;
	159: note<= 8'd29;
	160: note<= 8'd34;
	161: note<= 8'd25;
	162: note<= 8'd28;
	163: note<= 8'd32;
	164: note<= 8'd25;
	165: note<= 8'd27;
	166: note<= 8'd31;
	167: note<= 8'd25;
	 
	168: note<= 8'd28;
	169: note<= 8'd32;
	170: note<= 8'd25;
	171: note<= 8'd27;
	172: note<= 8'd31;
	173: note<= 8'd25;
	174: note<= 8'd26;
	175: note<= 8'd30;
	176: note<= 8'd25;
	177: note<= 8'd27;
	178: note<= 8'd31;
	179: note<= 8'd25;
	
	180: note<= 8'd28;
	181: note<= 8'd32;
	182: note<= 8'd25;
	183: note<= 8'd29;
	184: note<= 8'd34;
	185: note<= 8'd25;
	186: note<= 8'd28;
	187: note<= 8'd32;
	188: note<= 8'd25;
	189: note<= 8'd27;
	190: note<= 8'd31;
	191: note<= 8'd25;
	 ////////////////////////////
	192: note<= 8'd27;
	193: note<= 8'd31;
	194: note<= 8'd24;
	195: note<= 8'd26;
	196: note<= 8'd30;
	197: note<= 8'd24;
	198: note<= 8'd27;
	199: note<= 8'd31;
	200: note<= 8'd24;
	201: note<= 8'd28;
	202: note<= 8'd32;
	203: note<= 8'd24;
	 
	204: note<= 8'd27;
	205: note<= 8'd31;
	206: note<= 8'd24;
	207: note<= 8'd28;
	208: note<= 8'd32;
	209: note<= 8'd24;
	210: note<= 8'd27;
	211: note<= 8'd31;
	212: note<= 8'd24;
	213: note<= 8'd26;
	214: note<= 8'd30;
	215: note<= 8'd24;
	
	216: note<= 8'd27;
	217: note<= 8'd31;
	218: note<= 8'd24;
	219: note<= 8'd26;
	220: note<= 8'd30;
	221: note<= 8'd24;
	222: note<= 8'd27;
	223: note<= 8'd31;
	224: note<= 8'd24;
	225: note<= 8'd28;
	226: note<= 8'd32;
	227: note<= 8'd24;
	 
	228: note<= 8'd27;
	229: note<= 8'd31;
	230: note<= 8'd24;
	231: note<= 8'd28;
	232: note<= 8'd32;
	233: note<= 8'd24;
	234: note<= 8'd27;
	235: note<= 8'd31;
	236: note<= 8'd24;
	237: note<= 8'd26;
	238: note<= 8'd30;
	239: note<= 8'd24;
	 ////////////////////////777
	240: note<= 8'd31;
	241: note<= 8'd35;
	242: note<= 8'd28;
	243: note<= 8'd32;
	244: note<= 8'd36;
	245: note<= 8'd28;
	246: note<= 8'd31;
	247: note<= 8'd35;
	248: note<= 8'd28;
	249: note<= 8'd30;
	250: note<= 8'd34;
	251: note<= 8'd28;
	
	252: note<= 8'd31;
	253: note<= 8'd35;
	254: note<= 8'd28;
	255: note<= 8'd30;
	/*
	112: note<= 8'd34;
	113: note<= 8'd28;
	114: note<= 8'd29;
	115: note<= 8'd33;
	116: note<= 8'd28;
	117: note<= 8'd30;
	118: note<= 8'd34;
	119: note<= 8'd28;
	
	120: note<= 8'd31;
	121: note<= 8'd35;
	122: note<= 8'd28;
	123: note<= 8'd32;
	124: note<= 8'd36;
	125: note<= 8'd28;
	126: note<= 8'd31;
	127: note<= 8'd35;
	128: note<= 8'd28;
	129: note<= 8'd30;
	130: note<= 8'd34;
	131: note<= 8'd28;
	
	132: note<= 8'd31;
	133: note<= 8'd35;
	134: note<= 8'd28;
	135: note<= 8'd30;
	136: note<= 8'd34;
	137: note<= 8'd28;
	138: note<= 8'd29;
	139: note<= 8'd33;
	140: note<= 8'd28;
	141: note<= 8'd30;
	142: note<= 8'd34;
	143: note<= 8'd28;
	*/
///////////////////////////	
	default: note <= 8'd22;
endcase

always @(posedge clk)
	begin
		noteout <= note - 8'd22;
	end
	
endmodule

