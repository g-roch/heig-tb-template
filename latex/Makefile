
PDFVIEWER=open

TEX=$(wildcard *.tex) $(wildcard */*.tex)
PDF=$(patsubst %.tex,%.pdf,$(TEX))
LATEXFLAGS=-pdf -e "\$$pdf_previewer = '$(PDFVIEWER) %O %S'" -M -MP -MF $*.d

report: report.pdf

all: $(PDF)

-include *.d
-include */*.d

$(PDF): %.pdf: %.tex
	latexmk -cd $(dir $*) $(LATEXFLAGS) $*

$(patsubst %,%.pvc,$(PDF)): %.pdf.pvc: %.tex
	latexmk $(LATEXFLAGS) -pvc $*

dist-clean: clean
	latexmk -C $(TEX)
	rm -f $(patsubst %.tex,%.d,$(TEX))

clean:
	latexmk -c $(TEX)
	rm -f $(patsubst %.tex,%.run.xml,$(TEX))
	rm -f $(patsubst %.tex,%.bbl,$(TEX))
