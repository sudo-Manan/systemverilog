`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 22:05:43
// Design Name: 
// Module Name: Array_Loop
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


module Array_Loop;
    bit [11:0] my_array [4];
    initial begin
        my_array = '{12'h012,12'h345,12'h678,12'h9AB};
        $display(" Array elements accessed using for loop");
        for(int i=0;i<$size(my_array);i++)
            $display("my_array(%0d)=%h",i,my_array[i]);
        $display(" Array elements accessed using foreach loop");
        foreach(my_array[i])
            $display("my_array(%0d)=%h",i,my_array[i]);
        $display(" Accessing bits[5:4] of each 12-bit element");
        $display(" using for loop");
        for(int i=0;i<$size(my_array);i++)
            $display("my_array(%0d)=12'b%b, b[5:4] %b",i,my_array[i],my_array[i][5:4]);
        $display(" using foreach loop");
        foreach(my_array[i])
            $display("my_array(%0d)=12'b%b, b[5:4] %b",i,my_array[i],my_array[i][5:4]);
    end
endmodule
