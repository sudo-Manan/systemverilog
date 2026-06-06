`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 03.09.2024 12:06:45
// Design Name: 
// Module Name: siso_sr
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


module siso_sr #(parameter n=4)(clk, asyn_rst,d, q, q_parallel);
    input logic clk, asyn_rst, d;
    output logic q;
    output logic [n-1:0] q_parallel;
    
    logic [n-1:0] q_wire;
    genvar i;
    generate
    for(i=0;i<n-1;i++) begin
        DFF_asyn_rst dff_x(clk,asyn_rst,q_wire[i+1],q_wire[i]);
    end
    endgenerate
    DFF_asyn_rst dff_msb(clk,asynn_rst,d,q_wire[n-1]);
    assign q=q_wire[0];
    assign q_parallel=q_wire;
endmodule
