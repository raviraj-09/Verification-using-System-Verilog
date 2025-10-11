
class monitor;
    virtual full_adder_if vif;
    mailbox mon_mbx;

    function new(virtual full_adder_if vif, mailbox mon_mbx);
        this.vif = vif;
        this.mon_mbx = mon_mbx;
    endfunction

    task run();
        forever begin
            @(vif.a or vif.b or vif.cin);
            #1; // allow DUT outputs to stabilize
            mon_mbx.put({vif.a, vif.b, vif.cin, vif.sum, vif.carry});
            $display("[MON] a=%0b b=%0b cin=%0b sum=%0b carry=%0b",
                     vif.a, vif.b, vif.cin, vif.sum, vif.carry);
        end
    endtask
endclass
