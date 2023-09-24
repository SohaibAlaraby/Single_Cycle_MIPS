module Mux2to1 #(
parameter N_bit=4
) (
  input [N_bit-1 : 0] A,B,
  input sel,
  output [N_bit-1 : 0] result


);
assign result = sel? B:A ;
endmodule 
