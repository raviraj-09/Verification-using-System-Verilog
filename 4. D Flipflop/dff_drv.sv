// Driver

import dff_pkg::*;

class dff_driver;
    virtual dff_if vif;
    mailbox gen2drv;

    function new(virtual dff_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        dff_txn txn;
        vif.drv_cb.rstn <= 0;
        repeat (2) @(vif.drv_cb);
        vif.drv_cb.rstn <= 1;

        forever begin
            gen2drv.get(txn);
            vif.drv_cb.d <= txn.d;
            @(vif.drv_cb);
        end
    endtask
endclass

