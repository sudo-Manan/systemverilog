`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 11:56:18
// Design Name: 
// Module Name: moore_seq_det
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


module moore_seq_det(clk,x,rst,z);
    input logic clk, x, rst;
    output logic z;
    typedef enum{s0,s1,s2,s3} fsm_e;
    fsm_e reg_ps, reg_ns;
    always @(posedge clk, posedge rst) begin
    if(rst==1)
        reg_ps<=s0;
    else if(clk==1)
        reg_ps<=reg_ns;
   end
   always @(reg_ps, x) begin
    case(reg_ps)
    s0:if(x==1)
        reg_ns=s1;
        else
        reg_ns=s0;
    s1:if(x==0)
        reg_ns=s2;
        else
        reg_ns=s1;
    s2:if(x==1)
        reg_ns=s3;
        else
        reg_ns=s0;
    s3:if(x==1)
        reg_ns=s1;
        else
        reg_ns=s2;
    default: reg_ns=s0;
    endcase
   end
   always @(x,reg_ps) begin
    case(reg_ps)
    s3: z=1'b1;
    default: z=1'b0;
    endcase
   end
endmodule
