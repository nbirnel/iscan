ScanDriver.ahk : ScanDriver.raw.ahk header.m4
	./preprocess.sh

Makefile : ../../src/DRIVER_TEMPLATE/Makefile
	cp ../../src/DRIVER_TEMPLATE/Makefile ./

installer.bat : ../../src/installer.bat
	cp ../../src/installer.bat ./

help : 
	../../src/doc/makeDoc

multi-machine-installer.bat : ../../src/multi-machine-installer.bat
	cp ../../src/multi-machine-installer.bat ./
