`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 12:06:23
// Design Name: 
// Module Name: monitor
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


class monitor;
    virtual intf vif;
    mailbox mon2scb;
    function new(virtual intf vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
     endfunction
     task main;
        repeat(1)
            #3;
            begin
            transaction trans_item;
            trans_item = new();
            trans_item.a = vif.a;
            trans_item.b = vif.b;
            trans_item.sum = vif.sum;
            trans_item.carry = vif.carry;
            mon2scb.put(trans_item);
            trans_item.display("Monitor");
            end
    endtask
endclass
