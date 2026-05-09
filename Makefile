# Makefile for the Rayleigh-Taylor IVP Note

TEX_MAIN = rt_finite_depth_ivp_note.tex
PDF_TARGET = rt_finite_depth_ivp_note.pdf
LATEX_CMD = pdflatex -interaction=nonstopmode

all: $(PDF_TARGET)

$(PDF_TARGET): $(TEX_MAIN)
	$(LATEX_CMD) $(TEX_MAIN)
	# Check if a bib file exists before running bibtex
	@if [ -f *.bib ]; then bibtex $(basename $(TEX_MAIN)); fi
	$(LATEX_CMD) $(TEX_MAIN)
	$(LATEX_CMD) $(TEX_MAIN)

clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ind *.ilg *.fls *.fdb_latexmk

distclean: clean
	rm -f $(PDF_TARGET)

view: $(PDF_TARGET)
	open $(PDF_TARGET)

.PHONY: all clean distclean view
