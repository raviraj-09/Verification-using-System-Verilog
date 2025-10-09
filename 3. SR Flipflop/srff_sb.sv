
import srff_pkg::*;


class srff_sb;
    mailbox mon2sb;
    bit q_ref = 0;

    function new(mailbox mon2sb);
        this.mon2sb = mon2sb;
    endfunction

    task run();
        srff_txn txn;
bit first = 1;
        forever begin
            mon2sb.get(txn);
if (first) begin
            q_ref = 0;
            first = 0;
        end
            case ({txn.s, txn.r})
                2'b00: q_ref = q_ref;      // Hold
                2'b01: q_ref = 0;          // Reset
                2'b10: q_ref = 1;          // Set
                2'b11: q_ref = 1'bx;     
            endcase

            if (txn.q_exp !== q_ref)
                $display("[SB][FAIL] S=%0b R=%0b | DUT_Q=%0b Expected=%0b",
                         txn.s, txn.r, txn.q_exp, q_ref);
            else
                $display("[SB][PASS]  S=%0b R=%0b | Q=%0b", txn.s, txn.r, q_ref);
        end
    endtask
endclass
