`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 11:52:33
// Design Name: 
// Module Name: generator
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


class generator;
    transaction trans_item;
    mailbox gen2driv=new();
    function new(mailbox gen2driv);
        this.gen2driv = gen2driv;
    endfunction
    task main();
        repeat(1) begin
            trans_item = new();
            trans_item.randomize();
            trans_item.display("Generator");
            gen2driv.put(trans_item);
        end
    endtask
endclass
