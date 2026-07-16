// transaction class for Demux 1:8

package demux1to8_pkg;
class demux_transaction;
    rand bit din;
    rand bit [2:0] sel;
    bit [7:0] dout;

    function void display(string tag);
        $display("[%0s] DIN=%0b SEL=%0d DOUT=%0b", tag, din, sel, dout);
    endfunction
endclass
endpackage

