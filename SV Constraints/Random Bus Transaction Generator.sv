/*
#Problem Statement: Random Bus Transaction Generator
You need to generate random bus transactions for a simple memory system.

Each transaction has:
1. addr ? 12-bit address (0?4095)
2. data ? 32-bit data
3. burst_len ? number of beats (1?16)
4. read_write ? enum {READ, WRITE}

Constraints:
1. Address must be aligned to burst_len * 4 (since each beat = 4 bytes).
2. If read_write == READ, then data should be 0 (since no data is driven).
3. If read_write == WRITE, then data should be non-zero.
4. Burst length must always be power of 2 (1, 2, 4, 8, 16).

Author: Ravi Raj
*/

typedef enum{READ, WRITE} rw_t;

class BusTxn;
  rand bit [11:0] addr;
  rand bit [31:0] data;
  rand int unsigned burst_len;
  rand rw_t read_write;

// constraint

constraint c_burst{
  burst_len inside {1, 2, 4, 8, 16};
}

constraint c_addr_align{
  addr % (burst_len*4) == 0;
}

constraint c_data {
  if(read_write == READ)
     data == 0;
  else 
     data != 0;
}
endclass

module random_bus_txn_gen;
  BusTxn Txn = new();
  initial begin
    repeat(10) begin
    if(!Txn.randomize())	
	$display("Randomization Failed!!");
    else
	$display("addr: %0d, data: %0d, type: %s, burst: %0d",
		  Txn.addr, Txn.data, (Txn.read_write == READ)?"READ":"WRITE",
			Txn.burst_len);
    end
  end
endmodule







