// Driver

import tff_pkg::*;

class tff_driver;
    virtual tff_if vif;
    mailbox gen2drv;

    function new(virtual tff_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        tff_txn txn;

        // Apply reset sequence
        vif.drv_cb.rstn <= 0;
        vif.drv_cb.t <= 0;
        repeat (2) @(vif.drv_cb);
        vif.drv_cb.rstn <= 1;

        forever begin
            gen2drv.get(txn);
            vif.drv_cb.t <= txn.t;
            @(vif.drv_cb);
        end
    endtask
endclass

