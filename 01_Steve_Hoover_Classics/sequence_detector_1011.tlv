\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   $in_bit = *cyc_cnt[0] ^ *cyc_cnt[2]; 
   
   $is_1011 = ($in_bit == 1'b1) && 
              (>>1$in_bit == 1'b1) && 
              (>>2$in_bit == 1'b0) && 
              (>>3$in_bit == 1'b1);
              
   $out = $reset ? 1'b0 : $is_1011;
   
   *passed = *cyc_cnt > 40;
\SV
   endmodule
