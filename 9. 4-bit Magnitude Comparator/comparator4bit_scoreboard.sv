
import comp_pkg::*;

class scoreboard;
    mailbox mon2sb;

    function new(mailbox mon2sb);
        this.mon2sb = mon2sb;
    endfunction

    task run();
        transaction tr;
	logic gt_ref, lt_ref, eq_ref;
        forever begin
            mon2sb.get(tr);
            
            gt_ref = (tr.A > tr.B);
            lt_ref = (tr.A < tr.B);
            eq_ref = (tr.A == tr.B);

            if ((tr.A_gt_B === gt_ref) && 
                (tr.A_lt_B === lt_ref) && 
                (tr.A_eq_B === eq_ref))
                $display("[SB] PASS for A=%0d B=%0d", tr.A, tr.B);
            else
                $error("[SB] FAIL for A=%0d B=%0d | DUT:(%0b,%0b,%0b) REF:(%0b,%0b,%0b)", 
                       tr.A, tr.B, tr.A_gt_B, tr.A_lt_B, tr.A_eq_B,
                       gt_ref, lt_ref, eq_ref);
        end
    endtask
endclass

