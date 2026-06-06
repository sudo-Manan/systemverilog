`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2024 11:47:00
// Design Name: 
// Module Name: transaction
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


class transaction;
    rand bit a;
    rand bit b;
    bit sum;
    bit carry;
    function void display(input string name);
        $display("---------------------------");
        $display("%s", name);
        $display("---------------------------");
        $display("a = %0d, b = %0d",a,b);
        $display("sum = %0d, carry = %0d",sum,carry);
        $display("---------------------------");
    endfunction
endclass
