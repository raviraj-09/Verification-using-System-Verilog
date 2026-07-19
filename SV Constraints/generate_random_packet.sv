/*
#Problem Statement
Suppose you are designing a verification test where you need to generate random packet transactions. 

Each packet has:
1. addr ? 8-bit (0 to 255)
2. data ? 16-bit
3. pkt_type ? enum {READ, WRITE}
4. length ? (1 to 8 bytes)

Constraints:
1. If pkt_type == READ, then length must be 4.
2. If pkt_type == WRITE, then length can be 1 to 8.
3. Address must be aligned to length (i.e., addr % length == 0).

Author: Ravi Raj
*/

typedef  enum {READ, WRITE} pkt_t;

class packet;
rand bit [7:0] addr;
rand bit [15:0] data;
rand pkt_t pkt_type;
rand int unsigned length;

// constraints

constraint c_pkt_type {
	if(pkt_type == READ) 
	   length == 4;
	else
	   length inside{[1:8]};
}

constraint c_addr_align {
	addr % length == 0;
}

endclass

module generate_random_packet();
  packet p = new();
  initial begin 
    repeat(10) begin
    if(!p.randomize())
      $display("Randomization Failed!");
    else
      $display("addr = %0d, data = %0d, type = %s, length = %0d",
	        p.addr, p.data,(p.pkt_type == READ)?"READ":"WRITE", p.length);
    end
  end
endmodule









