module Register_File_tb ();
reg [4:0] A1,A2,A3;
reg WE3;
reg clk=0;
reg [31:0] WD3;
wire [31:0] RD1,RD2;
integer i;
Register_File f(
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WE3(WE3),
    .clk(clk),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2)
);
always begin
  #5; clk= ~clk;
end
initial begin
  WE3=1'b1;
  A1=5'b0;
  A2=5'b0;
  A3=5'b0;
  WD3=32'd1;
  
  for ( i=0 ;i<16 ;i=i+1 ) begin
    #11
    A3=A3+1;
    WD3=WD3+1;
    A1=A3;
    A2=A3;
  end
  
  
end
endmodule
