// Generator

import tff_pkg::*;
class tff_gen;
    mailbox gen2drv;
    virtual tff_if vif;

    function new(mailbox gen2drv, virtual tff_if vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    task run();
        tff_txn txn;

        // Wait until reset is deasserted
        wait(vif.rstn == 1);

        repeat (10) begin
            txn = new();
            assert(txn.randomize());
            gen2drv.put(txn);
            $display("[GEN] T=%0b", txn.t);
            @(vif.drv_cb);  // sync to clock
        end
    endtask
endclass

