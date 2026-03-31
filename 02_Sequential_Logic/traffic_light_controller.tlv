\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;

   |traffic
      @1
         // A simple timer that rolls over at 10
         $timer[3:0] = $reset ? 4'b0 :
                       (>>1$timer == 4'd10) ? 4'b0 :
                       >>1$timer + 1'b1;
         
         // State Machine: 00=Green, 01=Yellow, 10=Red
         $state[1:0] = $reset ? 2'b00 :
                       (>>1$state == 2'b00 && $timer == 4'd5) ? 2'b01 : 
                       (>>1$state == 2'b01 && $timer == 4'd7) ? 2'b10 : 
                       (>>1$state == 2'b10 && $timer == 4'd10)? 2'b00 : 
                       >>1$state;
         
         // Output decoding
         $green = ($state == 2'b00);
         $yellow = ($state == 2'b01);
         $red = ($state == 2'b10);

   *passed = *cyc_cnt > 40;
\SV
   endmodule
