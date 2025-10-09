
`include "jkff_gen.sv";
`include "jkff_drv.sv";
`include "jkff_mon.sv";
`include "jkff_sb.sv";

class jkff_env;
    jkff_gen gen;
    jkff_drv drv;
    jkff_mon mon;
    jkff_sb sb;

    mailbox gen2drv;
    mailbox mon2sb;
    virtual jkff_if vif;

    function new(virtual jkff_if vif);
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
