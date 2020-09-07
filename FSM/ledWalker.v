`default_nettype none //stops mispelled identifiers from being turned into wires

parameter WIDTH=3;

module ledWalker(i_clk, o_led);

    input wire i_clk; //Input clock that drives the state machine
    output reg[7:0] o_led; //the LED output

    reg[2:0] state; // Register that tracks the current state of the system
    reg[WIDTH-1:0] counter; //Counter whose overflow triggers a state reset
    reg transition; //register that determins if we transition
    reg direction; //register that determines the direction that the led walks 1(forward) or 0(backwards)

    initial {state, counter, transition}=0; 
    initial direction=1'b1; //initial direction is forward 
    initial o_led = 'b1; //LED initial value must match state initial value

    //Increment counter on every clock egde, transistion gets set on an overflow
    always@(posedge i_clk)
        {transition, counter}<=counter+1'b1;        

    //Implement state machine
    always@(posedge i_clk)
        begin
            if(transition) // if the transition bit has been set change the state
                if(direction==1)
                    state <= state+1; //increment the state if moving forward
                else
                    state <= state-1; //decrement the state if moving backwards
        end
    
    always@(*)
        case (state)
            3'h0: begin
                direction = 'b1; // at state zero only way to transition is up
                o_led = 'h01; //light the bottom LED
            end
            3'h1: o_led = 'h02;
            3'h2: o_led = 'h04;
            3'h3: o_led = 'h08;
            3'h4: o_led = 'h10;
            3'h5: o_led = 'h20;
            3'h6: o_led = 'h40;
            3'h7: begin
                direction = 'b0; // when you reach the S7 need to change direction
                o_led = 'h80;               
            end 
        endcase
        

        
    

endmodule