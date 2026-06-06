`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 11:58:43
// Design Name: 
// Module Name: driver
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


class driver;
    virtual intf vif;
    mailbox gen2driv;
    function new(virtual intf vif, mailbox gen2driv);
        this.vif=vif;
        this.gen2driv=gen2driv;
    endfunction
    task main();
        repeat(1) begin
            transaction trans_item;
            gen2driv.get(trans_item);
            vif.a <= trans_item.a;
            vif.b <= trans_item.b;
            trans_item.sum = vif.sum;
            trans_item.carry = vif.carry;
            trans_item.display("Driver");
        end
    endtask
endclass
