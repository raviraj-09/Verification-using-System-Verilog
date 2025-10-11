
`include"halfAdder_env.sv";

class test;
    environment env;
    virtual half_adder_if vif;

    function new(virtual half_adder_if vif);
        this.vif = vif;
        env = new(vif);
    endfunction

    task run();
        env.run();
        #50;
        $finish;
    endtask
endclass
