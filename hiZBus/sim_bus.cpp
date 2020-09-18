//Thruwire CPP simulator for Verilator 

#include <stdio.h>
#include <stdlib.h>
#include "obj_dir/VbusMaster.h"
#include "verilated.h"
#include "verilated_vcd_c.h"

#define MODULE VbusMaster

template<class T>
void tick(int tickcount, T *tb, VerilatedVcdC* tfp) 
{
	tb->eval();
	if (tfp)
		tfp->dump(tickcount * 10 - 2);
	tb->i_clk = 1;
	tb->eval();
	if (tfp)
		tfp->dump(tickcount * 10);
	tb->i_clk = 0;
	tb->eval();
	if (tfp) {
		tfp->dump(tickcount * 10 + 5);
		tfp->flush();
	}
}

int main(int argc, char **argv)
{
    unsigned tickcount = 0; //for trace generation

    Verilated::commandArgs(argc,argv); // call Verilated Commands
    MODULE *tb = new MODULE; //Instantiate the design

    //Create our Trace
    Verilated::traceEverOn(true);
	VerilatedVcdC* tfp = new VerilatedVcdC;
	tb->trace(tfp, 00);
	tfp->open("busTrace.vcd");
	//reset the state machine
	tb->reset=1;
	tick(++tickcount, tb, tfp);
	tb->reset=0;

    for(int k=0;k<(1<<16);k++)
    {
        tick(++tickcount, tb, tfp);
    }
    tfp->close();
}