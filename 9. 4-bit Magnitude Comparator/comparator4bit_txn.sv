

package comp_pkg;
class transaction;
    rand logic [3:0] A, B;
    logic  A_gt_B, A_lt_B, A_eq_B;

    function void display(string tag);
        $display("[%0s] A=%0d, B=%0d => gt=%0b lt=%0b eq=%0b", 
                  tag, A, B, A_gt_B, A_lt_B, A_eq_B);
    endfunction
endclass
endpackage

