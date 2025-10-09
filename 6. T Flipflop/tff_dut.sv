// T FF DUT

module tff (
    input  logic clk,
    input  logic rstn,   // Active low reset
    input  logic t,
    output logic q
);
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn)
            q <= 0;      // Reset initializes Q to 0
        else if (t)
            q <= ~q;     // Toggle
        else
            q <= q;      // Hold
    end
endmodule


