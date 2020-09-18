`default_nettype none //stops mispelled identifiers from being turned into wires

module busMaster(
    input wire i_clk,
    input wire reset,
    output wire[7:0] bus
);
    reg enMasterA;
    reg enMasterB;

    reg[7:0] dataA;
    reg[7:0] dataB;

    initial {enMasterA,enMasterB}=0;
    initial dataA=8'hA5;
    initial dataB=8'h5A;

    always@(posedge i_clk)
    begin
        //on ever clock check if we reset the signal otherwise toggle the input
        if(reset) begin
            enMasterA<=0;
            enMasterB<=1;
        end
        else begin
            enMasterA<=enMasterB;
            enMasterB<=enMasterA;
        end
    end
    
    always@(*)
    begin
        bus = enMasterA ? 8'hA5 : 8'hZZ;
        bus = enMasterB ? 8'h5A : 8'hZZ;
    end

endmodule