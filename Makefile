ROOT = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
CMD = pdflatex
# --synctex=1 --interaction nonstopmode
CMD_ARGS = --recorder --shell-escape

all:
	@echo "clean = suppress junk and noisy files..."
	@echo "X.pdf = builds X.pdf from X.tex"

%.pdf : %.tex
	TEXINPUTS=".:$(ROOT):" $(CMD) $(CMD_ARGS) $<
	TEXINPUTS=".:$(ROOT):" $(CMD) $(CMD_ARGS) $<

.PHONY: clean fullclean

fullclean: clean
	@find $(ROOT) -name '_minted-*' -type d -exec rm -r {} \;

clean:
	@for ext in bak aux log out pyc; do find $(ROOT) -name '*.'$$ext -print -delete; done
	@find $(ROOT) -name '*~' -print -delete
