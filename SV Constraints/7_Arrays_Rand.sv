//********************************************
// (c) SION Semiconductors (P) Ltd, Bangalore
// All rights reserved.
//********************************************
// Filename    : 7_Arrays_Rand.sv
// Description : Randomization with Arrays
//********************************************

class Arrays_Rand;

randc bit [15:0] index;    // Index into array
      int        array[];  // Values to choose

// Construct & initialize
function new(int a[]); 
  array = a;
endfunction

// Return most recent pick
function int pick; 
  return array[index];
endfunction

// Constrain index of array using .size()
constraint c_size {index < array.size();}

endclass

// Top level program block
program ArraysRand;

Arrays_Rand pkt;

initial begin
  pkt = new('{1,3,5,7,9,11,13});// Initialize Elements
  repeat (pkt.array.size()) begin
   assert(pkt.randomize());
   $display("Picked %d [%0d]", pkt.pick(), pkt.index);
  end
end

endprogram
