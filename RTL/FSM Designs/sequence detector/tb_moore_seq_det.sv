`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 13.12.2024 23:04:35
// Design Name: 
// Module Name: tb2b
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


module moore_seq_det(clk,rst,x,y);
    input logic clk,rst,x;
    output logic y;
    
    typedef enum{s0,s1,s2,s3} fsm_s;
    fsm_s ps, ns;
    
    always @(posedge clk, posedge rst) begin
        if (rst==1)
            ps <= s0;
        else ps <= ns;
    end
    
    always @(ps, x) begin
        case(ps)
        s0: if (x==1)
            ns = s1;
            else
            ns = s0;
        s1: if (x==0)
            ns = s2;
            else
            ns = s1;
        s2: if (x==1)
            ns = s3;
            else
            ns = s0;
        s3: if(x==0)
            ns = s2;
            else
            ns = s1;
        default: ns = s0;
        endcase
    end
    
    always @(ps,x) begin
        case(ps)
        s3: y=1'b1;
        default: y=1'b0;
        endcase
    end
    
endmodule


module tb_moore_seq_det;
    logic clk=0,rst,x;
    logic y;
    logic [15:0] data = 16'b0011011001010100;
    int i=15;
    
    moore_det dut(clk,rst,x,y);
    
    always #5 clk=~clk;
    initial begin
        rst = 1;
        #2 rst=0;
        #200 $finish;
    end
    always@(posedge clk) begin
        #5 x=data[i];
        if (i>0)
            i=i-1;
     end
endmodule
        