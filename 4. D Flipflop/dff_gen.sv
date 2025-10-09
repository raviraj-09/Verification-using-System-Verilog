// Generator

import dff_pkg::*;

class dff_gen;
    rand int num_txn;
    dff_txn txn;
    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        repeat (10) begin
            txn = new();
            assert(txn.randomize());
            txn.q_exp = txn.d; // Expected output (next cycle)
            gen2drv.put(txn);
            txn.display("GEN");
        end
    endtask
endclass
