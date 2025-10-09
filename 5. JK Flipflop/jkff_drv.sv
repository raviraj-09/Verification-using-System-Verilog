
import jkff_pkg::*;

class jkff_drv;
    virtual jkff_if vif;
    mailbox gen2drv;

    function new(virtual jkff_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        jkff_txn txn;
        forever begin
            gen2drv.get(txn);
            @(negedge vif.clk);    // <--- drive before posedge
            vif.j <= txn.j;
            vif.k <= txn.k;
        end
    endtask
endclass

