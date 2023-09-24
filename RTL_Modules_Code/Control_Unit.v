module Control_Unit (
  input [5:0] funct,opcode,
  output [2:0] alucontrol,
  output memwrite,regwrite,regdest,alusrc,jump,memtoreg,branch
);
wire [1:0] aluop;
Main_Decoder D1(

  .opcode(opcode),
  .memwrite(memwrite),
  .regwrite(regwrite),
  .regdest(regdest),
  .alusrc(alusrc),
  .jump(jump),
  .memtoreg(memtoreg),
  .branch(branch),
  .aluop(aluop)
);
ALU_Decoder D2(

  .aluop(aluop),
  .alucontrol(alucontrol),
  .funct(funct)
);
  
endmodule
