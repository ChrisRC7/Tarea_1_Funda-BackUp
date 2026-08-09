module DecoderToBcd (
    input  logic A1,A0, B1, B0,   // Primer operando (2 bits)
    output logic [1:0] S   // Resultado de la suma (3 bits, ya que 3 + 3 = 6)
);

    always_comb begin
        S[0] = A0 ^ B0;
        S[1] = (A1 ^ B1) ^ (A0 & B0);
    end

endmodule
