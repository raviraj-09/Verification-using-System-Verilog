// Holds stimulus (d and sel) and expected result.

package mux_pkg;
class mux_transaction;
    rand bit [7:0] d;
    rand bit [2:0] sel;
         bit       y_exp;   // expected output

    function void post_randomize();
        y_exp = d[sel];  // reference model
    endfunction

    function void display(string tag="");
        $display("[%s] d=%0b sel=%0d exp=%0b", tag, d, sel, y_exp);
    endfunction
endclass
endpackage
