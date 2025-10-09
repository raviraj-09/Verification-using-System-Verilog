// Top +test


`include "jkff_env.sv"

module jkff_tb;
    logic clk;
    jkff_if vif(clk);

    jkff DUT (
        .clk(clk),
        .rstn(vif.rstn),
        .j(vif.j),
        .k(vif.k),
        .q(vif.q)
    );

    jkff_env env;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset
    initial begin
        vif.rstn = 0;
        #12;
        vif.rstn = 1;
    end

    // Run test
    initial begin
        env = new(vif);
        env.run();
#200;
        $finish();
    end
endmodule
