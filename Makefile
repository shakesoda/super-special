all:
	if [ ! -d output ]; then mkdir output; fi
	cp target/rpi-zero-w.config output/.config
	make -C buildroot O="$(PWD)/output"

clean:
	rm -rf output
	make -C buildroot clean

.phony: all clean
