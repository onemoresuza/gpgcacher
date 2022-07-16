.POSIX:

SHELL = /bin/sh

PREFIX = /usr/local
SRC = src
SCRIPT = gpgcacher

B = \033[1m
N = \033[m

all:
	@printf "Available Targets:\n\n"
	@printf "$(B)install$(N):\tinstall the script.\n"
	@printf "$(B)uninstall$(N):\tuninstall the script.\n"

install:
	cp $(SRC)/$(SCRIPT) $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(SCRIPT)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(SCRIPT)
