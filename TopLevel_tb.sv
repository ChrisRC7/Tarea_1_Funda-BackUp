module TopLevel_tb;

  // Declaración de señales
  logic [3:0] in;               // Entrada A1, A0, B1, B0
  logic button;                  // Entrada del botón
  logic reset;                   // Entrada de reset
  logic clk;                     // Entrada de reloj
  logic [6:0] seg0;              // Salida de los 7 segmentos
  logic signal_out;              // Salida de la señal de control

  // Instancia del TopLevel
  TopLevel uut (
    .in(in),
    .button(button),
    .reset(reset),
    .clk(clk),
    .seg0(seg0),
    .signal_out(signal_out)
  );

  // Generar el reloj
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Reloj de 100MHz (simulado como 10ns de ciclo)
  end

  // Secuencia de estímulos
  initial begin
    // Inicialización
    in = 4'b0000;  // Inicializar la entrada en 0
    button = 0;    // El botón está inicialmente apagado
    reset = 0;     // El reset está desactivado

    // Aplicar un reset
    #10 reset = 1;   // Activa el reset
    #10 reset = 0;   // Desactiva el reset

    // Simulación de pulsaciones de botón
    #20 button = 1;   // Pulsar el botón
    #10 button = 0;   // Soltar el botón

    #20 button = 1;   // Pulsar el botón nuevamente
    #10 button = 0;   // Soltar el botón

    #20 button = 1;   // Pulsar el botón nuevamente
    #10 button = 0;   // Soltar el botón

    #20 button = 1;   // Pulsar el botón nuevamente
    #10 button = 0;   // Soltar el botón

    // Verificar la señal de salida y el display
    #10 $display("Valor acumulado: %b, Signal out: %b, Segments: %b", in, signal_out, seg0);

    // Finalizar la simulación
    #50 $finish;
  end

endmodule
