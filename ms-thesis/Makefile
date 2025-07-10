# Makefile for MIT Thesis
# Uses latexmk for compilation management

.DEFAULT_GOAL := thesis

# Main thesis file (without .tex extension)
THESIS = MIT-Thesis

# Source files
TEX_FILES = $(wildcard *.tex)
BIB_FILES = $(wildcard *.bib)
CLS_FILES = $(wildcard *.cls)
FONTSET_DIR = fontsets/
GRAPH_DIR = graphs/

# LaTeX compilation flags
LATEXMK_FLAGS = -pdf -bibtex -shell-escape

.PHONY: all thesis clean help watch install-deps

# Main target
all: thesis

# Compile the thesis
thesis: $(THESIS).pdf

$(THESIS).pdf: $(TEX_FILES) $(BIB_FILES) $(CLS_FILES)
	@echo "Compiling thesis..."
	latexmk $(LATEXMK_FLAGS) $(THESIS)
	@echo "Thesis compilation complete!"

# Quick compilation (no bibliography)
quick: $(TEX_FILES) $(CLS_FILES)
	@echo "Quick compilation (no bibliography)..."
	latexmk -pdf -shell-escape $(THESIS)

# Clean all auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	latexmk -quiet -C $(THESIS)
	rm -f *.aux *.bbl *.blg *.log *.out *.bcf *.run.xml *.fdb_latexmk *.fls *.synctex.gz *.toc *.lof *.lot

# Clean everything including PDF
clean-all: clean
	@echo "Removing PDF file..."
	rm -f $(THESIS).pdf

# Watch for changes and recompile automatically
watch:
	@echo "Watching for changes... (Ctrl+C to stop)"
	latexmk -pdf -bibtex -shell-escape -pvc $(THESIS)

# Show help
help:
	@echo "MIT Thesis Makefile"
	@echo "=================="
	@echo ""
	@echo "Available targets:"
	@echo "  thesis     - Compile the complete thesis with bibliography (default)"
	@echo "  quick      - Quick compilation without bibliography"
	@echo "  watch      - Watch for changes and recompile automatically"
	@echo "  clean      - Remove auxiliary files (.aux, .log, etc.)"
	@echo "  clean-all  - Remove auxiliary files and PDF"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Dependencies:"
	@echo "  - latexmk (for compilation management)"
	@echo "  - pdflatex (LaTeX compiler)"
	@echo "  - biber (bibliography processor)"
	@echo ""
	@echo "Usage:"
	@echo "  make        # Compile thesis"
	@echo "  make watch  # Auto-recompile on changes"
	@echo "  make clean  # Clean auxiliary files"

# Check if required tools are installed
check-deps:
	@echo "Checking dependencies..."
	@which latexmk > /dev/null || (echo "ERROR: latexmk not found. Please install it." && exit 1)
	@which pdflatex > /dev/null || (echo "ERROR: pdflatex not found. Please install LaTeX." && exit 1)
	@which biber > /dev/null || (echo "ERROR: biber not found. Please install it." && exit 1)
	@echo "All dependencies found!"

# Install dependencies (macOS with Homebrew)
install-deps:
	@echo "Installing dependencies..."
	@if command -v brew > /dev/null; then \
		echo "Installing with Homebrew..."; \
		brew install --cask mactex; \
		brew install latexmk; \
	else \
		echo "Homebrew not found. Please install LaTeX manually:"; \
		echo "  - Install MacTeX from https://www.tug.org/mactex/"; \
		echo "  - Or install BasicTeX and latexmk separately"; \
	fi

# Backup target
backup:
	@echo "Creating backup..."
	@if [ -f $(THESIS).pdf ]; then \
		cp $(THESIS).pdf $(THESIS)_backup_$$(date +%Y%m%d_%H%M%S).pdf; \
		echo "Backup created: $(THESIS)_backup_$$(date +%Y%m%d_%H%M%S).pdf"; \
	else \
		echo "No PDF to backup"; \
	fi
