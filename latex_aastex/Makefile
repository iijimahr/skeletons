###
### Initialize template for AAS journals
### * https://journals.aas.org/aastex-package-for-manuscript-preparation
###

# Latex source
TEX_FILE = main.tex

# Target pdf
TARGET = $(TEX_FILE:.tex=.pdf)

# Figures
FIG_FILES = $(wildcard figs/*.pdf)

# Reference list
BIB_FILE = reference.bib

# Class file for AAS journals
CLS_FILE = aastex631.cls

# BST file for bibtex
BST_FILE = aasjournal.bst

.PHONY: init
all: $(TARGET)

.PHONY: init
init: $(CLS_FILE) $(BST_FILE)

.PHONY: clean
clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz *.bbl *.blg *~

.PHONY: cleanall
cleanall:
	@make clean
	rm -f $(TARGET) $(CLS_FILE) $(BST_FILE)

$(TARGET): $(TEX_FILE) $(FIG_FILES) $(BIB_FILE) $(CLS_FILE) $(BST_FILE)
	latexmk -pdf -bibtex -interaction=nonstopmode -f $<

$(CLS_FILE):
	curl -O https://journals.aas.org/wp-content/uploads/2021/02/aastex631.cls

$(BST_FILE):
	curl -O https://journals.aas.org/wp-content/uploads/2019/06/aasjournal.bst
