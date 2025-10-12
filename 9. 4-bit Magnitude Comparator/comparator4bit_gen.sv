

import comp_pkg::*;

class generator;
    rand transaction tr;
    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        repeat (10) begin
            tr = new();
            assert(tr.randomize());
            tr.display("GEN");
            gen2drv.put(tr);
        end
    endtask
endclass

