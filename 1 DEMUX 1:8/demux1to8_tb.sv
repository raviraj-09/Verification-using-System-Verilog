// Testbench for  Demux 1:8

`include "demux1to8_env.sv"

class demux_test;
    demux_env env;
    virtual demux_if vif;

    function new(virtual demux_if vif);
        this.vif = vif;
        env = new(vif);
    endfunction

    task run();
        env.run();
    endtask
endclass

