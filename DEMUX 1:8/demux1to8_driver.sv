// Driver class

import demux1to8_pkg::*;

class demux_driver;
    virtual demux_if vif;
    mailbox gen2drv;

    function new(virtual demux_if vif, mailbox gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task run();
        demux_transaction tr;
        forever begin
            gen2drv.get(tr);
            vif.din = tr.din;
            vif.sel = tr.sel;
            @(posedge vif.clk);
        end
    endtask
endclass
