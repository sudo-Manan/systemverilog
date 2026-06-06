`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 11:37:58
// Design Name: 
// Module Name: Packet_Generator
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


class Packet;

   rand bit [7:0] source;
   rand bit [7:0] destination;
   rand bit [31:0] data;
   
   function new();
       this.source = 0;
       this.destination =0;
       this.data = 0;
   endfunction
   
   function void randomize_packet();
       if (!this.randomize())begin
            $display("Randomization failed");
       end
   endfunction
   
   function void display();
        $display("Packet: Source=%0d, Destination=%0d, Data=%0h", source, destination, data);
   endfunction
   
endclass

class Generator;

    mailbox pkt_mbox;
    
    function new(mailbox mbox);
        this.pkt_mbox = mbox;
    endfunction
    
    task generate_packets(input int num_packets);
        Packet pkt;
        for(int i=1;i<=num_packets;i++)begin
            pkt = new();
            pkt.randomize_packet();
            pkt_mbox.put(pkt);
            $display("Generated and sent packet %0d", i);
        end
    endtask
    
endclass

module Packet_Generator;
    mailbox pkt_mbox;
    Generator gen;
    Packet pkt;
    initial begin
        pkt_mbox = new();
        gen = new(pkt_mbox);
        fork
         begin
             gen.generate_packets(5);
         end
         begin
             for(int i=1;i<=5;i++) begin
                pkt_mbox.get(pkt);
                $display("Recieved packet %0d", i);
                pkt.display();
             end
         end
        join
    end        
endmodule
