AUTOMAKE_OPTIONS = foreign subdir-objects
bin_PROGRAMS = mainprogram
mainprogram_SOURCES = main.cpp FuncA.cpp FuncA.h
check_PROGRAMS = test
test_SOURCES = tests/test_func.cpp FuncA.cpp
PACKAGE = mainprogram
VERSION = 1.0
PACKAGE_BUGREPORT = ivannedorizanyuk@gmail.com


.PHONY: deb debug

deb:
    echo "Package: $(PACKAGE)" > deb/DEBIAN/control
    echo "Version: $(VERSION)" >> deb/DEBIAN/control
    echo "Architecture: all" >> deb/DEBIAN/control
    echo "Maintainer: $(PACKAGE_BUGREPORT)" >> deb/DEBIAN/control
    echo "Description: mainprogram doing something" >> deb/DEBIAN/control


debug:
	@echo "${PACKAGE}"
	@echo "${VERSION}"
	@echo "${PACKAGE_BUGREPORT}"

check: test
	@./test

