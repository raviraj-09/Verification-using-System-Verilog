// top module
`include "mux8to1_env.sv"

module tb_top;
    mux_if vif();
    mux8to1 dut (.d(vif.d), .sel(vif.sel), .y(vif.y));

    environment env;

    initial begin
        env = new(vif);
        env.run();
        #500;
        $finish;
    end
endmodule
