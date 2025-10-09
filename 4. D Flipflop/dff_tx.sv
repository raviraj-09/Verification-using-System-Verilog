// Transaction

package dff_pkg;
class dff_txn;
    rand logic d;
    logic q_exp;

    function void display(string tag);
        $display("[%0s] D=%0b | Expected Q=%0b", tag, d, q_exp);
    endfunction
endclass

endpackage