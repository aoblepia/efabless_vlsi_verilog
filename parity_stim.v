module parity_stim (
    output reg [7:0] data_in
);


   parameter delay = 300;
   reg [3:0] count;


   initial begin
      count = 0;
      repeat (4) begin
         case (count)
            4'b0000: begin
                  data_in <= 8'b11111101;
            end


            4'b0001: begin
                  data_in <= 8'b00011100;
            end


            4'b0010: begin
                  data_in <= 8'b01000100;
            end


            4'b0011: begin
                  data_in <= 8'b11111111;
            end


            4'b0100: begin
                  $stop;
            end
         endcase
         #delay count=count+1;
      end
   end


endmodule
