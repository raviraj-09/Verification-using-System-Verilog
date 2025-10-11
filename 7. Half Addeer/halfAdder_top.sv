
`include "halfAdder_tb.sv"

module halfAdder_top_tb;
    half_adder_if intf();
    half_adder dut(.a(intf.a), .b(intf.b), .sum(intf.sum), .carry(intf.carry));

    test t;

    initial begin
        t = new(intf);
        t.run();
    end
endmodule
