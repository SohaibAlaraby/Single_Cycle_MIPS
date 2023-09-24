module Data_Memory_tb ();
reg clk=0;
reg WE;
reg [31:0] A,WD;
wire [31:0] RD;
wire [15:0] test_value;
integer i;
Data_Memory f(
    .A(A),
    .WE(WE),
    .clk(clk),
    .WD(WD),
    .RD(RD),
    .test_value(test_value)
);
always begin
  #5; clk= ~clk;
end
initial begin
WE=1'b1;
A=32'b0;
WD=32'd1;
for (i =0 ;i<35 ;i=i+1 ) begin
  #10 
  A= A + 1;
  WD=WD+1;
end
#1
WE=1'b0;
A=32'b0;
for (i =0 ;i<33 ;i=i+1 ) begin
  #10 
  A= A + 1;
end
#11
WE=1'b1;
A=32'd35;
WD=WD+1;

  
  
end
endmodule
