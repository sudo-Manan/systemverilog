`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 03.09.2024 12:32:16
// Design Name: 
// Module Name: tb_pipo_sr
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


module tb_pipo_sr;
    parameter n=4;
    logic clk=0, asyn_rst;
    logic [n-1:0] d;
    logic [n-1:0] q;
    
    pipo_sr #(n) dut_pipo(clk,asyn_rst,d,q);
    
    always begin
    #5 clk=~clk;
    end
    initial begin
    #10 asyn_rst=1'b1;
    
    #12 asyn_rst=1'b0; d=4'd1;
    #10 d=4'd10;
    #10 d=4'd2;
    #10 d=4'd0;
    #10 d=4'd7;
    #10 d=4'd9;
    #10 $finish;
    end
   //it works like sipo register 
endmodule
