/*
Exception handling for the Raspberry Pi (ARM1176JZF-S, ARMv6k)
*/


.section .evt 

b _cstart
b _cstart
b _cstart
b _cstart
b _cstart
b _cstart
b _cstart


_reset:

    b _c_reset /* call the C code that handles resets */

