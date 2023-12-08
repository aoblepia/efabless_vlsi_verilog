module parity_stim (
    /*output reg [7:0] sw_in,
    output reg [7:0] seq_num*/

    output reg [7:0] data_in
);

   parameter delay = 100;
   reg [3:0] count;

   initial begin
      count = 0;
      repeat (4) begin
         case (count)
            4'b0000: begin
                  /*seq_num <= 8'b00000001;
                  sw_in <= 8'b00000011;*/
                  data_in <= 8'b00000100;
            end

            4'b0001: begin
                  /*seq_num <= 8'b00000011;
                  sw_in <= 8'b00010001;*/
                  data_in <= 8'b10111101;
            end

            4'b0010: begin
                  /*seq_num <= 8'b00010001;
                  sw_in <= 8'b00110000;*/
                  data_in <= 8'b01100100;
            end

            4'b0011: begin
                  /*seq_num <= 8'b00110000;
                  sw_in <= 8'b00100001;*/
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
