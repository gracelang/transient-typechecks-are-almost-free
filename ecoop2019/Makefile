DATA_FILES=$(wildcard ../evaluation/*.bz2)
KNITR=$(wildcard ../evaluation/*.Rnw)
KNITR_TEX=$(KNITR:.Rnw=.tex)
KNITR_TEX=$(patsubst ../evaluation/%.Rnw,../generated/%.tex,$(KNITR))

all:
	pdflatex paper
	bibtex paper
	pdflatex paper
	pdflatex paper

../generated:
	mkdir ../generated

../generated/%.tex: ../evaluation/%.Rnw ../generated ../evaluation/scripts/*.R $(DATA_FILES)
	../evaluation/scripts/knit.R $< $@

knitr: $(KNITR_TEX)
	echo $(KNITR_TEX)

clean:
	$(RM) *.log *.aux \
	*.cfg *.glo *.idx *.toc *.vtc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	paper.pdf

arxiv: all
	mkdir arxiv
	cp collab.sty references.bib paper.bbl arxiv/
	latexpand --empty-comments paper.tex --output arxiv/paper.tex
	zip arxiv.zip arxiv/*