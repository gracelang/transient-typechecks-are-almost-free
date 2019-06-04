DATA_FILES=$(wildcard ../evaluation/*.bz2)
KNITR=$(wildcard ../evaluation/*.Rnw)
KNITR_TEX=$(KNITR:.Rnw=.tex)
KNITR_TEX=$(patsubst ../evaluation/%.Rnw,../generated/%.tex,$(KNITR))

all:
	lualatex paper
	bibtex paper
	lualatex paper
	lualatex paper

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
