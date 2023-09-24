module Adder #(
parameter N_bit=32
) (
  input [N_bit-1 : 0] A,B,
  output [N_bit-1 : 0] result

);
assign result=A+B;
endmodule 
