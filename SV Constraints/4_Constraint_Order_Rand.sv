

program Constraint_Order_Rand;

class Order_Rand;

  rand bit [4:0] lo, med, hi;

  // Declare Order of Randomization Low to High
  constraint good {lo < med; med < hi;}

  function void print();
   $display("low=%d,medium=%d,high=%d",lo,med,hi);
  endfunction

endclass


Order_Rand pkt;

initial begin
  pkt=new();
  repeat(10)
  begin
   // randomize using assert
   assert(pkt.randomize())
   pkt.print();
  end
end

endprogram
