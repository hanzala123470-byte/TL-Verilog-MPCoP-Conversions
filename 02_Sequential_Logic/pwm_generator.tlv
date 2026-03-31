\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;

   |pwm
      @1
         // 25% duty cycle (64 out of 256)
         $duty_cycle[7:0] = 8'd64; 
         
         $counter[7:0] = $reset ? 8'b0 : >>1$counter + 1'b1;
         
         // PWM output goes high when counter is less than duty cycle
         $pwm_out = ($counter < $duty_cycle);

   *passed = *cyc_cnt > 40;
\SV
   endmodule
