// Monitor class

import demux1to8_pkg::*;

class demux_monitor;
    virtual demux_if vif;
    mailbox mon2sb;

    function new(virtual demux_if vif, mailbox mon2sb);
        this.vif = vif;
        this.mon2sb = mon2sb;
    endfunction

    task run();
        demux_transaction tr;
        forever begin 
            @(negedge vif.clk); // sample after driver
            tr = new();
            tr.din = vif.din;
            tr.sel = vif.sel;
            tr.dout = vif.dout;
            mon2sb.put(tr);
            tr.display("MON");
        end
    endtask
endclass

