//********************************************
// (c) SION Semiconductors (P) Ltd, Bangalore
// All rights reserved.
//********************************************
// Filename    : 1_Basic_Randomization.sv
// Description : Declare Random Varable using rand
//               Randomize whole object using .randomize()
//********************************************

class Basic_Rand ;
  
// Declaration of rand properties
randc bit [3:0] Address;
randc int Data;
      int Z;

// Write a method to print variables
function void print ();
  $display ("Address=%d,Data=%d,Z=%d",Address,Data,Z);
endfunction 

endclass

program test;

// Declaring object handle	
Basic_Rand obj; 

initial 
begin 
  obj=new();
  repeat(20) begin
    void'(obj.randomize()); // Apply randomization to object
    obj.print();
  end 
end

endprogram
