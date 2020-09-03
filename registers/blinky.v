// Basic LED Blink Examples using Sequential logic
// On Counter overflow LED will Toggle 

`default_nettype none //stops mispelled identifiers from being turned into wires

parameter WIDTH=32; //Width defines the counter width
module blinky(i_clock, o_led);
    input wire i_clock; //Clock line
    output wire o_led;  // LED pin that will toggle on the timer

    reg[WIDTH-1:0] counter; // Counter for our blinky program
    initial counter = 0; //Initial Condition for the counter 

    //Connect the MSB of counter to the LED output, o_led is a wire and should not be inside of the always block
    assign o_led = counter[WIDTH-1];

    // The clocked counter is the only thing being updated at a clock edge
    always@(posedge i_clock)
    begin
        counter <= counter +1; // Increment the Counter, USING NONBLOCKING ASSIGNMENTS!
    end
    
    
endmodule