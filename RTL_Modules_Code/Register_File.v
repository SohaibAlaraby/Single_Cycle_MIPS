module Register_File (
  input [4:0] A1,A2,A3,
  input WE3,clk,
  input [31:0] WD3,
  output [31:0] RD1,RD2
);
reg [31:0] registers [31:0];
integer i;
initial begin
  for ( i=0 ;i<32 ;i=i+1 ) begin
    registers[i] = 32'b0;
  end
end
always @(posedge clk) begin //I did remove the posedge WD3 as the write must be sync
  
  if (WE3) begin
    registers[A3] <= WD3;
  end else begin
    registers[A3]<=registers[A3];
  end

end
assign RD1=registers[A1];
assign RD2=registers[A2];
  
endmodule
