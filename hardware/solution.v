`timescale 1ns / 1ps
`include "iob_lib.vh"

module circuit
  #(
    parameter W=32
    )
  (
   `INPUT(rst,1),
   `INPUT(clk,1),
   `INPUT(en,1),
   `OUTPUT(y,W)
   );

   `SIGNAL(cnt, 7) //7-bit counter as iterator
   
   `SIGNAL(y_int, W) //internal y
   `SIGNAL(y_atual, W) //y_atual
   `SIGNAL(y_next, W) //y_next
   `SIGNAL2OUT(y, y_int) //connect internal y to output

   //y shift register 
   `REG_ARE(clk, rst, 1'b0, cnt!=99, y_atual, y_int)
   `REG_ARE(clk, rst, 1'b0, cnt!=99, y_next, $random)

   //iteration counter
   `COUNTER_ARE(clk, rst, cnt!=99, cnt)

   //compute next why
   `MUX(y_atual > y_next, y_int, y_atual & y_next) // `COMB OUT = IN[y-next]
   
   
endmodule
