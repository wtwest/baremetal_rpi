
/*
------------------------------------------------------------------------------
- Include Files
------------------------------------------------------------------------------
*/

#include <stdint.h>

/*
------------------------------------------------------------------------------
- Constants
------------------------------------------------------------------------------
*/

/* N/A */

/*
------------------------------------------------------------------------------
- Types
------------------------------------------------------------------------------
*/

typedef void (*ivt_entry)(void);

/*
------------------------------------------------------------------------------
- Data
------------------------------------------------------------------------------
*/

/* start of bss section */
extern int __bss_start__;

/* end of bss section */
extern int __bss_end__;

/* top of the stack */
extern unsigned long __StackTop;


/* interrupt/exception vector table */
/*
ivt_entry ivt[] __attribute__((section(".isr_vector"))) =
{
    (ivt_entry)&__StackTop,
    (ivt_entry)_cstart,
    (ivt_entry)0xdeadbeef
};
*/

/*
------------------------------------------------------------------------------
- Functions
------------------------------------------------------------------------------
*/

/* initialize data in the bss section */
static void init_bss(void)
{
    /* pointer used to walk through the bss section */
    int *bss_walker = &__bss_start__;

    /* pointer to the end of the bss section */
    int *end_bss = &__bss_end__;

    /* initialze all data in the bss section */
    while (bss_walker < end_bss)
    {
        *bss_walker = 0;
        bss_walker++;
    }
}

/* entry point for the application */
void _c_reset(void)
{
    init_bss();

    while (1);
}

