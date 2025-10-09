// TFF Monitor

import tff_pkg::*;

class tff_monitor;
    virtual tff_if vif;
    mailbox mon2scb;

    function new(virtual tff_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        tff_txn txn;
        forever begin
            @(vif.mon_cb);
            txn = new();
            txn.t = vif.mon_cb.t;
            mon2scb.put(txn);
        end
    endtask
endclass

