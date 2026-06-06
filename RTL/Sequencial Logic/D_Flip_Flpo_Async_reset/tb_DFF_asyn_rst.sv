`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 03.09.2024 11:58:06
// Design Name: 
// Module Name: tb_DFF_asyn_rst
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


module tb_DFF_asyn_rst;
    logic clk=0,asyn_rst,d;
    logic q;
DFF_asyn_rst dut(clk,asyn_rst, d, q);
always begin
    #5 clk=~clk;
end
    initial begin
    #10 asyn_rst=1'b1;
    
    #12 asyn_rst=1'b0;  d=1'b1;
    //$display("Reset=%0d;  d=%0d;  q=%0d",asyn_rst,d,q);
    #10 d=1'b0;
    //$display("Reset=%0d;  d=%0d;  q=%0d",asyn_rst,d,q);
    #10 d=1'b1;
    //$display("Reset=%0d;  d=%0d;  q=%0d",asyn_rst,d,q);
    #10 d=1'b0;
    //$display("Reset=%0d;  d=%0d;  q=%0d",asyn_rst,d,q);
    #10 $finish;
    end
endmodule
