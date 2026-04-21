    THUMB
    AREA RESET, DATA, READONLY, ALIGN=2
__Vectors
    DCD __initial_sp
    DCD 0    ; placeholder for Reset_Handler 

    AREA    STACK, NOINIT, READWRITE, ALIGN=3

Stack_Mem
    % 1024
__initial_sp

    EXPORT __Vectors
    EXPORT __initial_sp
    END
