all : Makefile installer.bat iscan_help.txt multi-machine-installer.bat

Makefile : ../../src/DRIVER_TEMPLATE/Makefile
	cp ../../src/DRIVER_TEMPLATE/Makefile ./

installer.bat : ../../src/installer.bat
	cp ../../src/installer.bat ./

iscan_help.txt : iscan_help.driver.but ../../src/doc/iscan_help.template.but
	../../src/doc/makeDoc

multi-machine-installer.bat : ../../src/multi-machine-installer.bat
	cp ../../src/multi-machine-installer.bat ./
