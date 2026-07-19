


program Rand_Distribute;

  class Dist_Constraint;
    rand bit [7:0] A;
    rand bit [7:0] B;
    rand bit [7:0] C[];
    //Distribute over a specific range 
    constraint c {            
         A inside { [3:7], 10,15 }; // inclusive
       !(B inside { [10:15] });     // exclusive
        (C.size() inside {[2:4]});
    }
    
    function void pre_randomize(); //pre_randomize(); 
      begin
        $display("A : %0d",A);
        $display("B : %0x",B);
        $display("C : %0x",C);
      end
    endfunction
 
  endclass

  initial begin
    Dist_Constraint obj= new();
    repeat(10) begin
      obj.randomize(); // Randomize whole object
      $display("Object values: %p", obj);
    end   
  end

endprogram
