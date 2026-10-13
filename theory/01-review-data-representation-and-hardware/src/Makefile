# Builds both variants of the presentation:
#   ../01-review-data-representation-and-hardware__presentation.pdf
#       shows every slide whole, and
#   ../01-review-data-representation-and-hardware__presentation-segmented.pdf
#       reveals them step by step.
# latexmkrc holds the details; this is the short way to run it.

PDFS := ../01-review-data-representation-and-hardware__presentation.pdf \
        ../01-review-data-representation-and-hardware__presentation-segmented.pdf

.PHONY: all watch clean distclean

all:
	latexmk

# Rebuild on every save.
watch:
	latexmk -pvc -view=none

# Remove the intermediate files, keep the presentation.
clean:
	latexmk -c
	rm -rf build

# Remove the presentations too.
distclean: clean
	rm -f $(PDFS)
