all: letter.pdf

%.pdf: %.tex
	pdflatex "$<"; echo
	pdflatex "$<"; echo
	pdflatex "$<"; echo

clean:
	rm -f *~ *.backup *.aux *.bbl *.blg *.dvi *.lof *.log *.lot \
	  *.nav *.out *.snm *.toc *.vrb

cleanall: clean
	rm -f *.pdf

validate: letter.pdf
	./verapdf/verapdf letter.pdf

.PHONY: clean cleanall
