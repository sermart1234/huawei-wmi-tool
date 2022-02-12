#!/usr/bin/python3
import sys
if (len(sys.argv) == 1):
    exit()


with open(sys.argv[1]) as dsdt:
    lines = dsdt.readlines()


index = 0
for line in lines:
    if (line.find("Field (ERAM", 0, -1) != -1):
        break
    index += 1
index += 2
lines = lines[index:]
index = 0

number = 0
mas_bit = [None for x in range(256 * 8)]
bit = 0

while True:
    if (lines[number].find("}", 0, -1) != -1):
        break
    if (lines[number].find("Offset", 0, -1) != -1):
        value = int(lines[number][-6:-4], base=16)
        bit = value * 8
        number += 1
        continue

    mass = lines[number].replace(' ', '').split(',')
    if (mass[0] == ''):                                 #FNKL,   1, 
        mass[0] = '????'                                #    ,   2, 

    for _ in range(int(mass[1])):
        mas_bit[bit]=mass[0]
        bit+=1
    number += 1

byte = 0

#conver to byte map
for x in range(0, 256 * 8, 8):
    addr = ''.join('0x{:02X}'.format(byte))
    if len(set(mas_bit[x:x+8])) == 1:
        if (mas_bit[x] == None):
            print(addr)
        else:
            print(addr, mas_bit[x])
    else:
        print(addr, ",".join([x or '????' for x in mas_bit[x:x+8]])) 
    byte += 1