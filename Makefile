TRG=/
SRC=src

install:
	@echo "* Copy Dockerboot to ${TRG}"
	cp -Rvf ${SRC}/* ${TRG}
	chmod a+x ${TRG}*.sh
	chmod a+x ${TRG}etc/docker/modules/*.sh
