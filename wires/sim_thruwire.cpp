//Thruwire CPP simulator for Verilator 

#include <stdio.h>
#include <stdlib.h>
#include "Vthruwire.h"
#include "verilated.h"

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc,argv); // call Verilated Commands
    Vthruwire *tb = new Vthruwire; //Instantiate the design
    for( int k = 0; k<20; k++)
    {
        tb->i_sw = k&0x01;
        tb->eval();
        printf("k = %2d ",k);
        printf("i_sw = %d ",tb->i_sw);
        printf("o_led = %d\n",tb->o_led);
    }
}