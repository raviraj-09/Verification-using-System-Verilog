//********************************************
// (c) SION Semiconductors (P) Ltd, Bangalore
// All rights reserved.
//********************************************
// Filename    : 5_Weighted_Constraint_Rand.sv
// Description : Distribute elements specific rand
//               By using dist keyword
//********************************************

program Dist_rand;

  class frame;
    rand bit [7:0] Address;
    rand bit [7:0] Data;
    rand bit [15:0] MEM;
    
    // Initializing Value for specific rang of MEM
    constraint len {
      MEM dist {
        [64  :  127 ] := 10,
        [128 :  511 ] := 10,
        [512 :  2048] := 10
      };
    }
    
    // Initializing Value for specific rang of Adress
    constraint Adres {
      Address dist {
        0  := 1,
        1  := 1,
        2  := 5,
        4  := 1
      };
    }
    
    // Initializing Value for specific rang of data
    constraint DATA {
      Data dist {
        [0   : 5   ] :/ 5,
        [6   : 100 ] := 1,
        [101 : 200 ] := 1,
        [201 : 255 ] := 1
      };
    }

    function void post_randomize();
      begin
        $display("Addres : %0x",Address);
        $display("Data : %0b"  ,Data);
        $display("MEM   : %0d" ,MEM);
      end
    endfunction

  endclass

  initial begin
    frame obj = new();
    integer i,j = 0;
   
   // Reprat execution 4 times using for loop
    for (j=0;j < 4; j++) begin
      i = obj.randomize();
    end
  end

endprogram
