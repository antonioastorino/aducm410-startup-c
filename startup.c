#include <stdint.h>
#define STACK_SIZE (1024)

static uint8_t Stack_Mem[STACK_SIZE] __attribute__((aligned(8)));

__attribute__((section("RESET"))) const uint32_t __Vectors[] = {
    (uint32_t)(Stack_Mem + STACK_SIZE), // __initial_sp
    0,                                  // placeholder for Reset_Handler
};
