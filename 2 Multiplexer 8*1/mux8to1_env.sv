//Brings everything together.

`include "mux8to1_gen.sv"
`include "mux8to1_driver.sv"
`include "mux8to1_monitor.sv"
`include "mux8to1_scoreboard.sv"

import mux_pkg::*;

class environment;
    generator  gen;
    driver     drv;
    monitor    mon;
    scoreboard scb;

    mailbox gen2drv, mon2scb;
    virtual mux_if vif;

    function new(virtual mux_if vif);
        this.vif = vif;
        gen2drv = new();
        mon2scb = new();

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(vif, mon2scb);
    endfunction

    task run();
        fork
            gen.run(30);  // generate 30 transactions
            drv.run();
            mon.run();
            scb.run();
        join_none
    endtask
endclass
