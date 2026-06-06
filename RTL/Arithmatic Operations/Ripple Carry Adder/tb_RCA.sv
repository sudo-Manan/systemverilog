`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 27.08.2024 12:32:20
// Design Name: 
// Module Name: rca_tb
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


module tb_RCA;
parameter n=4;
logic [n-1:0] a,b;
logic cin;
logic [n:0] sum;

RCA #(n) rca_dut(a,b,cin,sum);

initial begin
    parameter n=4;
    a=4'd12; b=4'd6; cin=1;
    #10 $display("inputs => a=%0d b=%0d cin=%0d; sum = %0d",a,b,cin,sum);
    
    a=4'd12; b=4'd1; cin=0;
    #10 $display("inputs => a=%0d b=%0d cin=%0d; sum = %0d",a,b,cin,sum);
    
    a=4'd12; b=4'd7; cin=1;
    #10 $display("inputs => a=%0d b=%0d cin=%0d; sum = %0d",a,b,cin,sum);
#10 $finish;

end
endmodule
