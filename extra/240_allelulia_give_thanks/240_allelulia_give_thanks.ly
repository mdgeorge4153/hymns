% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% It's good to write the source of your music on this line for reference!

\version "2.18.2"
hymntitle = "Hymn #240: Allelulia, Allelulia! Give Thanks to the Risen Lord"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { b8 b | e4 e fis8 gis | e4 e fis8( gis) | a4 a gis | fis8 e dis4 }
verseOneA     = \lyricmode   { Al -- le -- lu -- ia, al -- le -- lu -- ia! Give | thanks to the | ris -- en Lord, }
verseTwoA     = \verseOneA
verseThreeA   = \verseOneA
verseFourA    = \lyricmode   { Al -- le -- lu -- ia, al -- le -- lu -- ia! Give | thanks to the | ris -- en Lord, }

sopranoNotesB = \relative c' { b8 b | e4 e fis8 gis | e4 e fis8( gis) | a4 b gis8( fis) | e2. | }
verseOneB     = \lyricmode   { Al -- le -- lu -- ia, al -- le -- lu -- ia! Give | praise to his | name. | }
verseTwoB     = \verseOneB
verseThreeB   = \verseOneB
verseFourB    = \verseOneB

sopranoNotesC = \relative c''{ b4 b gis | cis2 b4 | a2 gis8( a) | fis2. | }
verseOneC     = \lyricmode   { Je -- sus is | Lord of | all the | earth. | }
verseTwoC     = \lyricmode   { Spread the good | news o'er | all the | earth: | }
verseThreeC   = \lyricmode   { We have been | cru -- ci -- fied with | Christ. | }
verseFourC    = \lyricmode   { Come let us | praise the | liv -- ing | God, | }

sopranoNotesD = \relative c'' { gis4 fis e | e fis gis | a2( gis8 a) | fis2 }
verseOneD     = \lyricmode   { He is the King of cre -- a -- tion. }
verseTwoD     = \lyricmode   { Je -- sus has | died and has ris -- en. }
verseThreeD   = \lyricmode   { Now we shall | live _ for -- ev -- er. }
verseFourD    = \lyricmode   { joy -- ful -- ly sing to our Sav -- ior. }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verseFour    = { \set stanza = "4. " \verseFourA    \verseFourB    \verseFourC    \verseFourD    }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
verses       = { \verseOne \verseTwo \verseThree \verseFour }

% this section gives the broad structure of the music

global = {
	\time 3/4
	\key e \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()

  \partial 4
  \repeat unfold 3 {
    s4 | s2. | s2. | s2. | s2  \bar "" \break
    s4 | s2. | s2. | s2. | s2. \bar "||" \break
    s2. | s2. | s2. | s2. | \break
    s2. | s2. | s2. | s2 \bar "||" \pageBreak
  }
  s4^\markup{ \italic Refrain } | s2. | s2. | s2. | s2  \bar "" \break
  s4 | s2. | s2. | s2. | s2. \bar "|." \break
  s2. | s2. | s2. | s2. | \break
  s2. | s2. | s2. | s2^\markup{ \italic "to Refrain" } \bar "||" \pageBreak
}

% And here is the score:

\header {
	tagline = ##f
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
    \addlyrics \verses
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
  top-margin = 10
  left-margin = 10
  right-margin = 10
  print-page-number = ##f
}
