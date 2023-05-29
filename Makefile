PREFIX = /usr/local

kjv: ldate.sh data.yaml
	cat ldate.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar czf - data.yaml >> $@
	chmod +x $@

test: ldate.sh
	shellcheck -s sh ldate.sh

clean:
	rm -f ldate

install: ldate
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f ldate $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/ldate

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/ldate

.PHONY: test clean install uninstall
