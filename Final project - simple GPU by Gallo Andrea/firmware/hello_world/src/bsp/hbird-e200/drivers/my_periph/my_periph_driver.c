#include "my_periph/my_periph_driver.h"

uint32_t my_periph_reg_read(uint32_t offset)
{
    uint32_t reg_value = *(volatile uint32_t *)(MY_PERIPH_IO_REG_BASE + offset);
    return reg_value; 
}

void my_periph_reg_write(uint32_t offset, uint32_t value)
{
    *(volatile uint32_t *)(MY_PERIPH_IO_REG_BASE + offset) = value;
}

