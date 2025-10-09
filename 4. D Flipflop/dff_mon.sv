// DFF Monitor

import dff_pkg::*;

class dff_monitor;
    virtual dff_if vif;
    mailbox mon2scb;

    function new(virtual dff_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        dff_txn txn;
        forever begin
            @(vif.mon_cb);
            txn = new();
            txn.d = vif.mon_cb.d;
            txn.q_exp = vif.mon_cb.q;
            mon2scb.put(txn);
        end
    endtask
endclass

