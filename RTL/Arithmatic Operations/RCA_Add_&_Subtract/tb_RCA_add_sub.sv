`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 01.09.2024 21:39:42
// Design Name: 
// Module Name: rc_add_sub_tb
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


module tb_RCA_add_sub;
parameter n=4;
logic signed [n-1:0] a,b;
logic add_sub;
logic signed [n:0] y,y1;
RCA_add_sub #(n) dut(a,b,add_sub,y,y1);
initial begin
parameter n=4;
    a=4'd12;    b=4'd6; add_sub=0;
    #10 $display("input => a=%0d, b=%0d, add_sub=%0d;  y=%0d",a,b,add_sub,y);
    
    a=4'd12;    b=4'd6; add_sub=1;
    #10 $display("input => a=%0d, b=%0d, add_sub=%0d;  y=%0d",a,b,add_sub,y);
    
    a=4'd6;    b=4'd12; add_sub=1;
    #10 $display("input => a=%0d, b=%0d, add_sub=%0d;  y=%0d",a,b,add_sub,y);
    
    a=4'd6;    b=4'd12; add_sub=0;
    #10 $display("input => a=%0d, b=%0d, add_sub=%0d;  y=%0d",a,b,add_sub,y);
    
    a=4'd9;    b=4'd11; add_sub=1;
    #10 $display("input => a=%0d, b=%0d, add_sub=%0d;  y=%0d",a,b,add_sub,y);
    
    #10 $finish;
end
endmodule
