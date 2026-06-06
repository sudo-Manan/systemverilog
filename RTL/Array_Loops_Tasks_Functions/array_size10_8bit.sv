`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 23:13:37
// Design Name: 
// Module Name: array_size10_8bit
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


module array_size10_8bit;
    bit [7:0] arr1[10], arr2[10];
    initial begin
        $display(" initialize the arrays");
        arr1 = '{8'd2,8'd4,8'd6,8'd8,8'd10,8'd12,8'd14,8'd16,8'd18,8'd20};
        arr2 = '{8'd1,8'd3,8'd5,8'd7,8'd9,8'd11,8'd13,8'd15,8'd17,8'd19};
        $display(" initial value stored in the array");
        foreach(arr1[i])
            $display("arr1[%0d]=%0d",i,arr1[i]);
        foreach(arr2[i])
            $display("arr2[%0d]=%0d",i,arr2[i]);
            
        arr2 = arr1;
        $display("arr1 %s  arr2",(arr1==arr2)?"==":"!=");
    end
endmodule
