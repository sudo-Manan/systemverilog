`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 27.08.2024 11:55:07
// Design Name: 
// Module Name: fa_tb
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


module tb_Full_Adder;
    logic a, b, cin, cout, sum;

    Full_Adder dut(a,b,cin,sum,cout);//_fa(.A(a),.B(b),.Cin(cin),.Sum(sum),.Cout(cout));
    
    initial begin
    
    {a,b,cin} = 3'd0;
    #10 $display("a=%b, b=%b, cin=%b;   sum=%0d, cout=%0d", a,b,cin,sum,cout);
    
    {a,b,cin} = 3'd1;
    #10 $display("a=%b, b=%b, cin=%b;   sum=%0d, cout=%0d", a,b,cin,sum,cout);
    
    {a,b,cin} = 3'd7;
    #10 $display("a=%b, b=%b, cin=%b;   sum=%0d, cout=%0d", a,b,cin,sum,cout);
    end
    
endmodule
