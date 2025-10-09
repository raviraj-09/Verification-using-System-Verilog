// Transaction

package srff_pkg;

class srff_txn;
    rand bit s;
    rand bit r;
    bit q_exp;  // expected output

    function void display(string tag);
        $display("[%s] S=%0b R=%0b | Expected_Q=%0b", tag, s, r, q_exp);
    endfunction
endclass

endpackage
