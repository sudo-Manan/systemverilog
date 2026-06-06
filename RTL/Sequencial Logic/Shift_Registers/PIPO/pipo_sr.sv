`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 03.09.2024 12:27:53
// Design Name: 
// Module Name: pipo_sr
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


module pipo_sr #(parameter n=4)(clk, asyn_rst, d, q);
    input logic clk, asyn_rst;
    input logic [n-1:0] d;
    output logic [n-1:0] q;
    
    logic [n-1:0] q_wire;
    
    genvar i;
    generate
    for(i=0;i<n-1;i++) begin
        DFF_asyn_rst dff_x(clk, asyn_rst, q_wire[i+1], q_wire[i]);
    end
    endgenerate
    DFF_asyn_rst  dff_msb(clk, asyn_rst, d[n-1], q_wire[n-1]);
    
    assign q=q_wire;
endmodule
