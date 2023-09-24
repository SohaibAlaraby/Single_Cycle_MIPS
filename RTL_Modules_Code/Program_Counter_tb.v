module Program_Counter_tb ();
localparam N=4;
reg clk=0;
reg reset_n;
reg [N-1:0] PC_dash;
wire [N-1 : 0] PC;
localparam half_clk =10 ;
Program_Counter #(.N_bit(N)) go (
  .clk(clk),
  .reset_n(reset_n),
  .PC(PC),
  .PC_dash(PC_dash)
);
always begin
  #half_clk; clk= ~clk;
end
initial begin
  reset_n=0;
  #7
  reset_n=1;
  PC_dash='b0001;
  #50
  reset_n=0;
  #17
  reset_n=1;
  PC_dash='b0010;
  #17
  PC_dash=PC_dash+2;
end
endmodule
