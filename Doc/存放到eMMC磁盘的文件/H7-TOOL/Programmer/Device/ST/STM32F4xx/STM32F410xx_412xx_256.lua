
-------------------------------------------------------
-- 文件名 : STM32F410xx_412xx_256.lua
-- 版  本 : V1.0  2020-04-28
-- 说  明 : 未验证，Option bytes 部分还未整理
-------------------------------------------------------
function config_cpu(void)
	CHIP_TYPE = "SWD"		--指定器件接口类型: "SWD", "SWIM", "SPI", "I2C", "UART"

	AlgoFile_FLASH = "0:/H7-TOOL/Programmer/Device/ST/STM32F4xx/STM32F4xx_256.FLM"
	AlgoFile_OTP   = "0:/H7-TOOL/Programmer/Device/ST/STM32F4xx/STM32F4xx_OTP.FLM"
	AlgoFile_OPT   = "0:/H7-TOOL/Programmer/Device/ST/STM32F4xx/STM32F410xx_412xx_OPT.FLM"
	AlgoFile_QSPI  = ""

	FLASH_ADDRESS = 0x08000000		--CPU内部FLASH起始地址

	OTP_ADDRESS	= 0x1FFF7800		--CPU内部OTP(1次可编程)起始地址

	RAM_ADDRESS = 0x20000000		--CPU内部RAM起始地址

	--Flash算法文件加载内存地址和大小
	AlgoRamAddr = RAM_ADDRESS
	AlgoRamSize = 8 * 1024

	MCU_ID = 0x2BA01477

	UID_ADDR = 0x1FFF7A10	   	--UID地址，不同的CPU不同
	UID_BYTES = 12

	--缺省校验模式
	VERIFY_MODE = 0				-- 0:读回校验, 1:软件CRC32校验, 其他:扩展硬件CRC(需要单片机支持）

	ERASE_CHIP_TIME = 16000		--全片擦除时间ms（仅用于进度指示)

	OB_ADDRESS     = "1FFFC000 1FFFC001 1FFFC008 1FFFC009 "

	OB_SECURE_OFF  = "FF AA FF FF"	--SECURE_ENABLE = 0时，编程完毕后写入该值
	OB_SECURE_ON   = "FF 00 FF F1"	--SECURE_ENABLE = 1时，编程完毕后写入该值

	--判断读保护和写保护的条件(WRP = Write protection)
	OB_WRP_ADDRESS   = {0x1FFFC001, 0x1FFFC008, 0x1FFFC009} 	--内存地址
	OB_WRP_MASK  	 = {0xFF, 0xFF, 0xFF}					--读出数据与此数相与
	OB_WRP_VALUE 	 = {0xAA, 0xFF, 0xFF}					--相与后与此数比较，相等表示没有保护
end

---------------------------结束-----------------------------------
