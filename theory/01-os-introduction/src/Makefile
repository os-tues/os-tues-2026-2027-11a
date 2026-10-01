# Builds ../01-os-introduction__presentation.pdf. latexmkrc holds the details;
# this is the short way to run it.

PDF := ../01-os-introduction__presentation.pdf

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

# Remove the presentation too.
distclean: clean
	rm -f $(PDF)
