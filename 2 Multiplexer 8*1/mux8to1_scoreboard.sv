// Checks DUT output against reference.

//`include "mux8to1_tx.sv"

import mux_pkg::*;

class scoreboard;
    virtual mux_if vif;
    mailbox mon2scb;

    function new(virtual mux_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        mux_transaction tr;
        forever begin
        
            mon2scb.get(tr);
            if (vif.y !== tr.y_exp)
                $error("Mismatch! sel=%0d d=%0b DUT=%0b REF=%0b",
                       tr.sel, tr.d, vif.y, tr.y_exp);
            else
                $display("PASS: sel=%0d d=%0b y=%0b", tr.sel, tr.d, vif.y);
        end
    endtask
endclass

