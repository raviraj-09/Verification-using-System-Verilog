/*
#Problem 5: Random Packet Buffer (Array of Variable Size)

Concept: Randomize array size + elements under constraints.

You?re testing a packet buffer that can hold 1?10 packets.

Each packet has:
1. id ? 8-bit unique number
2. size ? 1?1500 bytes
3. priority ? 0?3

Constraints:
1. No two packets have the same ID.
2. Total buffer size (sum of all packet sizes) ? 4000 bytes.
3. If priority = 3 ? size must be ? 512 bytes.
*/


class Packet;
  rand bit [7:0] id;
  rand int unsigned size;
  rand int unsigned prio; // renamed from 'priority'

  constraint c_values {
    size inside {[1:1500]};
    prio inside {[0:3]};
  }

  constraint c_priority {
    if (prio == 3) size <= 512;
  }
endclass


class PacketBuffer;
  rand int unsigned num_packets;
  rand Packet pkts[];

  constraint c_num {
    num_packets inside {[1:50]};
    pkts.size() == num_packets;
  }

  // We'll handle total size after randomization
endclass


module rpb_tb;
  PacketBuffer buf1 = new();
  initial begin
    
    if (!buf1.randomize()) 
      $display("Randomization failed!");
    else begin
      int total_size = 0;
      foreach (buf1.pkts[i]) begin
        total_size += buf1.pkts[i].size;
        $display("Pkt[%0d]: ID=%0d Size=%0d Prio=%0d",
                 i, buf1.pkts[i].id, buf1.pkts[i].size, buf1.pkts[i].prio);
      end
      $display("Total Buffer Size = %0d bytes", total_size);
    end
  end
endmodule

