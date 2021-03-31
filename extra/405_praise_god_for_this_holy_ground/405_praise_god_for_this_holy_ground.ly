% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory To God" the Presbyterian Hymnal, #405 (verse 2 only)

\version "2.18.2"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c'' { b4 b b gis8( b) | cis4 b e,2 | }
verseOneA     = \lyricmode    { Praise God for this | hol -- y ground, | }
verseTwoA     = \lyricmode    { Praise God in whose | word we find | }

sopranoNotesB = \relative c'' { a4. a8 a( gis) fis( e) | fis4 cis b2 | }
verseOneB     = \lyricmode    { place and peo -- ple, | sight and sound. | \break }
verseTwoB     = \lyricmode    { food for bod -- y, | soul, and mind. | }

sopranoNotesC = \relative c'  { b4 e8 dis cis2 | cis4 fis8 e dis2 | dis4 gis8 fis e( fis) }
verseTwoC     = \lyricmode    { Hal -- le -- lu -- jah! | Hal -- le -- lu -- jah! | Hal -- le -- lu -- jah! }
verseOneC     = \verseTwoC

sopranoNotesD = \relative c'' { gis8( a) | \time 6/4 b4 gis a8( gis) fis( e) fis2 | e1 \bar "|." }
verseTwoD     = \lyricmode    { God's | good -- ness is e -- ter -- nal. |}
verseOneD     = \verseTwoD

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }

sopranoNotes = { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD }

% this section gives the broad structure of the music

global = {
	\time 4/4
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\key e \major
}

% And here is the score:

hymntitle = "Hymn #405 (verse 1): Praise God for This Holy Ground"

\header {
	tagline = ##f
	title = \markup {
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
    \addlyrics \verseOne
  }

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
  top-margin = 20
  left-margin = 10
  right-margin = 10
}
