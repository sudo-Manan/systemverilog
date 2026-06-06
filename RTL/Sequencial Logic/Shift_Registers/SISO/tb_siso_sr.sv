`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 03.09.2024 12:16:14
// Design Name: 
// Module Name: tb_siso_sr
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


module tb_siso_sr;
    parameter n=4;
    logic clk=0, asyn_rst, d;
    logic q;
    logic [n-1:0] q_parallel;
    
    siso_sr #(n) dut_siso(clk, asyn_rst, d, q, q_parallel);
    
    always begin
    #5 clk=~clk;
    end
    
    initial begin
        #10 asyn_rst=1'b1;
        #12 asyn_rst=1'b0; d=1'b1;
        #10 d=1'b1;
        #10 d=1'b0;
        #10 d=1'b0;
        #10 d=1'b1;
        #10 d=1'b0;
        #10 d=1'b1;
        #10 d=1'b0;
        #10 d=1'b1;
        #10 d=1'b1;
        #10 $finish;
    end
endmodule
