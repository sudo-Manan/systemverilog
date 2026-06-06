`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2024 11:47:34
// Design Name: 
// Module Name: packet
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


class packet;
    rand bit [3:0] addr;
    constraint addr_range { addr>5; }
endclass

module constr_blocks;
    initial begin
        packet pkt;
        pkt = new();
        repeat(10) begin
            pkt.randomize();
            $display("\taddr = %0d",pkt.addr);
        end
    end
endmodule