// scoreboard

import demux1to8_pkg::*;

class demux_scoreboard;
    mailbox mon2sb;

    function new(mailbox mon2sb);
        this.mon2sb = mon2sb;
    endfunction

    task run();
        demux_transaction tr;
        bit [7:0] expected;
        forever begin
            mon2sb.get(tr);
            expected = 8'b0;
            expected[tr.sel] = tr.din;
            if (expected !== tr.dout)
                $display("[SB][FAIL] SEL=%0d DIN=%0b Expected=%0b Got=%0b",
                         tr.sel, tr.din, expected, tr.dout);
            else
                $display("[SB][PASS] SEL=%0d DIN=%0b DOUT=%0b",
                         tr.sel, tr.din, tr.dout);
        end
    endtask
endclass

