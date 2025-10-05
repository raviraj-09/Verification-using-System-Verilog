// Environment 

`include "demux1to8_gen.sv"
`include "demux1to8_driver.sv"
`include "demux1to8_monitor.sv"
`include "demux1to8_scoreboard.sv"

class demux_env;
    demux_generator gen;
    demux_driver drv;
    demux_monitor mon;
    demux_scoreboard sb;

    mailbox gen2drv, mon2sb;
    virtual demux_if vif;

    function new(virtual demux_if vif);
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
        join_any
    endtask
endclass

