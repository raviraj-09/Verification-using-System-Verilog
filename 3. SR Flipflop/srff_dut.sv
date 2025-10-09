

module srff (
    input  logic clk,
    input  logic rstn,
    input  logic s,
    input  logic r,
    output logic q
);

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn)
            q <= 0;
        else begin
            case ({s, r})
                2'b00: q <= q;      // Hold
                2'b01: q <= 0;      // Reset
                2'b10: q <= 1;      // Set
                2'b11: q <= 1'bx;     // invalid
            endcase
        end
    end
endmodule
