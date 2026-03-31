\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   $reset = *reset;

   |filter
      @1
         $data_in[7:0] = *cyc_cnt[7:0];

         $tap1[7:0] = $reset ? 8'b0 : >>1$data_in;
         $tap2[7:0] = $reset ? 8'b0 : >>1$tap1;
         $tap3[7:0] = $reset ? 8'b0 : >>1$tap2;
         $tap4[7:0] = $reset ? 8'b0 : >>1$tap3;

         $sum[9:0] = $tap1 + $tap2 + $tap3 + $tap4;
         
         $avg_out[7:0] = $sum[9:2];

   *passed = *cyc_cnt > 40;
\SV
   endmodule
