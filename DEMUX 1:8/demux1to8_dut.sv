// DUT for Demux 8:1


module demux_1to8 (
    input  logic        din,
    input  logic  [2:0] sel,
    output logic  [7:0] dout
);
    always_comb begin
        dout = 8'b0;
        dout[sel] = din;
    end
endmodule
