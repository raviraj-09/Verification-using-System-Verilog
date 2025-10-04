// Collects DUT input/output and sends to scoreboard.
 
//`include "mux8to1_tx.sv"
import mux_pkg::*;

class monitor;
    virtual mux_if vif;
    mailbox mon2scb;

    function new(virtual mux_if vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction

    task run();
        mux_transaction tr;
        forever begin
            #5; // sampling delay
            tr = new();
            tr.d     = vif.d;
            tr.sel   = vif.sel;
            tr.y_exp = tr.d[tr.sel];
            mon2scb.put(tr);
            tr.display("MON");
        end
    endtask
endclass
