
LATEXDIR=latex

LATEX_BASE=$(patsubst $(LATEXDIR)/%.tex,%,$(wildcard $(LATEXDIR)/*.tex))
PREVIOUS_VERSION=$(shell git tag --no-contains HEAD --list 'v[0-9]*' 2> /dev/null | tail -1)

default: report
.PHONY: default

.PHONY: all
all: pdf

.PHONY: pdf
pdf: $(LATEX_BASE)


.PHONY: $(LATEX_BASE)
$(LATEX_BASE): %:
	cd $(LATEXDIR) && $(MAKE) $*.pdf

.PHONY: clean
clean:
	cd $(LATEXDIR) && $(MAKE) clean
.PHONY: dist-clean
dist-clean:
	cd $(LATEXDIR) && $(MAKE) dist-clean

.PHONY: lastdiff
lastdiff: diff-$(PREVIOUS_VERSION)
	ln -Tfs $< $@
	ln -Tfs $<.zip $@.zip

.PHONY: none-file
none-file:

diff-%: none-file
	rm -fr diff-$*
	mkdir -p diff-$*
	# Generate message
	git shortlog $*..HEAD | sed "s/^\\s\\+/- /" >> diff-$*/CHANGELOG.txt
	echo '```' >> diff-$*/CHANGELOG.txt
	git diff --compact-summary $*..HEAD >> diff-$*/CHANGELOG.txt
	echo '```' >> diff-$*/CHANGELOG.txt
	cat diff-$*/CHANGELOG.txt
	## Generate pdf diff
	cp -r $(LATEXDIR)/ diff-$*/$(LATEXDIR)
	cd diff-$*/$(LATEXDIR) && $(MAKE) dist-clean
	find diff-$*/$(LATEXDIR) -name '*.tex' -delete
	latexdiff-vc --git -d diff-$* -r $* $(shell find $(LATEXDIR) -name '*.tex') 
	sed -i '/%DIF PREAMBLE/d' $$(find diff-$*/$(LATEXDIR)/*/ -name '*.tex')
	cd diff-$*/$(LATEXDIR) && $(MAKE) all
	for f in diff-$*/$(LATEXDIR)/*.pdf; do\
		new=$$(echo $$f | sed 's~/$(LATEXDIR)/~/diff-$*-~') ;\
		cp $$f $$new ;\
		done
	zip diff-$*.zip $$(find $@/$(LATEXDIR) -name '*.pdf')


