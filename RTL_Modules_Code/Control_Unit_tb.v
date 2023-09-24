module Control_Unit_tb ();
reg [5:0] funct,opcode;
wire[2:0] alucontrol;
wire memwrite,regwrite,regdest,alusrc,jump,memtoreg,branch;
Control_Unit f(
.opcode(opcode),
.funct(funct),
.alucontrol(alucontrol),
.memwrite(memwrite),
.regwrite(regwrite),
.regdest(regdest),
.alusrc(alusrc),
.jump(jump),
.memtoreg(memtoreg),
.branch(branch)
);
initial begin
  opcode=6'b100011;
  funct=6'b100011;
  #10
  opcode=6'b101011;
  funct=6'b100111;
  #10
  opcode=6'b000000;
  funct=6'b100000;
  #10
  opcode=6'b000000;
  funct=6'b100010;
  #10
  opcode=6'b00_0000;
  funct=6'b10_1010 ;
  #10
  opcode=6'b000000;
  funct=6'b011100;
  #10
  opcode=6'b001000;
  funct=6'b100000;
  #10
  opcode=6'b00_0100;
  funct=6'b10_0000;
  #10
  opcode=6'b000010;
  funct=6'b100000;
  #10
  opcode=6'b011010;
  funct=6'b100000;
  
end
endmodule
