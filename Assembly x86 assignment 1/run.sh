#Author: Sergio Murguia
#Program name: Floats

rm *.o
rm *.out

echo "Assemble the module is_float.asm"
nasm -f elf64 -l is_float.lis -o is_float.o is_float.asm -g -gdwarf

echo "Compile isfloat.cpp"
g++ -c -m64 -Wall -o isfloat.o isfloat.cpp -fno-pie -no-pie -std=c++17

echo "Compile the C++ module driver.cpp"
g++ -c -m64 -Wall -o driver.o driver.cpp -fno-pie -no-pie -std=c++17

echo "Link the two object files"
g++ -m64 -no-pie -o a.out -std=c++17 is_float.o driver.o isfloat.o

echo "Run the program "
./a.out
echo "The bash script file is now closing"