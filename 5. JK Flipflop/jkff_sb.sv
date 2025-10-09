
import jkff_pkg::*;


class jkff_sb;
    mailbox mon2sb;
    bit q_ref = 0;

    function new(mailbox mon2sb);
        this.mon2sb = mon2sb;
    endfunction

    task run();
        jkff_txn txn;
bit first = 1;
        forever begin
            mon2sb.get(txn);
if (first) begin
            q_ref = 0;
            first = 0;
        end
            case ({txn.j, txn.k})
                2'b00: q_ref = q_ref;      // Hold
                2'b01: q_ref = 0;          // Reset
                2'b10: q_ref = 1;          // Set
                2'b11: q_ref = ~q_ref;     // Toggle
            endcase

            if (txn.q_exp !== q_ref)
                $display("[SB][FAIL] J=%0b K=%0b | DUT_Q=%0b Expected=%0b",
                         txn.j, txn.k, txn.q_exp, q_ref);
            else
                $display("[SB][PASS]  J=%0b K=%0b | Q=%0b", txn.j, txn.k, q_ref);
        end
    endtask
endclass
