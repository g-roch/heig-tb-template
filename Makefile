
LATEXDIR=latex

LATEX_BASE=$(patsubst $(LATEXDIR)/%.tex,%,$(wildcard $(LATEXDIR)/*.tex))

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


diff-%:
	rm -fr diff-$*
	mkdir -p diff-$*
	cp -r $(LATEXDIR)/ diff-$*/$(LATEXDIR)
	cd diff-$*/$(LATEXDIR) && $(MAKE) dist-clean
	find diff-$*/$(LATEXDIR) -name '*.tex' -delete
	latexdiff-git -d diff-$* -r $* $(shell find $(LATEXDIR) -name '*.tex') 
	sed -i '/%DIF PREAMBLE/d' $$(find diff-$*/$(LATEXDIR)/*/ -name '*.tex')
	cd diff-$*/$(LATEXDIR) && $(MAKE) all

