
`include "comparator4bit_gen.sv";
`include "comparator4bit_driver.sv";
`include "comparator4bit_monitor.sv";
`include "comparator4bit_scoreboard.sv";

class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sb;

    mailbox gen2drv;
    mailbox mon2sb;

    virtual comp_if vif;

    function new(virtual comp_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2sb  = new();
        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2sb);
        sb  = new(mon2sb);
    endfunction

    task run();
        fork
            gen.run();
            drv.run();
            mon.run();
            sb.run();
        join_none
    endtask
endclass

