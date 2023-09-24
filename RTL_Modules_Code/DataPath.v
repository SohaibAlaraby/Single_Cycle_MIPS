module DataPath (
  input clk,Reset,
  input [31:0] readdata,instr,
  input [2:0] alucontrol,
  input regwrite,regdest,alusrc,memtoreg,pcsrc,jump,
  output [31:0] pc,aluout,writedata,
  output zero
);

wire [31:0] result_m1tom2,pc_dash,pc_now,pcbranch_result,pcplus4_result,pcjump_after_concate,data_or_alu,alu_result,rd1,rd2;
wire [31:0] signimm_before_shift,signimm_after_shift,srcb;
wire [27:0] pcjump_before_concate;
wire [4:0] writereg;
Mux2to1 #(.N_bit(32)) pcsrc_mux(
  .A(pcplus4_result),
  .B(pcbranch_result),
  .sel(pcsrc),
  .result(result_m1tom2)
);

Mux2to1 #(.N_bit(32)) jump_mux(
  .A(result_m1tom2),
  .B(pcjump_after_concate),
  .sel(jump),
  .result(pc_dash)
);

Program_Counter #(.N_bit(32)) PC(
  .clk(clk),
  .reset_n(Reset),
  .PC_dash(pc_dash),
  .PC(pc_now)
);

Adder #(.N_bit(32)) pcplus4(
  .A(pc_now),
  .B(32'd4),
  .result(pcplus4_result)
);

Register_File rf(
  .A1(instr[25:21]),
  .A2(instr[20:16]),
  .A3(writereg),
  .WE3(regwrite),
  .clk(clk),
  .WD3(data_or_alu),
  .RD1(rd1),
  .RD2(rd2)
);

Mux2to1 #(.N_bit(5)) regdest_mux(
  .A(instr[20:16]),
  .B(instr[15:11]),
  .sel(regdest),
  .result(writereg)
);

Mux2to1 #(.N_bit(32)) alusrc_mux(
  .A(rd2),
  .B(signimm_before_shift),
  .sel(alusrc),
  .result(srcb)
);

Mux2to1 #(.N_bit(32)) memtoreg_mux(
  .A(alu_result),
  .B(readdata),
  .sel(memtoreg),
  .result(data_or_alu)
);

Sign_Extend se(
.IN(instr[15:0]),
.OUT(signimm_before_shift)
);


Shift_left_twice #(.N_bit_IN(32),.N_bit_OUT(32)) shifter1(
  .IN(signimm_before_shift),
  .OUT(signimm_after_shift)
);

Adder #(.N_bit(32)) pcbranch(
  .A(signimm_after_shift),
  .B(pcplus4_result),
  .result(pcbranch_result)
);


Shift_left_twice #(.N_bit_IN(26),.N_bit_OUT(28)) shifter2(
  .IN(instr[25:0]),
  .OUT(pcjump_before_concate)
);


ALU #(.N_bit(32)) alu(
  .SrcA(rd1),
  .SrcB(srcb),
  .ALUControl(alucontrol),
  .ALUResult(alu_result),
  .Zero(zero)
);

assign pcjump_after_concate={pcplus4_result[31:28],pcjump_before_concate};
assign pc = pc_now;
assign aluout=alu_result;
assign writedata=rd2;

endmodule
