//Thruwire CPP simulator for Verilator 

#include <stdio.h>
#include <stdlib.h>
#include "obj_dir/Vclock_overflow.h"
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
    Vclock_overflow *tb = new Vclock_overflow; //Instantiate the design
    for(int k=0;k<24;k++)
    {
        tick(tb); //Toggle the clock line
        printf("k = 0x%04x ",k); // print the loop iteration
        printf("counter = 0x%04x ",tb->clock_overflow__DOT__counter); // print the value of the counter
        printf("overflow_bit = %02d " ,tb->clock_overflow__DOT__ovflw); // print the value of the LED output
        printf("overflow_counter = 0x%02x\n",tb->o_led);
    }
}