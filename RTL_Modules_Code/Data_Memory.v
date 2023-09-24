module Data_Memory (
  input clk,WE,
  input [31:0] A,WD,
  output reg [31:0] RD,
  output [15:0] test_value
);
reg [31:0] RAM [255:0];
integer i;
initial begin
  RD='b0;
  for ( i=0 ;i<256 ;i=i+1 ) begin
    RAM[i] = 32'b0;
  end
end
always @(posedge clk) begin
  if (WE) begin
    RAM[A] <= WD;
  end else begin
    RAM[A]<=RAM[A];
  end

end
always @(*)begin
  if(~WE)begin
    RD <= RAM[A];
  end else begin
    RD <= RD;
  end

end
assign test_value=RD[15:0];
endmodule
