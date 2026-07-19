//********************************************
// (c) SION Semiconductors (P) Ltd, Bangalore
// All rights reserved.
//********************************************
// Filename    : 10_Conditional_Constraint.sv
// Description : Demonstration of Conditional Constraints
//********************************************

class Conditional_Constraint;
    
randc bit [1:0] addr_range;
randc int       addr;

function print();
 $display ("addr_range=%d,addr=%d",addr_range,addr);
 endfunction
 
// Conditional Constraints
constraint limit{
  if (addr_range==0) addr inside {[0:100]};
  if (addr_range==1) addr inside {[101:1000]};
  if (addr_range==2) addr inside {[1001:10000]};
 }
endclass

// Top level program file
program CondConstraint;

Conditional_Constraint obj;

initial begin 
  obj=new();
  repeat(5) begin
  obj.randomize();
  obj.print();
  end 
end

endprogram
