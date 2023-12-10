module parity_driver;
   
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
               
        #150;
        start = 0;
               
        #150;
        start = 1;
             
        #150;
        start = 0;
             
        #150;
        start = 1;


        #150;
        start = 0;


        #150;
        start = 1;


        #150;
        start = 0;
             
        #10;
        while (busy)
            #10;
            start = ~start;
        #10;
                $monitor ("@ time=%d clk=%b, start=%b, data_in=%b, even_parity=%b, odd_parity=%b, busy=%b", $time, clk, start, data_in, even_parity, odd_parity, busy);
        $stop;
   end
endmodule
