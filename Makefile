default: all
all: tmp/36.for_the_fruit.png tmp/336.we_gather.png

tmp/%.midi tmp/%.pdf: %.ly
	cd tmp && lilypond ../$*

%.svg: %.pdf
	pdf2svg $^ $@

%.png: %.pdf
	pdftoppm -png -scale-to-x 1280 -scale-to-y -1 $^ > $@

