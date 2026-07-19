/*
#Problem 4: Random Memory Access Sequence
You need to generate a sequence of memory accesses for verifying a memory controller.

Each access has:
1. addr ? 16-bit (0?65535)
2. data ? 32-bit
3. rw ? enum {READ, WRITE}

Sequence-Level Constraints:
1. No two consecutive transactions should have the same address.
2. If a WRITE happens, at least one READ must follow for the same 
   address within the next 5 transactions.
3. Total number of transactions = 20.
*/

typedef enum {READ, WRITE} rw_t;

class MemAccess;
  rand bit [15:0] addr;
  rand bit [31:0] data;
  rand rw_t rw;

  // Constraint for data
  constraint c_data {
    if (rw == READ) data == 0; 
    else data != 0;
  }
endclass


class MemSeq;
  rand MemAccess seq[20]; // sequence of 20 accesses

  // Fix: allow consecutive same addr only in WRITE->READ case
  constraint c_no_same_addr {
    foreach (seq[i]) {
      if (i > 0) {
        if (!(seq[i-1].rw == WRITE && seq[i].rw == READ))
          seq[i].addr != seq[i-1].addr;
      }
    }
  }

  // Ensure every WRITE is followed by READ of same addr within 5
  constraint c_write_followed_by_read {
    foreach (seq[i]) {
      if (seq[i].rw == WRITE && i < 15) {
        (seq[i+1].addr == seq[i].addr && seq[i+1].rw == READ) ||
        (seq[i+2].addr == seq[i].addr && seq[i+2].rw == READ) ||
        (seq[i+3].addr == seq[i].addr && seq[i+3].rw == READ) ||
        (seq[i+4].addr == seq[i].addr && seq[i+4].rw == READ) ||
        (seq[i+5].addr == seq[i].addr && seq[i+5].rw == READ);
      }
    }
  }
endclass


module memoryAccess_tb;
  MemSeq ms = new();
  initial begin
    
    if (!ms.randomize())
      $display("Randomization failed!");
    else begin
      foreach(ms.seq[i]) begin
        $display("Txn[%0d]: ADDR=%0d DATA=%0d TYPE=%s",
                 i, ms.seq[i].addr, ms.seq[i].data,
                 (ms.seq[i].rw==READ)?"READ":"WRITE");
      end
    end
  end
endmodule






