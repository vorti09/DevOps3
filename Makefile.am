AUTOMAKE_OPTIONS = foreign
bin_PROGRAMS = mainprogram
mainprogram_SOURCES = main.cpp FuncA.cpp FuncA.h

PACKAGE = mainprogram
VERSION = 1.0
PACKAGE_BUGREPORT = ivannedorizanyuk@gmail.com
CTRLF_DIR = $(CURDIR)/debian
CTRLF_NAME = $(CTRLF_DIR)/control

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

