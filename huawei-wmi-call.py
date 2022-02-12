#!/usr/bin/python3
import sys

def parse_data(string_raw):
	out = string_raw.replace('{', '').replace('}','').replace('[', '').replace(']','').replace('0x', '').split(',')
	#print(out)
	mass = [int(x, base=16) for x in out]
	mass_cr = [chr(x) for x in mass]
	print("STAT =", mass[4])
	data = mass[5:]
	#print(mass_cr)
	#print(data)
	last_non_zero_index = 0
	for i in range(len(data)):
		if (data[i] != 0):
			last_non_zero_index = i
	if (last_non_zero_index == 0):
		print("ZERO")
		return
	
	print("DEC:")
	print(" ".join(str(x) for x in data[:last_non_zero_index+1]))
	print("HEX:")
	print(" ".join(hex(x).split('x')[-1] for x in data[:last_non_zero_index+1]))
	
	print("CHAR:")
	mass_cr = [chr(x) for x in data]
	print("".join(mass_cr))

	print("WORD DEC:")
	word_mass = []
	for i in range(0, len(data), 2):
		#print(i)
		if (i == len(data)-1):
			word = data[i]
		else:
			word = data[i] | (data[i+1] << 8)
		word_mass.append(word)

	for i in range(len(word_mass)):
		if (word_mass[i] != 0):
			last_non_zero_index = i

	print(" ".join(str(x) for x in word_mass[:last_non_zero_index+1]))

	print("WORD HEX:")
	print(" ".join(hex(x).split('x')[-1] for x in word_mass[:last_non_zero_index+1]))

	
	print("WORD DEC OFFSET 1:")
	word_mass = []
	for i in range(1, len(data), 2):
		word = data[i] | (data[i+1] << 8)
		word_mass.append(word)

	print(" ".join(str(x) for x in word_mass[:last_non_zero_index+1]))

	print("WORD HEX OFFSET 1:")
	print(" ".join(hex(x).split('x')[-1] for x in word_mass[:last_non_zero_index+1]))

def hwmi_arg(arg):
	arg_f = open("/sys/kernel/debug/huawei-wmi/arg", "w")
	arg_f.write(arg)
	arg_f.close()

def hwmi_call():
	call_f = open("/sys/kernel/debug/huawei-wmi/call", "r")
	string_raw = call_f.read()
	call_f.close()
	return string_raw

def process_code(code):
	hwmi_arg(code)
	for x in range(2):
		string_raw = hwmi_call()
		if (string_raw[27] != "1"): 
			break
		if (x == 1):
			print("Always STAT=1 | The method is missing or broken")
			return -1
	return string_raw


if (len(sys.argv) > 1):
	code = sys.argv[1]
	if (sys.argv[-1] == "-brut"):
		code = sys.argv[1]
		#print(sys.argv[1])
		for x in range(16):
			code2 = code[:-5] + hex(x).split('x')[-1].upper() +  code[-4:]
			print("#####################", code2, "#####################")
			string_raw = process_code(code2)
			if (string_raw != -1):
				parse_data(string_raw)
		exit()
	else:
		string_raw = process_code(code)
		if (string_raw != -1):
			parse_data(string_raw)

else:
	print("Bad arg")

