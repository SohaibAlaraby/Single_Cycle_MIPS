module ALU #(
  parameter N_bit=32
) (
  input [N_bit-1 : 0] SrcA,SrcB,
  input [2:0] ALUControl,
  output reg [N_bit-1 : 0] ALUResult,
  output reg Zero

);
reg [2*N_bit-1 : 0] mult;
always @(*) begin
  ALUResult='b0;
  mult='b0;
  Zero='b1;
  case (ALUControl)
    3'b000:begin
      ALUResult= SrcA & SrcB;
      if (ALUResult) begin
        Zero = 0 ;
      end else begin
        Zero=1 ;
      end
    end
    3'b001:begin
      ALUResult= SrcA | SrcB;
      if (ALUResult) begin
        Zero = 0 ;
      end else begin
        Zero=1 ;
      end
    end
    3'b010:begin
      ALUResult= SrcA + SrcB;
      if (ALUResult) begin
        Zero = 0 ;
      end else begin
        Zero=1 ;
      end
    end
    3'b100:begin
      ALUResult= SrcA - SrcB;
      if (ALUResult) begin
        Zero = 0 ;
      end else begin
        Zero=1 ;
      end
    end
    3'b101:begin
      mult= SrcA * SrcB;
      ALUResult=mult[N_bit-1 : 0];
      if (ALUResult) begin
        Zero = 0 ;
      end else begin
        Zero=1 ;
      end
    end
    3'b110:begin
      if (SrcA<SrcB) begin
        ALUResult='d1;
      end else begin
        ALUResult='b0;
      end
      
      if (ALUResult) begin
        Zero = 0 ;
      end else begin
        Zero=1 ;
      end
    end
    default: begin 
      ALUResult='b0;
      Zero=1; 
    end
  endcase
end
  
endmodule
