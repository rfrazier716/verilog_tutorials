`default_nettype none //stops mispelled identifiers from being turned into wires

parameter WIDTH=3;

module ledWalker(i_clk, o_led);

    input wire i_clk; //Input clock that drives the state machine
    output reg[7:0] o_led; //the LED output

    reg[2:0] state; // Register that tracks the current state of the system
    reg[2:0] next_state; // Register that holds the next state to transition to based on inputs
    reg[WIDTH-1:0] counter; //Counter whose overflow triggers a state reset
    reg transition; //register that determins if we transition
    reg direction; //register that determines the direction that the led walks 1(forward) or 0(backwards)

    initial {state, counter, transition}=0; 
    initial direction=1'b1; //initial direction is forward 
    initial o_led = 'b1; //LED initial value must match state initial value

    //Input variables to the state machine
    always@(posedge i_clk)
        begin
            {transition, counter}<=counter+1'b1;
            
            // the direction input changes when the machine is in one of the end states
            if( state == 0 )
                direction <= 'b1;
            else if(state == 3'h7)
                direction <= 'b0;

        end

    //Implement state machine
    always@(posedge i_clk)
            if(transition) // if the transition bit has been set change the state
              state <= next_state; //on a transition change state

    always@(*)
        begin
            // mux the next state based on the direction input 
            next_state = state + 1;
            if(!direction)
                next_state = state - 1;
            
            // Output of State machine
            case (state)
                3'h0: o_led = 'h01; //light the bottom LED
                3'h1: o_led = 'h02;
                3'h2: o_led = 'h04;
                3'h3: o_led = 'h08;
                3'h4: o_led = 'h10;
                3'h5: o_led = 'h20;
                3'h6: o_led = 'h40;
                3'h7: o_led = 'h80; // light up the top LED               
            endcase
        end
        

        
    

endmodule