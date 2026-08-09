module TopLevel(
    input  logic clk,
    input  logic reset,
    input  logic button,
    input  logic [3:0] in,
    output logic [6:0] seg0,
    output logic signal_out
);

    logic [1:0] sum;
    logic [1:0] accumulated_value;
    logic button_stable;

	 // Instancia del módulo de debounce
	  Button_debounce debounce_inst (
		 .clk(clk),
		 .rst(reset),
		 .button_in(button),
		 .button_out(button_stable)
	  );

    // Sumador con DecoderToBcd
    DecoderToBcd sumador (
        .A1(in[3]), .A0(in[2]),
        .B1(in[1]), .B0(in[0]),
        .S(sum)
    );

    // Flip-flop acumulador controlado por el botón
    FlipFlop flipflop (
        .reset(reset),
        .button_stable(button_stable),
        .num(sum),
        .accumulated_value(accumulated_value),
        .signal_out(signal_out)
    );

    // Visualización en display
    BcdTo7Segment display (
        .bcd({2'b00, accumulated_value}),
        .seg(seg0)
    );

endmodule
