`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 12:30:46
// Design Name: 
// Module Name: tbench_top
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


module tbench_top;
    intf i_intf();
    test t1(i_intf);
    half_adder h1(.a(i_intf.a),.b(i_intf.b),.s(i_intf.sum),.c(i_intf.carry));
    initial begin
        $display("dump.vcd"); $dumpvars;
    end
endmodule
