`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 16:34:48
// Design Name: 
// Module Name: seq_det
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


module mealy_seq_det(myclk,x,rst,z);
    input logic myclk,x,rst;
    output logic z;
    typedef enum{s0,s1,s2} fsm_e;
    fsm_e reg_ps, reg_ns;
    always @(posedge myclk, posedge rst) begin
    if(rst==1)
        reg_ps<=s0;
    else if(myclk==1)
        reg_ps<=reg_ns;
    end
    always @(reg_ps,x) begin
        case(reg_ps)
        s0: if (x==1)
            reg_ns=s1;
            else
            reg_ns=s0;
        s1: if(x==0)
            reg_ns=s2;
            else
            reg_ns=s1;
        s2: if(x==1)
            reg_ns=s1;
            else
            reg_ns=s0;
        default: reg_ns=s0;
        endcase
    end
    always @(x, reg_ps) begin
        case(reg_ps)
        s2: if(x==1)
            z=1'b1;
            else
            z=1'b0;
        default: z=1'b0;
        endcase
    end
endmodule
