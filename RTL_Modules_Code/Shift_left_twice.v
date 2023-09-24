module Shift_left_twice #(
  parameter N_bit_IN=4, N_bit_OUT=6 //2 parameters for in and out as some cases the out has extera bits more than input
) (
  input [N_bit_IN-1:0] IN,
  output [N_bit_OUT-1:0] OUT
);

assign OUT= IN << 2;
  
endmodule
