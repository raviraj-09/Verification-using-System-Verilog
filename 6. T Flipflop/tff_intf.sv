// Interface

interface tff_if(input logic clk);
    logic rstn;
    logic t;
    logic q;

    clocking drv_cb @(posedge clk);
        output t, rstn;
    endclocking

    clocking mon_cb @(posedge clk);
        input t, q, rstn;
    endclocking
endinterface

