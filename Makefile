DESTDIR ?= /usr/local
all: install

install: kanban
	cp -v {,$(DESTDIR)/bin/}kanban || \
		( echo -e '\n\n*** Do you have permission to write to $(DESTDIR)/bin? ***\n\n' && \
		exit 1 )
	echo 'export PATH=$$PATH:$(DESTDIR)/bin' >> ~/.bashrc
	echo 'alias k="KANBANFILE=./.kanban.csv KANBANCONF=./.kanban.conf $(shell which kanban)"' >> ~/.bashrc
	source ~/.bashrc
