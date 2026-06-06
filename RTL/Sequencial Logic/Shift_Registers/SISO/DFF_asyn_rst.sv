`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 03.09.2024 11:47:47
// Design Name: 
// Module Name: DFF_asyn_rst
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
// 
//////////////////////////////////////////////////////////////////////////////////


module DFF_asyn_rst(clk,asyn_rst,d,q);
    input logic clk,asyn_rst,d;
    output logic q;
    always@ (posedge clk, posedge asyn_rst) begin
        if(asyn_rst==1)
            q<=0;
        else
            q<=d;
     end
endmodule
