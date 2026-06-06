`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 27.08.2024 11:47:40
// Design Name: 
// Module Name: activity1
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


module Full_Adder(
    input logic A, B, Cin,
    output logic Cout, Sum
    );
    
    assign Sum=A^B^Cin;
    
    assign Cout=(A&B)|(Cin&(A^B));
    
endmodule
