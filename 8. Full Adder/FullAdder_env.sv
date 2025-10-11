
`include"FullAdder_gen.sv";
`include"FullAdder_driver.sv";
`include"FullAdder_monitor.sv";
`include"FullAdder_scoreboard.sv";

class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sco;

    mailbox drv_mbx, mon_mbx;
    virtual full_adder_if vif;

    function new(virtual full_adder_if vif);
        this.vif = vif;
        drv_mbx = new();
        mon_mbx = new();

        gen = new(drv_mbx);
        drv = new(vif, drv_mbx);
        mon = new(vif, mon_mbx);
        sco = new(mon_mbx);
    endfunction

    task run(int num = 10);
        fork
            drv.run();
            mon.run();
            sco.run();
        join_none

        gen.run(num);
        #20; // give time for last transactions to complete
    endtask
endclass
