`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2024 11:33:41
// Design Name: 
// Module Name: sv_task_function
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


module sv_task_function;
    int x,y;
    
    task sum(input int a,b, output int c);
        c=a+b;
    endtask
    
    task static static_increment(input int incr);
        int i=1;
        i+=incr;
        $display("\tResult of increment = %0d", i);
    endtask
    
    task automatic auto_increment(input int incr);
        int i=1;
        i+=incr;
        $display("\tResult of increment = %0d", i);
    endtask
    
    task auto_example (input time delay);
        static logic static_var =1'b0;
        automatic logic auto_var = 1'b0;
        $display("\tEntering task at %0tns", $time);
        $display("\tAutomatic Variable = %0d", auto_var);
        $display("\tStatic variable = %0d", static_var);
        #delay
        static_var = ~static_var;
        auto_var = ~auto_var;
        $display("\tTask completed at %0tns", $time);
        $display("\tAutomatic Variable = %0d", auto_var);
        $display("\tStatic variable = %0d", static_var);
    endtask
    
    function int sum1(input int a,b);
        sum1=a+b;
    endfunction
    
    function int sum2;
        input int a,b;
        sum2=a+b;
    endfunction
    
    function int sum3;
        input int a,b;
        return a+b;
    endfunction
    
    function void current_time;
        $display("\tCurrent simulation time is %0d",$time);
    endfunction
    
    initial begin
        $display("sum task");
        sum(10,5,x);
        $display("\tValue of x = %0d\n",x);
        
        $display("Static increment i = 1");
        static_increment(1);
        $display("Static increment i = 2");
        static_increment(2);
        $display("Static increment i = 3");
        static_increment(3);
        
        $display("\n");
        $display("Automatic increment i = 1");
        auto_increment(1);
        $display("Automatic increment i = 2");
        auto_increment(2);
        $display("Automatic increment i = 3");
        auto_increment(3);
        
        $display("\n");
        $display("auto variable task");
        repeat (3) begin
            auto_example(10);
        end
        
        $display("\n");
        $display("sum function (arguments in parentheses)");
        y=sum1(10,5);
        $display("\tValue of y (sum function(arguments in parentheses) = %0d",y);
        
        $display("sum function (arguments in declarations and mentioning directions)");
        y=sum2(10,5);
        $display("\tValue of y (arguments in declarations and mentioning directions) = %0d",y);
        
        $display("sum function (return value with return keyword)");
        y=sum3(10,5);
        $display("\tValue of y (return value with return keyword) = %0d",y);
        
        $display("\n");
        $display("current time function");
        #10     current_time();
        #10     current_time();
    end
    
endmodule
