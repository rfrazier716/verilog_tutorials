`default_nettype none //stops mispelled identifiers from being turned into wires

parameter WIDTH=32; //Width defines the counter width
parameter OVCOUNTERWIDTH=4;

module clock_overflow(i_clock, o_led);
    input wire i_clock;
    output wire[OVCOUNTERWIDTH-1:0] o_led;

    reg[WIDTH-1:0] counter; // Counter that will overflow
    reg ovflw; //overflow register
    reg[OVCOUNTERWIDTH-1:0] overflowCounter; //Counter to keep track of overflows

    initial {ovflw,
        counter,
        overflowCounter} = 0; //Counter and overflow init to zero
    
    always@(posedge i_clock)
    begin
        //On a positive clock edge increment the counter
        {ovflw, counter} <= counter + 1'b1; // when the counter overflows the overflow bit is set
    end

    always@(posedge i_clock)
    begin
        if(ovflw) //If the clock has overflowed increment the overflow counter and reset the overflow bit
        begin
            ovflw<=0; //reset the overflow flag
            overflowCounter <= overflowCounter+1; // increment the overflow counter
        end
    end

    assign o_led = overflowCounter; //Connect the overflow counter register to the output signal
endmodule