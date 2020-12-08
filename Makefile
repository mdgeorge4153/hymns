default: all
all: generated/36_for_the_fruit.png generated/336_we_gather_together.png generated/template.pdf

.PHONY: default all

generated/%.midi generated/%.pdf: %.ly
	mkdir -p generated && cd generated && lilypond ../$*

%.svg: %.pdf
	pdf2svg $^ $@

%.png: %.pdf
	pdftoppm -png -scale-to-x 1280 -scale-to-y -1 $^ > $@

.SECONDARY:

