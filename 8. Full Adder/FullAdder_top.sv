
`include "FullAdder_tb.sv"

module full_adder_top_tb;
    full_adder_if intf();
    full_adder dut (
        .a(intf.a),
        .b(intf.b),
        .cin(intf.cin),
        .sum(intf.sum),
        .carry(intf.carry)
    );

    test t;

    initial begin
        t = new(intf);
        t.run();
    end
endmodule
