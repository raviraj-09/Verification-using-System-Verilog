
// Class definition
class Const_Rand ;

// Declaration of rand properties
randc bit [7:0] Address;
rand  int       Data;
      int       Z;

// Defining constraints
constraint adr_c  { (Address inside {5,6,[100:150]});}
constraint data_c {Data > 50; Data< 250;}

// Write a method to print variables
function void print ();
  $display ("Address=%d,Data=%d,Z=%d",Address,Data,Z);
endfunction 

endclass

// Program block 
program Basic_Constraints;

Const_Rand obj;

initial 
begin 
  obj=new();
  repeat(10) begin
    // Apply Randomization to object using assert
    assert (obj.randomize()); 
    obj.print();
  end
end 

endprogram
