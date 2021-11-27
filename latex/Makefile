
PDFVIEWER=open

TEX=$(wildcard *.tex) $(wildcard [a-zA-Z0-9]*/*.tex)
PDF=$(patsubst %.tex,%.pdf,$(TEX))
LATEXFLAGS=-pdf -e "\$$pdf_previewer = '$(PDFVIEWER) %O %S'" -M -MP -MF $(notdir $*).d -use-make

report.pdf:
report.pdf.pvc:

all: $(PDF)

-include *.d
-include */*.d
-include */*/*.d

$(PDF): %.pdf: %.tex
	cd $(dir $*) && latexmk $(LATEXFLAGS) $(notdir $*)


.PHONY: _dyn/git-version.tex
_dyn/git-version.tex: 
	mkdir -p _dyn
	git describe --tags --match 'v[0-9]*' > $@

.PHONY: _dyn/git-version-short.tex
_dyn/git-version-short.tex: _dyn/git-version.tex
	cat $< | sed 's/-[0-9a-h]\+$$//' > $@



.PHONY: $(patsubst %,%.pvc,$(PDF))
$(patsubst %,%.pvc,$(PDF)): %.pdf.pvc: %.tex
	cd $(dir $*) && latexmk $(LATEXFLAGS) -pvc $(notdir $*)


.PHONY: dist-clean
dist-clean: clean $(patsubst %.tex,%~dist-clean,$(TEX))

.PHONY: $(patsubst %.tex,%~dist-clean,$(TEX))
$(patsubst %.tex,%~dist-clean,$(TEX)): %~dist-clean:
	cd $(dir $*) && latexmk $(LATEXFLAGS) -C $(notdir $*).tex

.PHONY: clean
clean: $(patsubst %.tex,%~clean,$(TEX))
	rm -fr _dyn _minted-report

.PHONY: $(patsubst %.tex,%~clean,$(TEX))
$(patsubst %.tex,%~clean,$(TEX)): %~clean:
	cd $(dir $*) && latexmk $(LATEXFLAGS) -c $(notdir $*).tex
	rm -f $*.run.xml $*.bbl
	rm -f $*.lol

