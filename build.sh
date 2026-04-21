#!/usr/bin/env zsh
PROJECT_NAME=startup
rm -rf build
mkdir -p build

armclang --target=arm-arm-none-eabi -mcpu=cortex-m33 -mthumb \
    ${PROJECT_NAME}.c -c -o build/${PROJECT_NAME}_c.o

armlink build/*_c.o \
    --scatter ADuCM410.sct \
    --output build/${PROJECT_NAME}_c.elf &&
    rm build/*_c.o

armasm --cpu=cortex-m33 --thumb ${PROJECT_NAME}.s -o build/${PROJECT_NAME}_s.o
armlink build/*_s.o \
    --scatter ADuCM410.sct \
    --output build/${PROJECT_NAME}_s.elf &&
    rm build/*_s.o
