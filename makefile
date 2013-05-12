NAME=xbmicons
VERSION=$(shell git rev-list --count HEAD).g$(shell git rev-parse --short HEAD)

BDF=$(NAME).bdf
PCF=$(NAME).pcf

$(PCF): $(BDF)
	bdftopcf -o $(PCF) $(BDF)

clean:
	$(RM) $(PCF)

dist:
	git archive --format=tar --prefix=$(NAME)-$(VERSION)/ HEAD | gzip -9 > $(NAME)-$(VERSION).tar.gz

install:
	install -Dm644 $(PCF) $(DESTDIR)/usr/share/fonts/local/$(PCF)

.PHONY: clean dist install
