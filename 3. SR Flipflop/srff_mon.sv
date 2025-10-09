
import srff_pkg::*;

class srff_mon;
    virtual srff_if vif;
    mailbox mon2sb;

    function new(virtual srff_if vif, mailbox mon2sb);
        this.vif = vif;
        this.mon2sb = mon2sb;
    endfunction

    task run();
        srff_txn txn;
        forever begin
            @(posedge vif.clk);
            #1;  // wait for DUT to update q
            txn = new();
            txn.s = vif.s;
            txn.r = vif.r;
            txn.q_exp = vif.q;
            mon2sb.put(txn);
        end
    endtask
endclass
