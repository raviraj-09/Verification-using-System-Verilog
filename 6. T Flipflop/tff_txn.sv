// Transaction 

package tff_pkg;
class tff_txn;
    rand logic t;
    logic q_exp;

    function void display(string tag);
        $display("[%0s] T=%0b | Expected Q=%0b", tag, t, q_exp);
    endfunction
endclass
endpackage
