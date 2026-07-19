
  
program Constraint_Mode;

  class Moderandom;
  rand int a;
  rand int b;
  function  void print ();
    $display ("a=%d,b=%d",a,b);
  endfunction
  
  // Initialize Range of Elements
  constraint limit1 {
                    a inside {[0:100]};
                    b inside {[0:50]};
                  }
  constraint limit2 {a<200;
                      b<100;
                      }
endclass

Moderandom obj;

initial begin

  obj=new();
  // Call the constraint using mode
  obj.limit1.constraint_mode(1);
  obj.randomize(a);
  obj.randomize(b);
  obj.print();
end

endprogram
