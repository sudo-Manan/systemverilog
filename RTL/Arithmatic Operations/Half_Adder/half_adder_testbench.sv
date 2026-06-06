`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 12.08.2024 21:42:38
// Design Name: 
// Module Name: ha_tb
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


module half_adder_testbench();
    reg a,b;
    wire s,c;
    
    half_adder DUT_HA(.a(a),.b(b),.sum(s),.carry(c));
    
    initial begin
        # 10    a=1'b0; b=1'b0;
        # 10    a=1'b0; b=1'b1;
        # 10    a=1'b1; b=1'b0;
        # 10    a=1'b1; b=1'b1;
        # 10 $finish;
    end
        
endmodule
