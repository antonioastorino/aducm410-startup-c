    THUMB
    AREA RESET, DATA, READONLY, ALIGN=2
__Vectors
    DCD __initial_sp
    DCD Reset_Handler 

    AREA    |.text|, CODE, READONLY
SetupSram PROC
    ENDP

main PROC
    BX LR
    ENDP

Reset_Handler PROC
    BL SetupSram
    LDR R0, =__Vectors
    LDR R0, [R0, #0]
    MSR MSP, R0
    B.W __main
    ENDP


    AREA    STACK, NOINIT, READWRITE, ALIGN=3

Stack_Mem
    % 1024
__initial_sp

    AREA    HEAP, NOINIT, READWRITE, ALIGN=3
Heap_Mem
    % 512
__heap_limit

    EXPORT __main
    EXPORT __Vectors
    EXPORT __initial_sp
    END
