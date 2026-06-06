`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 22:57:43
// Design Name: 
// Module Name: Array_2d
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


module Array_2d;
int array_2d[4][3];
    initial begin
        array_2d = '{'{0,1,2}, '{3,4,5}, '{6,7,8}, '{19,20,21}};
        $display("Display initial value: ");
        foreach(array_2d[i,j])
            $display("array_2d[%0d][%0d]=%d",i,j,array_2d[i][j]);
    end
endmodule
