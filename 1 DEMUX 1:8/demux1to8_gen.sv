// Generator class for Demux

import demux1to8_pkg::*;

class demux_generator;
    rand demux_transaction trans;
    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        repeat (10) begin
            trans = new();
            assert(trans.randomize());
            gen2drv.put(trans);
            trans.display("GEN");
        end
    endtask
endclass

