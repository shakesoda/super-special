all: arm_pi0

LD_LIBRARY_PATH=

arm_pi0: outdir
	if [ ! -d output/arm_pi0 ]; then mkdir output/arm_pi0; fi
	cp target/rpi-zero-w.config output/arm_pi0/.config
	make -C buildroot O="$(PWD)/output/arm_pi0"

arm_efi: outdir
	if [ ! -d output/arm_efi ]; then mkdir output/arm_efi; fi
	cp target/rpi-zero-w.config output/arm_efi/.config
	make -C buildroot O="$(PWD)/output/arm_efi"

outdir:
	if [ ! -d output ]; then mkdir output; fi

clean:
	rm -rf output
	make -C buildroot clean

.phony: all clean arm_pi0 arm_efi outdir
