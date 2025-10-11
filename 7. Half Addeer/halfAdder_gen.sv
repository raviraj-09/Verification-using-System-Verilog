
class generator;
    rand bit a, b;
    mailbox drv_mbx;

    function new(mailbox drv_mbx);
        this.drv_mbx = drv_mbx;
    endfunction

    task run(int num);
        repeat(num) begin
            assert(this.randomize());
            drv_mbx.put({a, b});
           // $display("[GEN] Generated: a=%0b b=%0b", a, b);
        end
    endtask
endclass

