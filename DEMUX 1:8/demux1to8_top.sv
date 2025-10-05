// Top module

//`include "demux1to8_env.sv"
`include "demux1to8_tb.sv"
module top;
    logic clk;
    demux_if demux_if_inst(clk);
    demux_1to8 dut (.din(demux_if_inst.din),
                    .sel(demux_if_inst.sel),
                    .dout(demux_if_inst.dout));

    demux_test t1;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
	demux_if_inst.din = 0;
        demux_if_inst.sel = 0;
        repeat (2) @(posedge clk); // allow stabilization
        t1 = new(demux_if_inst);
        t1.run();
        #100 $finish;
    end
endmodule

