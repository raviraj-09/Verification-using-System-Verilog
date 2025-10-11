
class driver;
    virtual half_adder_if vif;
    mailbox drv_mbx;

    function new(virtual half_adder_if vif, mailbox drv_mbx);
        this.vif = vif;
        this.drv_mbx = drv_mbx;
    endfunction

    task run();
        bit [1:0] data;
        forever begin
            drv_mbx.get(data);
            vif.a = data[1];
            vif.b = data[0];
            #5;
           // $display("[DRV] Driving: a=%0b b=%0b", vif.a, vif.b);
        end
    endtask
endclass
