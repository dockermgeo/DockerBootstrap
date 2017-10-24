TRG=/
SRC=src

install:
	@echo "* Copy Dockerboot to ${TRG}"
	cp -Rvf ${SRC}/* ${TRG}
