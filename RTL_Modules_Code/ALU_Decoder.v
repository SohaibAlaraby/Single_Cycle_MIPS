module ALU_Decoder (
  input [5:0] funct,
  input [1:0] aluop,
  output reg [2:0] alucontrol
);

always @(*) begin
  alucontrol=3'b0;
  casex ({aluop,funct})
    8'b00xxxxxx:begin
      alucontrol= 010;
    end 
    8'b01xxxxxx:begin
      alucontrol=100;
    end
    8'b10100000:begin
      alucontrol=010;
    end
    8'b10100010:begin
      alucontrol=100;
    end
    8'b10101010:begin
      alucontrol=110;
    end
    8'b10011100:begin
      alucontrol=101;
    end
    default: begin
      alucontrol=010;
    end
  endcase
end
  
endmodule
