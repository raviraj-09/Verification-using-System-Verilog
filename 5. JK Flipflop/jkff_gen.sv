// generator 

import jkff_pkg::*;

class jkff_gen;
    jkff_txn txn;
    mailbox gen2drv;

    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run(int num = 10);
        for (int i = 0; i < num; i++) begin
            txn = new();
            assert(txn.randomize());
            gen2drv.put(txn);
          //  txn.display("GEN");
	//$display("%h",i);
        end
    endtask
endclass
