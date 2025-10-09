// Scoreboard

import tff_pkg::*;

class tff_scoreboard;
    mailbox mon2scb;
    logic prev_q;
    bit first_valid = 1;

    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
        prev_q = 0; // initial Q after reset
    endfunction

    task run();
        tff_txn txn;
        logic q_expected;

        forever begin
            mon2scb.get(txn);

            if (first_valid) begin
                // initialize prev_q with first valid Q
                if (txn.t !== 1'bx) begin
                    prev_q = 0; // DUT resets Q to 0
                    first_valid = 0;
                end
            end else begin
                q_expected = txn.t ? ~prev_q : prev_q;

                if (txn.t === 1'bx)
                    $display("[SCB][INFO] Ignoring X T=%0b", txn.t);
                else if (txn.q_exp !== q_expected)
                    $display("[SCB][FAIL] Expected Q=%0b, Got=%0b (T=%0b)",
                             q_expected, txn.q_exp, txn.t);
                else
                    $display("[SCB][PASS] Q=%0b as expected (T=%0b)",
                             q_expected, txn.t);

                prev_q = txn.q_exp;
            end
        end
    endtask
endclass

