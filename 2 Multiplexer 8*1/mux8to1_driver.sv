// Drives transactions to the DUT interface.

//`include "mux8to1_tx.sv"

import mux_pkg::*;
class driver;
    virtual mux_if vif;
    mailbox gen2drv;

    function new(virtual mux_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        mux_transaction tr;
        forever begin
            gen2drv.get(tr);
            // Drive signals
            vif.d   <= tr.d;
            vif.sel <= tr.sel;
            #5; // small delay
        end
    endtask
endclass

