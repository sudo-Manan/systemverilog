`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 11:42:35
// Design Name: 
// Module Name: mealy_seq_det_tb
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


module mealy_seq_det_tb;
    logic clk=0,x,rst;
    logic z;
    logic [15:0] data=16'b0011_0110_0101_0100;
    integer i=15;
    mealy_seq_det dut(clk,x,rst,z);
    always
        #5  clk=~clk;
    initial begin
        rst=1;
        #2 rst=0;
        #200 $finish;
    end
    always @(posedge clk) begin
        x=data[i];
        if(i>0)
            i<=i-1;
    end
endmodule
