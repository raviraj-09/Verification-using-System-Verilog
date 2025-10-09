// Testbench + Top Module

`include "tff_env.sv"

module tff_tb;
    logic clk;
    always #5 clk = ~clk;

    tff_if intf(clk);
    tff dut (.clk(clk), .rstn(intf.rstn), .t(intf.t), .q(intf.q));

    tff_env env;

    initial begin
        clk = 0;
        env = new(intf);
        env.run();
        #200 $finish;
    end

    initial begin
        $dumpfile("tff_tb.vcd");
        $dumpvars(0, tff_tb);
    end
endmodule
