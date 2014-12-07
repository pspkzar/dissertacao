.PHONY all clean

all: dissertacao.pdf

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

dissertacao.pdf: dissertacao.tex
	pdflatex dissertacao.tex
	bibtex dissertacao
	makeglossaries dissertacao
	pdflatex dissertacao.tex
	pdflatex dissertacao.tex

clean:
	latexmk -CA
