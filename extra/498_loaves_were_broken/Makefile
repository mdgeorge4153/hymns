default: generated/498_leaves_were_broken-1.png generated/498_leaves_were_broken-2.png generated/498_leaves_were_broken-3.png generated/498_leaves_were_broken-4.png

.PHONY: default

generated/%.midi generated/%.pdf: %.ly
	mkdir -p generated && cd generated && lilypond ../$^

%.svg: %.pdf
	pdf2svg $^ $@

%.png: %.pdf
	pdftoppm -png -scale-to-x 1280 -scale-to-y -1 $^ > $@

%-1.png: %.pdf
	pdftoppm -png -f 1 -l 1 -scale-to-x 1280 -scale-to-y -1 $^ > $@

%-2.png: %.pdf
	pdftoppm -png -f 2 -l 2 -scale-to-x 1280 -scale-to-y -1 $^ > $@

%-3.png: %.pdf
	pdftoppm -png -f 3 -l 3 -scale-to-x 1280 -scale-to-y -1 $^ > $@

%-4.png: %.pdf
	pdftoppm -png -f 4 -l 4 -scale-to-x 1280 -scale-to-y -1 $^ > $@

%-5.png: %.pdf
	pdftoppm -png -f 5 -l 5 -scale-to-x 1280 -scale-to-y -1 $^ > $@


.SECONDARY:

