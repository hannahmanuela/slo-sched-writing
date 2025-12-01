TEX = $(wildcard *.tex)
#FIG = $(shell find figures -name "*")
#GRAPH = $(shell find graphs -name "*.pdf")
C_SOURCES:=$(wildcard code/*.c)

DEPS := \
        $(wildcard *.bib) \
        $(wildcard *.tex) \
	$(wildcard *.png) \
        $(C_SOURCES:.c=.tex)

LATEXRUN := ./bin/latexrun --bibtex-args=-min-crossrefs=100

.PHONY: all clean

all: paper.pdf

%.pdf: %.tex $(DEPS)
	$(LATEXRUN) -W no-all $<

code/%.tex: code/%.c
	pygmentize -O "linenos=1,tabsize=2" -P mathescape -P verboptions='fontsize=\scriptsize,numbersep=6pt,xleftmargin=0.2in' -f latex $<  > $@

all: paper.pdf

clean:
	rm -rf latex.out *.aux *.bbl *.blg *.log *.ent *.out *fls *.bcf *.aux\
	paper.pdf code/*.tex
