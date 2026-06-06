`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 12:22:31
// Design Name: 
// Module Name: environment
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


class environment;
    generator gen;
    driver driv;
    monitor mon;
    scoreboard scb;
    mailbox m1,m2;
    virtual intf vif;
    function new(virtual intf vif);
        this.vif = vif;
        m1 = new();
        m2 = new();
        gen = new(m1);
        driv = new(vif,m1);
        mon = new(vif,m2);
        scb = new(m2);
    endfunction
    task test();
        fork
            gen.main();
            driv.main();
            mon.main();
            scb.main();
        join
    endtask
    task run;
        repeat(4) begin
            test();
        end
    endtask
endclass