ROOT = $(bash pwd)

all:
	@echo "clean = suppress junk and noisy files..."

%.pdf : %.tex
	pdflatex --shell-escape  $<
	pdflatex --shell-escape  $<

.PHONY: clean fullclean

fullclean: clean
	@find $(ROOT) -name '_minted-*' -type d -exec rm -r {} \;

clean:
	@for ext in bak aux log out pyc; do find $(ROOT) -name '*.'$$ext -print -delete; done
	@find $(ROOT) -name '*~' -print -delete


#	# TEXINPUTS=".:../ensldocuments:" pdflatex --shell-escape --synctex=1 --interaction nonstopmode $<
#	# TEXINPUTS=".:../ensldocuments:" pdflatex --shell-escape --synctex=1 --interaction nonstopmode $<
