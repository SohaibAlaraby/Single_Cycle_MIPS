module Program_Counter #(
parameter N_bit=32
) (
  input clk,reset_n,
  input [N_bit-1 : 0] PC_dash,
  output [N_bit-1 : 0] PC

);
reg [N_bit-1 : 0] Q_next,Q_reg;
//state_logic
always @(posedge clk,negedge reset_n) begin
if (!reset_n) begin
  Q_reg <= 'b0;
end else begin
  Q_reg <= Q_next;
end
end
//next_state lcgic
always @(*) begin
  Q_next = PC_dash;
end
//output logic
assign PC = Q_reg;
endmodule
