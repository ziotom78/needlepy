SOURCE_NW = needlepy.nw
BIB_FILE = needlepy.bib
PY_TEST_FILES = test-psi.py test-phi.py test-b.py test-needlet.py
IMAGES = psi.pdf psi_error.pdf phi.pdf b.pdf needlet.pdf

.phony: all

all: needlepy.pdf needlepy.py $(PY_TEST_FILES)

needlepy.pdf: needlepy.tex $(BIB_FILE) $(IMAGES)
	texi2pdf --batch --pdf $<

needlepy.tex: $(SOURCE_NW)
	noweave -n -delay -index $< | cpif $@

psi.pdf: psi.asy psi.txt
	asy -f pdf -o $@ $<

phi.pdf: phi.asy phi.txt
	asy -f pdf -o $@ $<

b.pdf: b.asy b.txt
	asy -f pdf -o $@ $<

needlet.pdf: needlet.asy needlet.txt
	asy -f pdf -o $@ $<

%.py: $(SOURCE_NW)
	notangle -R$@ $< | cpif $@

%.txt: test-%.py needlepy.py
	python $< | cpif $@

%.pdf: %.asy
	asy -f pdf -o $@ $<
