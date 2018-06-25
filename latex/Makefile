DATA_FILES=$(wildcard ../evaluation/*.bz)
KNITR=$(wildcard ../evaluation/*.Rnw)
KNITR_TEX=$(KNITR:.Rnw=.tex)
KNITR_TEX=$(patsubst ../evaluation/%.Rnw,../generated/%.tex,$(KNITR))

all:
	pdflatex acmart.ins
	pdflatex paper
	bibtex paper
	pdflatex paper
	pdflatex paper

../generated/%.tex: ../evaluation/%.Rnw ../generated ../evaluation/scripts/*.R $(DATA_FILES)
	../evaluation/scripts/knit.R $< $@

knitr: $(KNITR_TEX)
	echo $(KNITR_TEX)

clean:
	$(RM) acmart.cls *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	paper.pdf
