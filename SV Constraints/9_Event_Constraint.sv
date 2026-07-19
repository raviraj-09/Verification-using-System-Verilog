

class EventConst;

randc bit [1:0]addr_range;
randc int addr;

function print();
 $display ("addr_range=%d,addr=%d",addr_range,addr);
endfunction

// Initialize Emenent range using Event (->) with condition using 
constraint limit{
   (addr_range==0)-> addr inside {[0:100]};
   (addr_range==1)-> addr inside {[101:1000]};
   (addr_range==2)-> addr inside {[1001:10000]};
 }
endclass

// Top level program block
program Event_Cond_Const;

EventConst obj;

initial begin 
  obj=new();
  repeat(5) begin
  obj.randomize();
  obj.print();
  end 
end

endprogram
