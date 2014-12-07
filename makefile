.PHONY: all clean
all: dissertacao.pdf

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

dissertacao.pdf: dissertation.tex
	pdflatex dissertation.tex 2>/dev/null; true
	bibtex dissertation.aux 2>/dev/null; true
	makeglossaries dissertation 2>/dev/null; true
	pdflatex dissertation.tex 2>/dev/null; true
	pdflatex dissertation.tex 2>/dev/null; true

clean:
	latexmk -CA
