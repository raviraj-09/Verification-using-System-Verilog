/// This SystemVerilog cpde will generate 6 digit OTP

class OTP;
rand int sixDigitOTP;

constraint sixDigit{
	sixDigitOTP inside{[100000 : 999999]};
}

function void displayOTP();
	if(!this.randomize())
	    $display("Randomization Failed...");
	else
	    $display("%0d is your OTP to access your account. OTP is confidential and valid for 2 minutes. DO NOT share this OTP with anyone.",sixDigitOTP );
endfunction
endclass

module otp_tb;
OTP obj;
	initial begin
	  obj = new();
	  repeat(6) begin
	    obj.displayOTP();
	 //   #60;
	 //   $display("Waiting for %0t second to next OTP",$realtime());
	  end
	end
endmodule




