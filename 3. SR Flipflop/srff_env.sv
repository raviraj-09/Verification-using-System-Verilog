
`include "srff_gen.sv";
`include "srff_drv.sv";
`include "srff_mon.sv";
`include "srff_sb.sv";

class srff_env;
    srff_gen gen;
    srff_drv drv;
    srff_mon mon;
    srff_sb sb;

    mailbox gen2drv;
    mailbox mon2sb;
    virtual srff_if vif;

    function new(virtual srff_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2sb = new();
        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2sb);
        sb  = new(mon2sb);
    endfunction

    task run();
        fork
            gen.run(30);
            drv.run();
            mon.run();
            sb.run();
        join_any
    endtask
endclass
