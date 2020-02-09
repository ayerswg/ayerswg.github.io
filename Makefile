# Find all markdown files
MARKDOWN=$(shell find . -iname "*.pmd")
# Form all 'html' counterparts
HTML=$(MARKDOWN:.pmd=.html)

.PHONY = all tar clean
all: $(HTML)

%.html: %.pmd
	pandoc -s --css bq.css --template bq.html --from markdown --to html $< -o $@

tar: $(MARKDOWN)
	tar --exclude=notes.tar.gz --exclude=.git/ -czvf notes.tar.gz ./

clean:
	rm $(HTML)
