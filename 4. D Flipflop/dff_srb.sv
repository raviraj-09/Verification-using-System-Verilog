// Scoreboard

import dff_pkg::*;

class dff_scoreboard;
    mailbox mon2scb;
    logic prev_d = 0;
    logic prev_rstn = 1;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    task run();
        dff_txn txn;
        forever begin
            mon2scb.get(txn);
            if (!txn.q_exp)
                $display("[SCB] Reset active. Q=%0b", txn.q_exp);
            else if (txn.q_exp != prev_d)
                $display("[SCB] Mismatch! Expected %0b Got %0b", prev_d, txn.q_exp);
            else
                $display("[SCB] PASS. Q=%0b as expected.", txn.q_exp);
            prev_d = txn.d;
        end
    endtask
endclass

