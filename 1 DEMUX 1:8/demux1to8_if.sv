// Interface 

interface demux_if (input logic clk);
    logic        din;
    logic [2:0]  sel;
    logic [7:0]  dout;
endinterface
