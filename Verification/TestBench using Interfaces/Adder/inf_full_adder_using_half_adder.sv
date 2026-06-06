`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2024 11:43:06
// Design Name: 
// Module Name: ha_fa_inf
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


module half_adder(input a,b, output so, co);
    assign so = a^b;
    assign co = a&b;
endmodule

interface inf_full_adder;
    logic a, b, c;
    logic s_out, c_out;
endinterface

module full_adder(inf_full_adder inf);
    wire s0, c0, c1;
    half_adder ha1(inf.a, inf.b, s0, c0);
    half_adder ha2(s0, inf.c, inf.s_out, c1);
    assign inf.c_out = c0|c1;
endmodule

module tb_full_adder;
    inf_full_adder inf1();
    full_adder fa1(inf1);
    
    initial begin
        $monitor("a=%0b b=%0b c=%0b, sum=%0b, carry=%0b",inf.a,inf.b,inf.c,inf.s_out,inf.c_out);
        inf.a = 1; inf.b = 0; inf.c = 0;
        #1
        inf.a = 1; inf.b = 0; inf.c = 1;
        #1
        inf.a = 1; inf.b = 1; inf.c = 1;
    end
endmodule
