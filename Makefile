
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
	cp -r latex/ diff-$*/latex
	cd diff-$*/latex && $(MAKE) dist-clean
	find diff-$*/latex -name '*.tex' -delete
	latexdiff-git -d diff-$* -r $* $(shell find latex -name '*.tex') 
	sed -i '/%DIF PREAMBLE/d' $$(find diff-$*/latex/*/ -name '*.tex')
	cd diff-$*/latex && $(MAKE) all

