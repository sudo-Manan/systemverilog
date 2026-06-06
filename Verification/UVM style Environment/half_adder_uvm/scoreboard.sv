`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 12:14:11
// Design Name: 
// Module Name: scoreboard
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


class scoreboard;
    mailbox mon2scb;
    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction
    task main;
        transaction trans_item;
        repeat(1) begin
            mon2scb.get(trans_item);
            if(((trans_item.a^trans_item.b)==trans_item.sum) && ((trans_item.a & trans_item.b)==trans_item.carry))
                $display("Result is as Expected");
            else
                $error("Wrong Result");
        end
    endtask
endclass
