`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 13.12.2024 19:07:41
// Design Name: 
// Module Name: temp1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// understanding wire types: wor (wire or), and wand (wire and)
//////////////////////////////////////////////////////////////////////////////////


module wor_wand(yo,ya,a,b,c,d);
 input a,b,c,d;
 output ya,yo;
 wor yo;
 wand ya;
 assign yo=a&b;
 assign yo=c|d;
 assign ya=a^b;
 assign ya=!c;
endmodule
