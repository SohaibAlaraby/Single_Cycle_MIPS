module Sign_Extend (
  input [15 : 0] IN,
  output [31 : 0] OUT
);
assign OUT = IN[15]? {~16'b0,IN} : {16'b0,IN};
endmodule 
