

.PHONY: diff-main
diff-main: diff-%:
	rm -fr diff-$*
	mkdir -p diff-$*
	cp -r latex/ diff-$*/latex
	cd diff-$*/latex && $(MAKE) dist-clean
	find diff-$*/latex -name '*.tex' -delete
	latexdiff-git -d diff-$* -r $* $(shell find latex -name '*.tex') 
	sed -i '/%DIF PREAMBLE/d' $$(find diff-$*/latex/*/ -name '*.tex')
	cd diff-$*/latex && $(MAKE) all

