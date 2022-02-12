acpidump > acpidump.out 
acpixtract -a acpidump.out
iasl -d dsdt.dat
iasl -d *.dat 

grep -i -r  "HWMI" .
grep -i -r  "wmaa" .


python3 parse_ec.py dsdt/HLYL-WXX9_1.8.dsl | tee ec_map/HLYL-WXX9_1.8.txt

diff BOHK-WAX9X_1.17.txt HLYL-WXX9_1.8.txt

