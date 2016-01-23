all: letter.pdf

%.pdf: %.tex
	cp -f /usr/share/color/icc/sRGB_IEC61966-2-1_black_scaled.icc sRGBIEC1966-2.1.icm
	pdflatex "$<"; echo
	pdflatex "$<"; echo
	pdflatex "$<"; echo

clean:
	rm -f *~ *.backup *.aux *.bbl *.blg *.dvi *.lof *.log *.lot \
	  *.nav *.out *.snm *.toc *.vrb *.xmpi

cleanall: clean
	rm -f *.pdf

validate: letter.pdf
	./verapdf/verapdf letter.pdf

.PHONY: clean cleanall
