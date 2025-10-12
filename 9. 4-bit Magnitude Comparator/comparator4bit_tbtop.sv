
`include "comparator4bit_env.sv";

module comparator_top_tb;
    comp_if cif();
    comparator dut (.A(cif.A), .B(cif.B), 
                    .A_gt_B(cif.A_gt_B), 
                    .A_lt_B(cif.A_lt_B), 
                    .A_eq_B(cif.A_eq_B));

    environment env;

    initial begin
        cif.A = 0;
        cif.B = 0;
        #5; // let interface signals settle
        env = new(cif);
        env.run();
        #200;
        $finish;
    end
endmodule

