
import comp_pkg::*;

class monitor;
    virtual comp_if vif;
    mailbox mon2sb;

    function new(virtual comp_if vif, mailbox mon2sb);
        this.vif = vif;
        this.mon2sb = mon2sb;
    endfunction

    task run();
        transaction tr;
        forever begin
            #3;
            tr = new();
            tr.A = vif.A;
            tr.B = vif.B;
            tr.A_gt_B = vif.A_gt_B;
            tr.A_lt_B = vif.A_lt_B;
            tr.A_eq_B = vif.A_eq_B;
            mon2sb.put(tr);
        end
    endtask
endclass
