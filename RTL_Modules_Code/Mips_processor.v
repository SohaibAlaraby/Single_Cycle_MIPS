module Mips_processor (
  input clk,Reset,
  output [15:0] test_value
);
wire [31:0] PC,instr,readdata,writedata,aluout;
wire memwrite,regwrite,regdest,alusrc,memtoreg,pcsrc,branch,jump,zero;
wire [2:0] alucontrol;
  Instruction_Memory i1(
    .A(PC[9:2]),
    .RD(instr)
  );
  Data_Memory d3(
    .A(aluout),
    .WE(memwrite),
    .clk(clk),
    .WD(writedata),
    .RD(readdata),
    .test_value(test_value)
  );
  Control_Unit c1(
  .opcode(instr[31:26]),
  .funct(instr[5:0]),
  .alucontrol(alucontrol),
  .memwrite(memwrite),
  .regwrite(regwrite),
  .regdest(regdest),
  .alusrc(alusrc),
  .jump(jump),
  .memtoreg(memtoreg),
  .branch(branch)

  );
  DataPath d1(
  .clk(clk),
  .Reset(Reset),
  .readdata(readdata),
  .instr(instr),
  .alucontrol(alucontrol),
  .regwrite(regwrite),
  .regdest(regdest),
  .alusrc(alusrc),
  .memtoreg(memtoreg),
  .pcsrc(pcsrc),
  .jump(jump),
  .pc(PC),
  .aluout(aluout),
  .writedata(writedata),
  .zero(zero)
  );
  assign pcsrc = zero & branch;
endmodule
