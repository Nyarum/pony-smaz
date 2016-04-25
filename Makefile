build:
	git clone https://github.com/antirez/smaz.git smaz-lib
	gcc -shared -o libsmaz.so -fPIC smaz-lib/smaz.c
	sudo mv libsmaz.so /usr/local/lib
	rm -rf smaz-lib
