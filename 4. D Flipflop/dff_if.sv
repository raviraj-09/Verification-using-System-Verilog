// Interface

interface dff_if(input logic clk);
    logic rstn;
    logic d;
    logic q;

    // Clocking block for driver
    clocking drv_cb @(posedge clk);
        output d, rstn;
    endclocking

    // Clocking block for monitor
    clocking mon_cb @(posedge clk);
        input d, q, rstn;
    endclocking
endinterface
