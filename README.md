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
documentation.

To follow this section of the tutorial, you will need to be comfortable with
editing text files and with reading sheet music.  If you are familiar with
reading sheet music but not editing text files, you might try using one of the
graphical lilypond editors
[listed here](https://lilypond.org/easier-editing.html).
I have not used them, and so can't comment on the process.

If all of these options seem too daunting, I recommend producing sheet music as
described in the ["Easy Way" section](#easy) above, and then skipping to the
["Generating the video" section](#video) below.


### Installing and running lilypond

Lilypond is available for download from [lilypond.org](https://lilypond.org/download.html).

There are specific instructions for running lilypond on Windows, MacOS, and
Linux
[here](https://lilypond.org/doc/v2.18/Documentation/learning/entering-input#producing-output).
You should download and install lilypond and walk through the running
instructions for your platform before proceeding with this tutorial.

You should now be able to load one of the example lilypond files from this
tutorial into lilypond and compile it.  The   It should produce two files: a pdf containing
all the notes on one giant page, and a midi file that you can play to hear the
score.

### A tour of the example files

Lilypond files are just text containing notes and lyrics in a specialized
format.  This section describes the basics of the lilypond format and explains
how to modify the accompanying examples.

For simplicity, this tutorial only discusses the features of lilypond that I've
encountered while transcribing hymns.  For example, I won't explain how to
change the number of voices or staves, or how to make changes to the structure
of the file.  For that you'll need to consult the manual or find a broader
lilypond tutorial.

    TODO: such as ...

Let's look at the file `36_for_the_fruit.ly`.  There's a few lines of
boilerplate that you can safely ignore:

 - Lines that begin with % are just there for your information; lilypond
   ignores them completely.
 - The `\version` command on the first non-comment line just documents that
   this file is intended for lilypond version 2.18.  Different versions are
   mostly compatible, but if things change in the future, lilypond will know
   that this is an old file.

The next line gives the hymn title, which is shown at the top of the image.

    hymntitle = "#36: For the Fruit of All Creation"

#### Entering notes ####

The next sections contain the meat of the music; these are the parts that
you'll need to understand and edit.  I've broken this hymn into 4 chunks which
I've called "A", "B", "C", and "D".  Let's break apart the first line
of the A chunk:

    sopranoNotesA = \relative c' { f4. e8 d4 f | g4. f8 e4 c | d2 e4. e8 | f1 | }

Compare this with the corresponding part of the generated music:

    TODO: image of 36_for_the_fruit soprano line A

Looking at the music, you'll notice that the first measure contains a dotted
quarter f note, then an eighth e note, a quarter d note, and a quarter f note.
These correspond to the first 4 notes in the curly braces: f4. is an f that is a dotted quarter (4.),
then e8 is an e that is an eighth note, then the d4 is a d that is a quarter note.

Lilypond uses `es` to indicate flatted notes and `is` to indicate sharp notes.
You need to enter the actual note that is played, not the way it is indicated.
This hymn is in F major, so the b notes are all flatted; you'll see in the later
lines that I've entered `bes` for "b flat", even though in the generated music
there's no flat symbol.

The last f in the measure doesn't have a duration.  When you leave off the
duration, lilypond uses the one from the previous note.  That saves a lot of
typing when you have a bunch of quarter notes or eighth notes in a row.

The next thing in the line is the bar line `|`.  You can leave the bar
lines out (lilypond will figure them out based on the time signature) but if you
put them in, lilypond will be able to warn you if you make a mistake.

Moving out from the curly braces, we see `\relative c' { ... }`.  This tells
lilypond how to choose the octave for the notes: `\relative` tells lilypond to
chose the octave for each note that puts it as close as possible to the
previous note; the `c'` tells it to put the first note as close to middle c as
possible.

The `'` and `,` notations raise or lower the octave of a note.  `c` is the C
below middle C, while a `'` refers to the next higher octave and a `,` refers
to the next lower octave.  You can also use `'` and `,` to adjust notes in the
melody if you need to make a more-than-half-octave jump.  For example, in the
last measure of the base line we have `f,1', because a simple `f1' would place
the f note int the wrong octave.  Usually I just enter a line of music, then
run it through lilypond and adjust the octaves as necessary.

#### Giving names to music snippets

Continuing to move outward in the line, we have that `sopranoNotesA =`.  This
creates the name `sopranoNotesA` to refer to the rest of the music on the line.
In the remainder of the file, lilypond will replace `\sopranoNotesA` with this
snippet.  This is primarily used in the line defining `sopranoNotes`:

    sopranoNotes = { ... \sopranoNotesA \sopranoNotesB ...}`.

We then later use `\sopranoNotes` in the actual score section below.  In this
way, you can break up the music in whatever way is helpful.  I've found for
hymns like this, putting each line in its own variable lets me write the music
in a natural way.

In this particular hymn, the second and fourth lines of the
soprano part are exactly the same as the first, so we also reuse that `sopranoNotesA`
variable for those:

    sopranoNotesB = \sopranoNotesA
    sopranoNotesD = \sopranoNotesA

#### Entering lyrics

You should now be able to understand the alto, tenor, and bass parts of each
line.  Now let's look at the lyrics.  Just like the musical lines, I've created
variables for the different parts of the verses.  For example, here is the first
line of the first verse:

    verseOneA = \lyricmode { For  the fruit  of | all cre -- a -- tion | thanks  be   to  | God.  | }

As you might guess, `\lyricmode` puts lilypond in "lyric mode".  You simply enter
the text of the hymn, with different syllables of the same word separated by `--`.
Later in the files, we associate the lyrics with the soprano part, so that lilypond
can automatically associate one note note with each syllable.

In some places, you may have several notes slurred together for a
single syllable.  You indicate a slur in the music by putting a `(` _after_ the
first slurred note, and a `)` after the last slurred note.  For example, the first
two notes of the third measure of `altoNotesA` are slurred together.  Lilypond
will only give one syllable to these slurred notes.

As with the notes, you can place bar lines in the lyrics.  They are optional, but
lilypond can catch mistakes if you include them.

I've also used spaces to line up the syllables and the notes in the lilypond file:

    sopranoNotesA = \relative c' { f4.  e8  d4     f     | g4.   f8     e4      c    | d2      e4.  e8  | f1    | }
    altoNotesA    = \relative c' { a4   c   d      c     | d     d      c       c    | c( bes) a    bes | a1    | }
    verseOneA     = \lyricmode   { For  the fruit  of    | all   cre -- a --    tion | thanks  be   to  | God.  | }
    verseTwoA     = \lyricmode   { In   the just   re   -- ward  of     la --   bor  | God's   will be  | done. | }

This is unnecessary (it has no affect on how lilypond interprets the music),
but I find it helpful to keep track of where things are.

#### The structure of the whole hymn

After entering the different parts of each line, I've made variable to hold the
entire soprano, alto, tenor, and bass parts, as well as for each verse, and
for the entire set of lyrics.

There are two new things in this part:
* the `\set stanza = "1. "` adds the notations at the beginning of each verse
* the `\repeat unfold 3` repeats the lines of music 3 times (one
  for each verse).  The `unfold` tells lilypond to just include
  three copies, instead of using a repeat sign.

After creating these "large" variables, I've created one more part containing
the annotations that go with all of the musical parts.  I've called this
variable "global".  All of the music has the same time signature and key, and
I've chosen to turn off the automatic beams connecting 8th notes:

    \time 3/4
    \key c \major
    \autoBeamOff

The next portion of the "global" section establishes the double
bar lines between verses and at the end:

    \repeat unfold 3 {
	    \repeat unfold 16 { s1 | }
    } \alternative { { \bar "||" } { \bar "|." } }

The special note "s" stands for space, and is just an invisible
note used for spacing things out.  Here's I've used "s1" to
create an invisible whole note.  I repeat that single note 16
times to make a whole verse, and then I repeat that verse 3 times
to make the whole hymn.  The `\alternative` block is used to
provide alternative endings; the first alternative is used for
all but the last repetition, while the last alternative is used
for the last repetition.  In this case, the only difference
between them is the bar line used: the double bar is written
`\bar "||"` while the heavy double bar is written `\bar "|."`.

#### Tweaking the output

The remainder of the file is responsible for taking the notes and lyrics that
we've written and laying them out.  I won't go through them in detail, but there's
a few places you may want to change:

* The background color is specified in the `\withcolor #(rgb-color ...)` portion;
  the three numbers give the amount of red, green, and blue in the background
  color.
* The lines `\override LyricText.font-size`, `\override LyricText.font-name`
  change the font and font size.
* The last few lines set the size of the entire score.  The portion that reads
  (* 210 mm) (* 650 mm) defines the width and height of the generated pdf file.
  If your hymn is longer or shorter, you may want to adjust the height from 650
  to something longer or shorter.  Ideally, page should be just long enough to
  hold all of the music.
* The `\midi` section tells lilypond to generate a midi file containing the
  music along with the pdf containing the notes.  I find this useful for doing
  a rough cut of the video before I have the actual recording from the choir.
  The `\tempo 4 = 90` means that if a beat is a quarter note, then there are
  90 beats per minute in the generated midi file.

#### Pickup measures and manual line breaking 

The file `336_we_gather_together.ly` contains a second hymn that
needs a few tweaks to the structure.

One important difference is that the hymn starts on a pickup note, and each
phrase also starts on a pickup note.  This requires a few changes:

* To get the bar lines in the right place, we need to tell lilypond that the
  first measure is a partial measure containing only a single quarter note.
  This is done by adding `\partial 4` in the `global` section.

* <a anchor="alternates">The last measure is different for the first two verses: if the hymn will
  continue, then the last note should only a half note to leave space for the
  pickup, while in the last verse it is a dotted half note.  I've found the
  easiest way to handle this is to give different versions of the last line
  for each verse; I've called them `sopranoNotesDOne`, `sopranoNotesDTwo` and
  `sopranoNotesDThree`, and similarly for the other parts.  For this particular
  hymn, the second verse is also different from the first because of optional
  ties (see [the optional ties section](#ties) below); if those two verses were
  the same, you could reuse the music for the first verse for all the verses
  but the last.

  The different versions are assembled together in the `sopranoNotes = ...` lines.
  For the simpler hymn (`36_for_the_fruit.ly`), we have

      sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }

  which says the soprano line is `sopranoNotesA` followed by `sopranoNotesB` etc,
  repeated 3 times (once for each verse).

  In this more complex hymn (`336_we_gather_together.ly`), we have

      sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC } \alternative { \sopranoNotesDOne \sopranoNotesDTwo \sopranoNotesDThree } }

  this says that each verse is `sopranoNotesA` followed by `sopranoNotesB`
  followed by `sopranoNotesC`, but the last line is `sopranoNotesDOne` for the
  first repetition, `sopranoNotesDTwo` for the second repetition, and
  `sopranoNotesDThree` for the third repetition.

* Normally lilypond only breaks lines between measures.  In this case, the hymn
  looks much better if the pickup note is at the beginning of the line.  To
  force a line break, you need to put in a fake bar line (`\bar ""`) followed by
  a line break (`\break`).  I've done this in the `global` section:

      \repeat unfold 12 { s4 | s2. | s | s | } \alternative { { s2 \bar "" \break } { s2. \bar "|." } }

  Here, each line has a partial measure with a quarter note, followed by three
  measures of a dotted half note.  The last measure of the line is usually a
  half note followed by a forced line break (`{ s2 \bar "" \break }`), but the
  last measure of the last line is a dotted half note followed by a heavy bar
  line (`{ s2. \bar "|." }`).  The `\repeat unfold 12 ... \alternative` repeats
  the line 12 times, with the first ending for all but the last line and the
  second ending for the last line.
 
#### Optional ties <a anchor="ties"/>

Another feature that occurs in hymn 336 is an optional tie (shown in the hymnal
as a dotted tie between notes).  This indicates that in some verses, there is
only one syllable sung across two notes, while in other verses, there are two
separate syllables.  Here is how this measure is written in the hymnal:

    TODO: image

Since we are generating each verses music separately, we can just generate a
quarter note instead of two 8th notes for the verses with one syllable.  I
accomplished this by copying the line multiple times, and then using the
different versions for the different verses:

    TODO: image

In this hymn I used the alternate ending feature since it was only the last line
that changed (see [the section on alternate endings](#alternates)
above); if the changes are earlier in the song it's probably better to list the
parts of the different verses instead of using `\repeat ... \alternative`.

#### Other situations that arise

If something comes up in your hymn that I haven't covered, I've found that
googling works pretty well.  Lilypond has an extensive manual, and I don't think
it's worth learning all of its ins and outs.  If you find something that you
think would be generally useful, let me know and I can add it to this tutorial.

### My process for creating a new hymn image

1. Copy the `template.ly` file to create a file for my hymn.

2. Edit the comments at the top to write down where the hymn is
   from, and change the `hymntitle`.

3. Edit the `global` section to set the time signature, key, and the
   structure of the measures.

4. Enter the first-verse lyrics and soprano notes for the first line.

5. Run lilypond to make sure the output looks right and there are no bar-line
   error messages

6. Enter the other notes and lyrics for the first line and run lilypond again.

7. Enter the other lines one at a time, checking the output after entering the
   soprano line and first verse, and again after everything is entered.

8. Use the music to sing along to the midi output to make sure it reads and
   sounds right (this is a good way to catch mistakes!)

9. Convert the output pdf to an image and make the video!

### Places where you can find existing lilypond files for hymns

TODO: if you know of any, let me know!

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

