module FlipFlop(
    input  logic reset,
    input  logic button_stable,         // Entrada debounced usada como "clk manual"
    input  logic [1:0] num,             // Resultado de DecoderToBcd
    output logic [1:0] accumulated_value,
    output logic signal_out
	 
);

    logic [1:0] acc = 2'b00;  // Acumulador inicializado en 0
	 logic [1:0] sum;
	 
	 
	 DecoderToBcd sumador (
		.A1(num[1]), .A0(num[0]),
		.B1(acc[1]), .B0(acc[0]),
		.S(sum)
    );

    always_ff @(negedge button_stable or posedge reset) begin
        if (reset)
            acc <= 2'b00;
        else
				acc <= sum;
    end

    assign accumulated_value = acc;
    assign signal_out = (acc == 2'd1 || acc == 2'd2) ? 1 : 0;

endmodule
