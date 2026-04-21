#include <stdint.h>

__attribute__((section("RESET"))) const uint32_t __Vectors[] = {
    0, // placeholder for __initial_sp
    0, // placeholder for Reset_Handler
};
