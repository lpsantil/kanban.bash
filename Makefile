DESTDIR ?= /usr/local
all: install

install: $(DESTDIR)/bin/kanban
	echo 'export PATH=$$PATH:$(DESTDIR)/bin' >> ~/.bashrc
	echo 'alias k="KANBANFILE=./.kanban.csv KANBANCONF=./.kanban.conf $(shell which kanban)"' >> ~/.bashrc
	source ~/.bashrc

$(DESTDIR)/bin/kanban: ./kanban
	@cp -v $< $@ || ( \
	echo -e '\n' && \
	echo -en "*** Do you ($(shell id -un)/$(shell id -u)) " && \
	echo -e "have permission to write to $(DESTDIR)/bin? ***" && \
	echo -e '\n' && \
	exit 1 )
