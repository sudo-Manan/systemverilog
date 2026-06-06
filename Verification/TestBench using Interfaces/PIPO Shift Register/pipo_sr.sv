`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 12:08:16
// Design Name: 
// Module Name: pipo_sr
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

interface sr_inf;
    logic clk;
    logic rst;
    logic [3:0] d_in;
    logic [3:0] q_out;
endinterface

module pipo_sr(clk,rst,d,q);
    input clk, rst;
    input [3:0] d;
    output logic [3:0] q;
    
    always @(posedge clk or posedge rst) begin
        if(rst==1)
            q<=4'b0000;
        else if(clk==1)
            q<=d;
    end
endmodule
