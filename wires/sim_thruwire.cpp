//Thruwire CPP simulator for Verilator 

#include <stdio.h>
#include <stdlib.h>
#include "obj_dir/Vthruwire.h"
#include "verilated.h"

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc,argv); // call Verilated Commands
    Vthruwire *tb = new Vthruwire; //Instantiate the design

    //Iterate over test values
    const unsigned char testValues[] ={0x00,0xFF};
    for(int i=0;i<2;i++)
    {
        tb->i_sw = testValues[i]; //set all the switches to off
        tb->eval(); //evaluate the module
        printf("i_sw = %#02x ",tb->i_sw);
        printf("o_led = %#02x\n",tb->o_led);
    }
}