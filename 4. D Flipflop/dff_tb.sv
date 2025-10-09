// Testbench  --  Top Module

`include "dff_env.sv"

module dff_tb;
    logic clk;
    always #5 clk = ~clk;

    dff_if intf(clk);
    dff dut (.clk(clk), .rstn(intf.rstn), .d(intf.d), .q(intf.q));

    dff_env env;

    initial begin
        clk = 0;
        env = new(intf);
        env.run();
        #200 $finish;
    end
endmodule

