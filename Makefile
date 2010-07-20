SOURCE_NW = needlepy.nw
BIB_FILE = needlepy.bib
IMAGES = psi.pdf psi_error.pdf

.phony: all

all: needlepy.pdf needlepy.py

needlepy.pdf: needlepy.tex $(BIB_FILE) $(IMAGES)
	texi2pdf --batch --pdf $<

needlepy.tex: $(SOURCE_NW)
	noweave -n -delay -index $< | cpif $@

needlepy.py: $(SOURCE_NW)
	notangle $< | cpif $@

%.pdf: %.asy
	asy -f pdf -o $@ $<
