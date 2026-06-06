`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2024 11:56:57
// Design Name: 
// Module Name: extern_constr
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
    constraint addr_range;
endclass

constraint packet::addr_range {addr>5;}

module extern_constr;
    initial begin
        packet pkt;
        pkt = new();
        repeat(10) begin
            pkt.randomize();
            $display("\taddr = %0d",pkt.addr);
        end
    end
endmodule