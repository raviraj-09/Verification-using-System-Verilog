
module comparator (
    input  logic [3:0] A,
    input  logic [3:0] B,
    output logic A_gt_B,
    output logic A_lt_B,
    output logic A_eq_B
);
    always_comb begin
        A_gt_B = (A > B);
        A_lt_B = (A < B);
        A_eq_B = (A == B);
    end
endmodule
