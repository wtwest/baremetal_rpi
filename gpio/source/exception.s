/*
Exception handling for the Raspberry Pi (ARM1176JZF-S, ARMv6k)
*/


/*
------------------------------------------------------------------------------
- Exception Vector Table
------------------------------------------------------------------------------
*/
.section .evt 

b _reset                   /* reset (not really an exception) */
b _undefined_instruction   /* Undefined Instruction           */
b _hypervisor_call         /* Hypervisor Call                 */
b _prefetch_abort          /* Prefetch Abort                  */
b _data_abort              /* Data Abort                      */
b _hyp_abort               /* Hypervisor Abort, Unused        */
b _irq_interrupt           /* IRQ                             */
b _fiq_interrupt           /* FIQ                             */


_reset:
    /* TODO setup stack pointer, don't interfere w/ GPU */
    ldr sp, =__StackTop
    b _c_reset /* call the C code that handles resets */

_undefined_instruction:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _undefined_instruction

_hypervisor_call:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _hypervisor_call

_prefetch_abort:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _prefetch_abort
    
_data_abort:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _data_abort
    
_hyp_abort:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _hyp_abort
    
_irq_interrupt:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _irq_interrupt
 
_fiq_interrupt:
    /* TODO: loop for now until we can generate crash dump or light LED */
    b _fiq_interrupt   
    

    
