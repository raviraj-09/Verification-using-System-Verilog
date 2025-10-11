
`include"FullAdder_env.sv";

class test;
    environment env;
    virtual full_adder_if vif;

    function new(virtual full_adder_if vif);
        this.vif = vif;
        env = new(vif);
    endfunction

    task run();
        env.run(10); // run for 10 random test cases
        #50;
        $finish;
    endtask
endclass
