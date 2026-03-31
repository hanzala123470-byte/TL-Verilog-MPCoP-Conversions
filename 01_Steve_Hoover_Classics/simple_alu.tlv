\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;
   
   $op[1:0] = *cyc_cnt[1:0];
   $aa[7:0] = *cyc_cnt[7:0];
   $bb[7:0] = 8'd3;
   
   $out[7:0] = ($op == 2'b00) ? $aa + $bb :
               ($op == 2'b01) ? $aa - $bb :
               ($op == 2'b10) ? $aa * $bb :
                                $aa / $bb;
                                
   *passed = *cyc_cnt > 40;
\SV
   endmodule
