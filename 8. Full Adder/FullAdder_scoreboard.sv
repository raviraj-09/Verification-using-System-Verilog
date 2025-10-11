
class scoreboard;
    mailbox mon_mbx;

    function new(mailbox mon_mbx);
        this.mon_mbx = mon_mbx;
    endfunction

    task run();
        bit [4:0] data;
        bit a, b, cin, sum, carry;
        bit exp_sum, exp_carry;

        forever begin
            mon_mbx.get(data);
            {a, b, cin, sum, carry} = data;

            exp_sum   = a ^ b ^ cin;
            exp_carry = (a & b) | (b & cin) | (a & cin);

            if (sum == exp_sum && carry == exp_carry)
                $display("[SCO] PASS: a=%0b b=%0b cin=%0b sum=%0b carry=%0b",
                          a, b, cin, sum, carry);
            else
                $display("[SCO] FAIL: a=%0b b=%0b cin=%0b exp_sum=%0b exp_carry=%0b",
                          a, b, cin, sum, carry, exp_sum, exp_carry);
        end
    endtask
endclass
