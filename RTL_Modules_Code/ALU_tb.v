module ALU_tb ();
  localparam N=4;
  reg [N-1:0] A,B;
  reg [2:0] ALUControl;
  wire [N-1:0] result;
  wire Zero;

ALU #(.N_bit(N)) go (
  .SrcA(A),
  .SrcB(B),
  .ALUResult(result),
  .ALUControl(ALUControl),
  .Zero(Zero)
);
initial begin
  A='b1010;
  B='b0101;
  ALUControl='b001;
  #10
  A='b1010;
  B='b0101;
  ALUControl='b000;
  #10
  A='b0010;
  B='b0101;
  ALUControl='b010;
  #10
  A='b0010;
  B='b0101;
  ALUControl='b011;
  #10
  A='b0011;
  B='b0011;
  ALUControl='b101;
  #10
  A='b0010;
  B='b0101;
  ALUControl='b101;
  #10
  A='b0010;
  B='b0101;
  ALUControl='b110;
  #10
  A='b0010;
  B='b0001;
  ALUControl='b110;
  #10
  A='b0010;
  B='b0010;
  ALUControl='b110;
  #10
  A='b0010;
  B='b0101;
  ALUControl='b111;
end
endmodule
