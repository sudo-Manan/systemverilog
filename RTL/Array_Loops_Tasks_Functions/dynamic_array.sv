`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.08.2024 23:42:52
// Design Name: 
// Module Name: dynamic_array
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


module dynamic_array;
int arr1_int[], arr2_int[];
int sum1=0;
int sum2=0;
initial begin
    arr1_int = new[6];
    arr1_int = '{3,6,9,12,15,18};
    arr2_int = new[7];
    arr2_int = '{2,4,6,8,10,12,14};
    foreach(arr1_int[i])
        sum1=sum1+arr1_int[i];
    $display("Sum of arr1_int elements=%0d",sum1);
    foreach(arr2_int[i])
        sum2=sum2+arr2_int[i];
    $display("Sum of arr2_int elements=%0d",sum2);
    arr2_int = new[13](arr2_int);
    arr2_int[7:12]=arr1_int;
    $display(" values in arr1_int & arr2_int before deletion");
    foreach(arr1_int[i])
        $display("arr1_int[%0d]=%0d",i,arr1_int[i]);
    foreach(arr2_int[i])
        $display("arr2_int[%0d]=%0d",i,arr2_int[i]);
    $display(" values in arr1_int & arr2_int after deletion");    
    arr1_int.delete();
    foreach(arr1_int[i])
        $display("arr1_int[%0d]=%0d",i,arr1_int[i]);
    foreach(arr2_int[i])
        $display("arr2_int[%0d]=%0d",i,arr2_int[i]);
    arr2_int.delete();
end 
endmodule
