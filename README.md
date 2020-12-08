Introduction
============

This is a tutorial that explains how to generate videos of sheet music that scroll
along with an audio track, using the free and open source programs OpenShot
and lilypond.  We sometimes use this process to make hymns for the virtual church
services at [The First Presbyterian Church of Ithaca, NY](https://www.firstpresithaca.org/).

This tutorial is targeted at someone who is technically savvy but doesn't
necessarily have experience editing video or music files.

TODO: The example output video is available here:

TODO: There is a video tutorial of the process here:

TODO: You can download a zip file with all of these example files from github by clicking ...

I'm interested in improving this tutorial and helping people make hymn videos,
so if you have questions or comments or find a better way of doing something,
feel free to let me know!

Generating the sheet music
==========================

Creating the video requires an image of the sheet music.  This section contains
instructions for creating such an image.


The easy way <a anchor="easy"/>
------------------------------

I use lilypond to generate the image so that I can put each verse on its own
line and control the fonts and formatting.  However, lilypond has a
learning curve and can be time-consuming; if you'd like to skip it, you can
generate the image any way that is convenient.

For example, you could scan the page from a hymnal or try to find it on the
internet.

OpenShot can't use PDF files, but most PDF viewers have a way to turn a PDF
into an image.  If your software asks you to choose an image size, choosing a
width of 1280 pixels will give you an HD-quality image.

If you're familiar with the command line, you can use the `pdftoppm` command to
convert pdfs to images:

    pdftoppm -png -scale-to-x 1280 -scale-to-y -1 36_for_the_fruit.pdf > 36_for_the_fruit.png

### Places where you can find existing hymn images

TODO: if you know of any, let me know!

Generating Sheet Music Using lilypond
-------------------------------------

Lilypond is music transcription software.  It lets you type music in a
(somewhat) convenient format, and then processes that description to produce
beautiful sheet music.

Using lilypond to generate music images gives you a lot of control over the
appearance of the music.  It also lets you reuse the examples provided in this
documentation.  The file [LILYPOND.md](LILYPOND.md) provides a detailed lilypond
tutorial tailored for generating hymn images for these videos.

To use lilypond, you will need to be comfortable with editing text files and
with reading sheet music.  If you are familiar with reading sheet music but not
editing text files, you might try using one of the graphical lilypond editors
[listed here](https://lilypond.org/easier-editing.html).
I have not used them, and so can't comment on the process.

If all of these options seem too daunting, I recommend producing sheet music as
described in the ["Easy Way" section](#easy) above, and then skipping to the
["Generating the video" section](#video) below.

Generating the video
====================

TODO

Installing OpenShot
-------------------

TODO

A bit about keyframes and animation
-----------------------------------

TODO

Making the video step by step
-----------------------------

TODO

Credits
=======

This documentation was put together by Michael George

TODO: credit souce of music
TODO: credit musicians

Contributing
------------

TODO: use github

