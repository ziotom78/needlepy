SOURCE_NW = needlepy.nw
BIB_FILE = needlepy.bib

.phony: all

all: needlepy.pdf needlepy.py

needlepy.pdf: needlepy.tex
	texi2pdf --batch --pdf $<

needlepy.tex: $(SOURCE_NW) $(BIB_FILE)
	noweave -n -delay -index $< | cpif $@

needlepy.py: $(SOURCE_NW)
	notangle $< | cpif $@
