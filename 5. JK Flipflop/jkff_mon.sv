
import jkff_pkg::*;

class jkff_mon;
    virtual jkff_if vif;
    mailbox mon2sb;

    function new(virtual jkff_if vif, mailbox mon2sb);
        this.vif = vif;
        this.mon2sb = mon2sb;
    endfunction

    task run();
        jkff_txn txn;
        forever begin
            @(posedge vif.clk);
            #1;  // wait for DUT to update q
            txn = new();
            txn.j = vif.j;
            txn.k = vif.k;
            txn.q_exp = vif.q;
            mon2sb.put(txn);
        end
    endtask
endclass
