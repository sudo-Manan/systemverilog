`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 27.08.2024 12:21:25
// Design Name: 
// Module Name: RCA
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


module RCA #(parameter N=4) (A,B,Cin,Sum);
    input logic [N-1:0] A, B;
    input logic Cin;
    output logic [N:0] Sum;
    
    logic [N:0] carry;
    assign carry[0] = Cin;
    
    genvar i;
    generate
        for(i=0;i<N;i++) begin
            Full_Adder fa(A[i],B[i],carry[i],carry[i+1],Sum[i]);
        end
    endgenerate
    
    assign Sum[N] = carry[N];
endmodule
