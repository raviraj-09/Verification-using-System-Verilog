
class monitor;
    virtual half_adder_if vif;
    mailbox mon_mbx;

    function new(virtual half_adder_if vif, mailbox mon_mbx);
        this.vif = vif;
        this.mon_mbx = mon_mbx;
    endfunction

    task run();
        forever begin
 @(posedge vif.a or posedge vif.b or negedge vif.a or negedge vif.b);
        #1; // small delay to allow DUT to settle
          
            mon_mbx.put({vif.a, vif.b, vif.sum, vif.carry});
            $display("[MON] a=%0b b=%0b sum=%0b carry=%0b",
                     vif.a, vif.b, vif.sum, vif.carry);
        end
    endtask
endclass
