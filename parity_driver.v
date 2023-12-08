module parity_driver;

	/*reg clk;
	wire busy;
	reg start;
	wire [7:0] sw_in;
	wire [7:0] seq_num;
	wire [7:0] num;*/

    reg clk;
    wire busy;
    reg start;
    wire [7:0] data_in;
    wire even_parity;
    wire odd_parity;
	
	// Generate the Stimulus 
    parity_stim stim(data_in);
	
	// Test the circuit using the stimulus 
    parity p0(clk, start, data_in, even_parity, odd_parity, busy);

	always #5 clk = ~clk;

	initial begin
		start = 1;
		clk = 0;
		       
		#10;
		start = 0;
		        
		#10;
		start = 1;
		     
		#10;
		start = 0;
		      
		#10;
		start = 1;
		      
		#10;
		while (busy)
			#10;
			start = ~start;
		#10;
		//$monitor ("@ time=%d clk=%b, start=%b, sw_in=%b, seq_num=%b, num=%b, busy=%b", $time, clk, start, sw_in, seq_num, num, busy);
        $monitor ("@ time=%d clk=%b, start=%b, data_in=%b, even_parity=%b, odd_parity=%b, busy=%b", $time, clk, start, data_in, even_parity, odd_parity, busy);
		$stop;
   end
endmodule
