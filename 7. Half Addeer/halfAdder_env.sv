
`include"halfAdder_gen.sv";
`include"halfAdder_driver.sv";
`include"halfAdder_monitor.sv";
`include"halfAdder_scoreboard.sv";

class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sco;

    mailbox drv_mbx, mon_mbx;
    virtual half_adder_if vif;

    function new(virtual half_adder_if vif);
        this.vif = vif;
        drv_mbx = new();
        mon_mbx = new();

        gen = new(drv_mbx);
        drv = new(vif, drv_mbx);
        mon = new(vif, mon_mbx);
        sco = new(mon_mbx);
    endfunction

    task run();
        fork
           
            drv.run();
            mon.run();
            sco.run();
        join_none
 	gen.run(10);
	#20;
    endtask
endclass
