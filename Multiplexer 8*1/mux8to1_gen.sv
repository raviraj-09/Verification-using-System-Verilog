// Produces randomized transactions.
//`include "mux8to1_tx.sv"

import mux_pkg::*;
class generator;
    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run(int n=20);
        mux_transaction tr;
        repeat(n) begin
	 
            tr = new();
            assert(tr.randomize());
            gen2drv.put(tr);
            tr.display("GEN");
        end
    endtask
endclass
