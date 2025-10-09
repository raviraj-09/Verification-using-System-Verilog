// Transaction

package jkff_pkg;
// jkff_txn.sv
class jkff_txn;
    rand bit j;
    rand bit k;
    bit q_exp;  // expected output

    function void display(string tag);
        $display("[%s] J=%0b K=%0b | Expected_Q=%0b", tag, j, k, q_exp);
    endfunction
endclass

endpackage
