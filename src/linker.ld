OUTPUT_FORMAT(pei-i386)    
ENTRY(main)

SECTIONS
{
    . = 0x0100000;
    
    .text :
    {
        *(.multiboot)
        *(.text*)
        *(.rodata)
    }
    
    .data :
    {
        start_ctors = .;
        KEEP(*(.init_array));
        KEEP(*(SORT_BY_INIT_PRIORITY( .init_array.* )));
        end_ctors = .;
        
        *(.data)
    }
    
    .bss :
    {
        *(.bss)
    }
    
    /DISCARD/ :
    {
        *(.fini_array*)
        *(.comment)
    }
}