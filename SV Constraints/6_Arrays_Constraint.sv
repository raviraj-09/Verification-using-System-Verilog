

class ArrayConst;

 rand int f;
      int fib[5] = '{1,2,3,5,8};

 // Initialize constraint for Array
 constraint c_fibonacci {
  f inside fib;
 }

endclass


program Array_Const;

ArrayConst pkt;

initial begin

  // Creating object	 
  pkt=new();
  
  // Assert Based Randomization 
  for(int i=0;i<5;i++) begin
    assert(pkt.randomize())
    $display("%d",pkt.f);
  end

end

endprogram



