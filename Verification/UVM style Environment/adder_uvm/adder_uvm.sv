`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Manan Jain
// 
// Create Date: 11.11.2024 17:58:43
// Design Name: 
// Module Name: adder
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


 module adder_uvm (clk, reset, a, b, valid, c);
    input clk;
    input reset;
    input [3:0]a, b;
    input valid;
    output [6:0] c;
    reg [6:0] tmp_c;
    always@ (posedge reset)
        tmp_c <=0;
    always @(posedge clk)
        if (valid)      tmp_c<=a+b;
    assign c=tmp_c;
endmodule

interface intf(input logic clk, reset);
    logic valid;
    logic [3:0] a, b;
    logic [6:0] c;
endinterface

class transaction;
    rand bit [3:0] a;
    rand bit [3:0] b;
    bit [6:0] c;
    function void display(string name);
        $display("------------------------------------------");
        $display("- %s ",name);
        $display("------------------------------------------");
        $display("- a = %0d, b = %0d", a,b);
        $display("- c = %0d",c);
        $display("------------------------------------------");
    endfunction
endclass

class generator;
    rand transaction trans;
    int repeat_count;
    mailbox gen2driv;
    event ended;
    function new(mailbox gen2driv);
        this.gen2driv=gen2driv;
    endfunction
    task main();
        repeat (repeat_count) begin
            trans=new();
            if( !trans.randomize() )    $fatal ("Gen:: trans randomization failed");
            trans.display("[ Generator] ");
            gen2driv.put(trans);
        end
        ->ended;
    endtask
endclass

class driver;
    int no_transactions;
    virtual intf vif;
    mailbox gen2driv;
    function new (virtual intf vif, mailbox gen2driv);
        this.vif=vif;
        this.gen2driv=gen2driv;
    endfunction
    task reset;
        wait (vif.reset);
        $display ("[ DRIVER ] ----- Reset Started -----");
        vif.a<=0;
        vif.b<=0;
        vif.valid<=0;
        wait(!vif.reset);
        $display ("[ DRIVER ] ----- Reset Ended -----");
    endtask
    task main;
        forever begin
            transaction trans;
            gen2driv.get(trans);
            @(posedge vif.clk);
                vif.valid<=1;
                vif.a<=trans.a;
                vif.b<=trans.b;
            @(posedge vif.clk);
                vif.valid<=0;
                trans.c=vif.c;
            @(posedge vif.clk);
                trans. display ("[ DRIVER ]");
                no_transactions++;
        end
    endtask
endclass

class monitor;
    virtual intf vif;
    mailbox mon2scb;
    function new(virtual intf vif,mailbox mon2scb);
        this.vif=vif;
        this.mon2scb=mon2scb;
    endfunction
    task main;
        forever begin
            transaction trans;
            trans=new();
            @(posedge vif.clk);
            wait(vif.valid);
            trans.a=vif.a;
            trans.b=vif.b;
            @(posedge vif.clk);
            trans.c=vif.c;
            @ (posedge vif.clk);
            mon2scb.put(trans);
            trans.display("[ MONITOR ]");
        end
    endtask
endclass

class scoreboard;
    mailbox mon2scb;
    int no_transactions;
    function new (mailbox mon2scb);
        this.mon2scb=mon2scb;
    endfunction
    task main;
        transaction trans;
        forever begin
        mon2scb.get(trans);
        if((trans.a+trans.b)==trans.c)
            $display("Result is as Expected");
        else
            $error("Wrong Result.\n\tExpected: %0d:: Actual: %0d", (trans.a+trans.b), trans.c);
        no_transactions++;
        trans.display ("[Scoreboard]");
        end
    endtask
endclass

class environment;
    generator gen;
    driver driv;
    monitor mon;
    scoreboard scb;
    
    mailbox gen2driv;
    mailbox mon2scb;
    virtual intf vif;
    function new (virtual intf vif);
        this.vif=vif;
        gen2driv=new();
        mon2scb=new();
        gen=new(gen2driv);
        driv=new(vif,gen2driv);
        mon=new(vif,mon2scb);
        scb=new(mon2scb);
    endfunction
    task pre_test();
        driv.reset();
    endtask
    task test();
        fork
        gen.main();
        driv.main();
        mon.main();
        scb.main();
        join_any
    endtask
    task post_test();
        wait(gen.ended.triggered);
        wait(gen.repeat_count==driv.no_transactions);
        wait(gen.repeat_count==scb.no_transactions);
    endtask
    task run;
        pre_test();
        test();
        post_test();
        $finish;
    endtask
endclass

program test(intf i_intf);
    class my_trans extends transaction;
        bit [1:0] count;
        function void pre_randomize();
            a.rand_mode(0);
            b.rand_mode(0);
            a=10;
            b=12;
        endfunction
    endclass
    environment env;
    my_trans my_tr;
    initial begin
        env=new(i_intf);
        my_tr=new();
        env.gen.repeat_count=3;
        env.gen.trans=my_tr;
        env.run ();
    end
endprogram

module tbench_top;
    bit clk, reset;
    
    always #5 clk=~clk;
    
    initial begin
        reset=1;
        #5 reset=0;
    end
    intf i_intf(clk, reset);
    test t1(i_intf);
    adder DUT(.clk(i_intf.clk),.reset (i_intf.reset),.a (i_intf.a),.b(i_intf.b),.valid(i_intf.valid),.c(i_intf.c));
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule