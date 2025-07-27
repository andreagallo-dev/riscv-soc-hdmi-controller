/**
 * @file my_periph_driver.h
 * @author jiang lei (jiang.lei@tongji.edu.cn)
 * @brief 
 * @version 0.1
 * @date 2024-01-17
 * 
 * @copyright Copyright (c) 2024
 * 
 */
#ifndef _MY_PERIPH_DRIVER_H
#define _MY_PERIPH_DRIVER_H

#include "platform.h"

#define MY_PERIPH_IO_REG_BASE       0x10014000
#define MY_PERIPH_IO_REG_OFFSET     0x04


uint32_t my_periph_reg_read(uint32_t offset);
void my_periph_reg_write(uint32_t offset, uint32_t value);

#endif

