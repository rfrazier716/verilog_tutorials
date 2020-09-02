`default_nettype none //stops mispelled identifiers from being turned into wires

module thruwire(i_sw,o_led);
    input wire[7:0] i_sw; // Input Switch bus
    output wire[7:0] o_led; // Output LED Bus

    wire[7:0] w_inverter; //An internal wire that will be used for signal inversion

    assign w_inverter = 8'hAA; //Assign the inverter xAA    
    assign o_led = i_sw ^ w_inverter; //the output is the input XORd with 0xAA
endmodule