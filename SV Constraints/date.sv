
class DateRandom;
rand int date, month;
int year = 2025;

constraint DateMonth {
	date inside {[1:31]};
	month inside {[1:12]};

	if (month == 2)
	    date <= 28;
	else if (month inside {4,6,9,11})
	    date <= 30;
	else
	    date <= 31;
}

function void display();
	if(!this.randomize())
	    $display("Randomization Fail...");
	else
	    $display("DD/MM/YYYY : %2d/%2d/%4d", date, month, year);
endfunction
endclass

module DateRandom_tb;

DateRandom Obj;
    initial begin
      Obj = new();
      repeat(12) begin
        Obj.display();
      end
    end
endmodule





