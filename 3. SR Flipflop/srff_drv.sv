
import srff_pkg::*;

class srff_drv;
    virtual srff_if vif;
    mailbox gen2drv;

    function new(virtual srff_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        srff_txn txn;
        forever begin
            gen2drv.get(txn);
            @(negedge vif.clk);    // <--- drive before posedge
            vif.s <= txn.s;
            vif.r <= txn.r;
        end
    endtask
endclass

