
class scoreboard;
    mailbox mon_mbx;

    function new(mailbox mon_mbx);
        this.mon_mbx = mon_mbx;
    endfunction

    task run();
        bit [3:0] data;
        bit a, b, exp_sum, exp_carry;
        forever begin
            mon_mbx.get(data);
            {a, b, exp_sum, exp_carry} = data;

            exp_sum   = a ^ b;
            exp_carry = a & b;

            if (exp_sum == data[1] && exp_carry == data[0])
                $display("[SCO] PASS: a=%0b b=%0b sum=%0b carry=%0b",
                          a, b, exp_sum, exp_carry);
            else
                $display("[SCO] FAIL: a=%0b b=%0b exp_sum=%0b exp_carry=%0b",
                          a, b, exp_sum, exp_carry);
        end
    endtask
endclass
