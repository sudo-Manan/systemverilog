`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 27.08.2024 12:54:51
// Design Name: 
// Module Name: rc_add_sub
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


module RCA_add_sub #(parameter n=4) (a,b,add_sub,y,y1);
input logic [n-1:0] a,b;
input logic add_sub;
output logic [n:0] y,y1;

logic [n:0] a1, b1;
logic [n:0] b1_x;

logic [n+1:0] sum;

assign a1={a[n-1],a};
assign b1={b[n-1],b};

genvar j;
    generate
        for(j=0;j<n+1;j++) begin
            xor xor1(b1_x[j], add_sub, b1[j]);
        end
    endgenerate
        assign y1=b1_x;
        
        RCA #(n+1) rca_1(a1,b1_x,add_sub,sum);
        assign y=sum[n:0];
endmodule
