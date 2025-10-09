// DUT

module dff (
    input  logic clk,
    input  logic rstn,   // active low reset
    input  logic d,
    output logic q
);
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn)
            q <= 0;
        else
            q <= d;
    end
endmodule

