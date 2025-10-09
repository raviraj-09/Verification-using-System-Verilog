// Environment

`include "tff_generator.sv";
`include "tff_driver.sv";
`include "tff_monitor.sv";
`include "tff_scoreboard.sv";

class tff_env;
    tff_gen        gen;
    tff_driver     drv;
    tff_monitor    mon;
    tff_scoreboard scb;

    mailbox gen2drv, mon2scb;
    virtual tff_if vif;

    function new(virtual tff_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2scb = new();
        gen = new(gen2drv, vif);
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

