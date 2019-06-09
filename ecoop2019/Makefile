DATA_FILES=$(wildcard ../evaluation/*.bz2)
KNITR=$(wildcard ../evaluation/*.Rnw)
KNITR_TEX=$(KNITR:.Rnw=.tex)
KNITR_TEX=$(patsubst ../evaluation/%.Rnw,../generated/%.tex,$(KNITR))

all: paper.pdf

paper.pdf:
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
	*.synctex.gz *.fdb_latexmk *.fls .*.lb \
	paper.pdf

arxiv: all
	mkdir arxiv
	# references.bib: removed, because it confuses arxiv
	cp collab.sty paper.bbl lipics-v2019.cls orcid.pdf cc-by.pdf lipics-logo-bw.pdf arxiv/
	latexpand --empty-comments paper.tex --output arxiv/paper.tex
	zip --junk-paths arxiv.zip arxiv/*

ecoop19-dagstuhl: all
	mkdir ecoop19-dagstuhl
	cp references.bib collab.sty paper.bbl lipics-v2019.cls orcid.pdf cc-by.pdf lipics-logo-bw.pdf ecoop19-dagstuhl/
	latexpand --empty-comments paper.tex --output ecoop19-dagstuhl/paper.tex
	zip --junk-paths ecoop19-dagstuhl.zip ecoop19-dagstuhl/*

author-pdf : AUTHOR_PDF_NAME=ecoop19-roberts-et-al-transient-typechecks-are-almost-free.pdf
author-pdf: paper.pdf
	mv paper.pdf $(AUTHOR_PDF_NAME)
	scp $(AUTHOR_PDF_NAME) ts:/var/www/stefan-marr.de/downloads/
	echo Now available at: https://stefan-marr.de/downloads/$(AUTHOR_PDF_NAME)

