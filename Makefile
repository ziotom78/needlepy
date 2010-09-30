SOURCE_NW = needlepy.nw standard-needlets.nw bernstein-needlets.nw mexican-needlets.nw
TEX_FILES = $(SOURCE_NW:%.nw=%.tex)
DEFS_FILES = $(SOURCE_NW:%.nw=%.defs)
BIB_FILE = needlepy.bib
INDEX_FILE = all.defs
PY_TEST_FILES = test-psi.py test-phi.py test-b.py test-needlet.py
IMAGES = psi.pdf psi_error.pdf phi.pdf b.pdf needlet.pdf

.PHONY: all

all: needlepy.pdf needlepy.py $(PY_TEST_FILES)

needlepy.pdf: $(TEX_FILES) $(BIB_FILE) $(IMAGES)
	pdflatex -interaction=batchmode $<
	noindex $<
	texi2pdf --batch --pdf $<

psi.pdf: psi.asy psi.txt
	asy -f pdf -o $@ $<

phi.pdf: phi.asy phi.txt
	asy -f pdf -o $@ $<

b.pdf: b.asy b.txt
	asy -f pdf -o $@ $<

needlet.pdf: needlet.asy needlet.txt
	asy -f pdf -o $@ $<

$(INDEX_FILE): $(DEFS_FILES)
	sort -u $^ | cpif $@

%.tex: %.nw $(INDEX_FILE)
	noweave -n -delay -indexfrom $(INDEX_FILE) $< | cpif $@

%.defs: %.nw
	nodefs $< | cpif $@

needlepy.py: $(SOURCE_NW)
	notangle -R$@ $^ | cpif $@

%.txt: test-%.py needlepy.py
	python $< | cpif $@

%.pdf: %.asy
	asy -f pdf -o $@ $<
