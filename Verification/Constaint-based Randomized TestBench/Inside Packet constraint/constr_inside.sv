`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2024 12:06:20
// Design Name: 
// Module Name: constr_inside
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

class packet3;
    rand bit [3:0] addr;
    rand bit [3:0] start_addr;
    rand bit [4:0] end_addr;
    constraint addr_1_range {addr inside{[start_addr:end_addr]};}
endclass

module constr_inside;
    initial begin
    packet3 pkt;
    pkt = new();
    $display("------------------------------------");
    repeat(3) begin
        pkt.randomize();
        $display("\tstart_addr = %0d, end_addr = %0d", pkt.start_addr, pkt.end_addr);
        $display("\taddr = %0d", pkt.addr);
        $display("------------------------------------");
    end
    end
endmodule
