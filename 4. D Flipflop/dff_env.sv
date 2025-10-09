// Environment

`include "dff_gen.sv";
`include "dff_drv.sv";
`include "dff_mon.sv";
`include "dff_srb.sv";

class dff_env;
    dff_gen       gen;
    dff_driver    drv;
    dff_monitor   mon;
    dff_scoreboard scb;

    mailbox gen2drv, mon2scb;
    virtual dff_if vif;

    function new(virtual dff_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2scb = new();
        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb);
    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            scb.run();
        join_any
    endtask
endclass

