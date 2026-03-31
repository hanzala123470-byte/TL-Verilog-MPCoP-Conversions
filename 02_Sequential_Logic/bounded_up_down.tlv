\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   |counter
      @1
         $up_down = *cyc_cnt[4]; 
         $valid = $reset || *cyc_cnt[0]; 
         
         $max[3:0] = 4'd10;
         $min[3:0] = 4'd0;
         
         ?$valid
            $cnt[3:0] = $reset ? 4'b0 :
                        ($up_down && (>>1$cnt < $max)) ? >>1$cnt + 4'b1 :
                        (!$up_down && (>>1$cnt > $min)) ? >>1$cnt - 4'b1 :
                        >>1$cnt;
                  
   *passed = *cyc_cnt > 40;
\SV
   endmodule
