dataMem = [0] * 25
reg = [0, 0x0040, 0x1010, 0x000F, 0x00F0, 0x0002, 0x0010, 0x0005]
dataMem[reg[6]] = 0x0101
dataMem[reg[6]+1] = 0x0110
dataMem[reg[6]+2] = 0x0011
dataMem[reg[6]+3] = 0x00F0
dataMem[reg[6]+4] = 0x00FF
print("Initial register values are:\n", reg)
print("Initial data memory values are:\n", dataMem)
count = 0
while reg[7] != 0:
    reg[7] = reg[7] - 1
    count += 1
    if reg[5] != 0:
        reg[1] = reg[1] >> 3
        reg[2] = reg[2] | reg[1]
        dataMem[reg[6]] = 0xFF00
        reg[5] = reg[5] - 1
    else:
        reg[3] = reg[3] << 2
        reg[4] = reg[4] ^ reg[3]
        dataMem[reg[6]] = 0x00FF
    reg[6] = reg[6] + 1
    print("Register values after loop iteration",count,"are:\n",reg)
    print("Data memory values after loop iteration",count,"are:\n",dataMem)
print("Final register values are:\n", reg)
print("Final data memory values are:\n", dataMem)
