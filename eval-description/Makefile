DATA_FILES=$(wildcard ../evaluation/*.bz2)
KNITR=$(wildcard ../evaluation/*.Rnw)
KNITR_TEX=$(KNITR:.Rnw=.tex)
KNITR_TEX=$(patsubst ../evaluation/%.Rnw,generated/%.tex,$(KNITR))
PAPER=eval-description

all: $(KNITR_TEX)
	pdflatex $(PAPER)
	# bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

generated:
	mkdir generated

generated/%.tex: ../evaluation/%.Rnw generated ../evaluation/scripts/*.R $(DATA_FILES)
	../evaluation/scripts/knit.R $< $@

clean:
	$(RM) *.log *.aux \
	*.cfg *.glo *.idx *.toc *.vtc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	*.synctex.gz *.fdb_latexmk *.fls .*.lb \
	paper.pdf
