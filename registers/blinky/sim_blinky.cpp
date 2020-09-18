//Thruwire CPP simulator for Verilator 

#include <stdio.h>
#include <stdlib.h>
#include "obj_dir/Vblinky.h"
#include "verilated.h"

template<class T>
void tick(T testbench)
{
    //function to tick the clock of the test_bench
    testbench->eval();
    testbench->i_clock = 1;
    testbench->eval();
    testbench->i_clock = 0;
    testbench->eval();
}

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc,argv); // call Verilated Commands
    Vblinky *tb = new Vblinky; //Instantiate the design
    for(int k=0;k<24;k++)
    {
        tick(tb); //Toggle the clock line
        printf("counter = %04x ",tb->blinky__DOT__counter); // print the value of the counter
        printf("LED = %02d\n",tb->o_led); // print the value of the LED output
    }
}