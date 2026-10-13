# Builds both variants of the presentation: ../02-os-introduction__presentation.pdf
# shows every slide whole, and ../02-os-introduction__presentation-segmented.pdf
# reveals them step by step. latexmkrc holds the details; this is the short way
# to run it.

PDFS := ../02-os-introduction__presentation.pdf \
        ../02-os-introduction__presentation-segmented.pdf

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
