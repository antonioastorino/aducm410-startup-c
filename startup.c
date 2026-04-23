#include <stdint.h>
#define STACK_SIZE (1024)
void Reset_Handler(void);

static uint8_t Stack_Mem[STACK_SIZE] __attribute__((aligned(8)));

__attribute__((section("RESET"))) const uint32_t __Vectors[] = {
    (uint32_t)(Stack_Mem + STACK_SIZE), // __initial_sp
    (uint32_t)Reset_Handler,
//};

void SetupSram(void) {}
int main(void) {}

__attribute__((naked)) void Reset_Handler(void)
{
    __asm volatile(
        "BL SetupSram\n"
        "LDR R0, =__Vectors\n"
        "LDR R0, [R0, #0]\n"
        "MSR MSP, R0\n"
        "B.W __main\n");
}
