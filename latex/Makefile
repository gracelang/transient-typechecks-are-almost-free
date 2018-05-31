all:
	pdflatex acmart.ins
	pdflatex paper
	bibtex paper
	pdflatex paper
	pdflatex paper

clean:
	$(RM) acmart.cls *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	paper.pdf
