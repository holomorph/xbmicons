NAME=xbmicons
VERSION=$(shell git rev-list --count HEAD)+g$(shell git rev-parse --short HEAD)

BDF=$(NAME).bdf
PCF=$(NAME).pcf
GZ=$(PCF).gz

$(GZ): $(PCF)
	gzip -f $(PCF)

$(PCF): $(BDF)
	bdftopcf -o $(PCF) $(BDF)

clean:
	$(RM) $(PCF) $(GZ)

dist:
	git archive --format=tar --prefix=$(NAME)-$(VERSION)/ HEAD | gzip -9 > $(NAME)-$(VERSION).tar.gz

install:
	install -Dm644 $(GZ) $(DESTDIR)/usr/share/fonts/misc/$(GZ)

.PHONY: clean dist install
