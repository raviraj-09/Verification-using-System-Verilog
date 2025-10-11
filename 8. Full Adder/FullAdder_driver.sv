
class driver;
    virtual full_adder_if vif;
    mailbox drv_mbx;

    function new(virtual full_adder_if vif, mailbox drv_mbx);
        this.vif = vif;
        this.drv_mbx = drv_mbx;
    endfunction

    task run();
        bit [2:0] data;
        forever begin
            drv_mbx.get(data);
            vif.a   = data[2];
            vif.b   = data[1];
            vif.cin = data[0];
            #2; // small delay for propagation
            $display("[DRV] Driving: a=%0b b=%0b cin=%0b", vif.a, vif.b, vif.cin);
        end
    endtask
endclass
