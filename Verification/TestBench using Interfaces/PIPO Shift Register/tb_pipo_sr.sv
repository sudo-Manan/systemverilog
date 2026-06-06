`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 12:16:17
// Design Name: 
// Module Name: tb_pipo_sr
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


module tb_pipo_sr;
    sr_inf inf();
    pipo_sr uut(.clk(inf.clk),.rst(inf.rst),.d(inf.d_in),.q(inf.q_out));
    initial begin
        inf.clk = 0;
        forever #5 inf.clk = ~inf.clk;
    end
    
    initial begin
        inf.rst=1;
        #12 $display("time: %0t | d_in: %b | q_out: %b", $time, inf.d_in, inf.q_out);
        inf.rst = 0;
        #10 $display("time: %0t | d_in: %b | q_out: %b", $time, inf.d_in, inf.q_out);
        inf.d_in=4'b1010;
        #10 $display("time: %0t | d_in: %b | q_out: %b", $time, inf.d_in, inf.q_out);
        inf.d_in=4'b1100;
        #10 $display("time: %0t | d_in: %b | q_out: %b", $time, inf.d_in, inf.q_out);
        #10 $finish;
    end
endmodule
