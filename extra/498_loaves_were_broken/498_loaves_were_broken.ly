% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% It's good to write the source of your music on this line for reference!

\version "2.18.2"
hymntitle = "Hymn #498: Loaves Were Broken, Words Were Spoken"

sopranoNotesA = \relative c' { f4 f | g2 f a4 a g( f) d2 f4 f | d2 c d4 f | f1 }
verseOneA     = \lyricmode   { Loaves were | bro -- ken, words were | spo -- ken by the | Gal -- i -- le -- an | shore. }
verseTwoA     = \lyricmode   { Loaves were | bro -- ken, words were | spo -- ken in a   | qui -- et   room one | night. }
verseThreeA   = \lyricmode   { Loaves are  | bro -- ken, words are  | spo -- ken, as in | faith  we   gath -- er | here. }
verseFourA    = \lyricmode   { By     the  | loaves you break and | give us, send us | in your name to |share }

sopranoNotesB = \sopranoNotesA
verseOneB     = \lyricmode   { Je -- sus, | Bread of Life from | heav -- en, was their | food for -- ev -- er -- more.  }
verseTwoB     = \lyricmode   { In    the  | bread and wine you | gave them, Christ, you | came as Light from | Light.}
verseThreeB   = \lyricmode   { Je -- sus | speaks a -- cross the | a -- ges: ``I am | with you; do not | fear!'' }
verseFourB    = \lyricmode   { bread for | which the mil -- lions | hun -- ger, words that | tell your love and | care. }

sopranoNotesC = \relative c' { f4 a | c2 c d4 c | a2 f f4 a | c2 f, a8( g) f4 | d1 }
refrainC      = \lyricmode   { By your | bod -- y bro -- ken | for us,  by your | wine of life out -- poured, }

sopranoNotesD = \relative c''{ d4 c | a2 f a4 a | g( f) d2 f4 f | d2 c d4 f | f1 }
refrainD      = \lyricmode   {  Je -- sus, | feed a -- gain your | peo -- ple. Be our | Host, our Life, our | Lord. }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \refrainC \refrainD }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \refrainC \refrainD }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \refrainC \refrainD }
verseFour    = { \set stanza = "4. " \verseFourA    \verseFourB    \refrainC \refrainD }
verses       = { \verseOne \verseTwo \verseThree \verseFour }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }

% this section gives the broad structure of the music

global = {
	\time 3/2
	\key f \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 4 {
    \partial 2
    \repeat unfold 4 {
      s2 | s1. | s1. | s1. | s1 \bar "" \break
    }
	} \alternative { { \bar "||" \pageBreak } { \bar "|." } }
}

% And here is the score:

\header {
	tagline = ##f
  %	title = \markup {
  %		\with-dimensions #'(0 . 0) #'(0 . 0)
  %		% specify color
  %		\with-color #(rgb-color 0.99 0.98 0.9)
  %		% specify size
  %		\filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
  %		\hymntitle
  %	}
  instrument = \markup {
    \with-dimensions #'(0 . 0) #'(0 . 0)
    % specify color
    \with-color #(rgb-color 0.99 0.98 0.9)
    % specify size
    \filled-box #'(-1000 . 1000) #'(-1000 . 4000) #0
    \hymntitle
  }
}

\score {
  \new Staff {
    \new Voice = "soprano" {
      \voiceOne
      << \global \sopranoNotes >>
    }
  }
  \addlyrics \verses

	\layout {
		indent = 0.0
		\context {
			\Score
			\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/24)
			\override LyricText.font-size = 2.0
			\override LyricText.font-name = #"DejaVu Sans"
			\override BarNumber.break-visibility = ##(#f #f #f)
		}
	}
	\midi {
		\tempo 4 = 90
	}
}

% default is A4: 210 x 297mm
#(set! paper-alist (cons '("my size" . (cons (* 240 mm) (* 135 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
  markup-system-spacing = #'(
    (stretchability . 10)
    (basic-distance . 15)
    (minimum-distance . 10)
    (padding . 1)
  )
  system-system-spacing = #'(
    (stretchability . 10)
    (basic-distance . 15)
    (minimum-distance . 10)
    (padding . 1)
  )
  top-margin = 10
  left-margin = 10
  right-margin = 10
  print-page-number = ##f
}
