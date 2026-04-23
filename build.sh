#!/usr/bin/env zsh
set -e
PROJECT_NAME=startup
rm -rf build
mkdir -p build

echo "Compiling C"
armclang --target=arm-arm-none-eabi -mcpu=cortex-m33 -mthumb \
    ${PROJECT_NAME}.c -c -o build/${PROJECT_NAME}_c.o
echo "Linking C"
armlink build/*_c.o \
    --scatter ADuCM410.sct \
    --output build/${PROJECT_NAME}_c.elf
echo "Elfing C"
fromelf --disassemble build/${PROJECT_NAME}_c.elf >build/${PROJECT_NAME}_c.dis

echo "Compiling S"
armasm --cpu=cortex-m33 --thumb ${PROJECT_NAME}.s -o build/${PROJECT_NAME}_s.o
echo "Linking S"
armlink build/*_s.o \
    --scatter ADuCM410.sct \
    --output build/${PROJECT_NAME}_s.elf
echo "Elfing S"
fromelf --disassemble build/${PROJECT_NAME}_s.elf >build/${PROJECT_NAME}_s.dis
