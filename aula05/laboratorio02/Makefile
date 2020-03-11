#
# https://gcc.gnu.org/onlinedocs/gcc-7.5.0/gnat_ugn/Running-a-Simple-Ada-Program.html
#
# sudo dnf install gcc-gnat
#

all: main

main: main.adb
	gnatmake main

clean:
	rm -rf main *.o *.ali
