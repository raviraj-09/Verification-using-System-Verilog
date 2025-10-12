
import comp_pkg::*;

class driver;
    virtual comp_if vif;
    mailbox gen2drv;

    function new(virtual comp_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        transaction tr;
        forever begin
            gen2drv.get(tr);
            vif.A = tr.A;
            vif.B = tr.B;
            #2; // wait for DUT to compute
        end
    endtask
endclass
