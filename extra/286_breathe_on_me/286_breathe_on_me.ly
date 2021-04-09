% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% From "Glory To God"

\version "2.18.2"
hymntitle = "Hymn #286: Breathe on Me, Breath of God (v. 1 - 3)"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c''{ a4      a  a   | bes2   f4 | a2.  | c4   bes a    | g2   a4 | g2.  | }
altoNotesA    = \relative c' { f4      f  f   | f2     f4 | f2.  | f4   e   f    | f2   f4 | e2.  | }
verseOneA     = \lyricmode   { Breathe on me, | Breath of | God; | fill me  with | life a -- new; | }
verseTwoA     = \lyricmode   { Breathe on me, | Breath of | God; | un -- til my | heart is | pure, | }
verseThreeA   = \lyricmode   { Breathe on me, | Breath of | God; | till I am | whol -- ly | thine, | }
tenorNotesA   = \relative c' { c4 f e | d2 des4 | c2. | c4 c c | d2 b4 | c2. | }
bassNotesA    = \relative c  { f4 f f | f2 f4 | f2. | a4 g f | bes,2 g4 | c2. | }

sopranoNotesB = \relative c''{ a4 bes d | c2 a4 | a2 g4 | bes2 g4 | f( e) f | a2 g4 | f2. | }
altoNotesB    = \relative c' { f4 f e | f2 f8 e | d2 d4 | d2 d4 | c2 c4 | f2 e4 | f2. | }
verseOneB     = \lyricmode   { that I may | love what | thou dost | love, and | do what | thou wouldst | do. | }
verseTwoB     = \lyricmode   { un -- til with | thee I | will one | will, to | do and | to en -- dure. | }
verseThreeB   = \lyricmode   { un -- til this | earth -- ly | part of | me glows | with thy | fire di -- vine. | }
tenorNotesB   = \relative c' { c4 d bes | a2 c4 | c2 bes4 | bes2 bes4 | a( g) a | c2 bes4 | a2. | }
bassNotesB    = \relative c  { f4 f g | a2 f4 | bes,2 bes4 | g2 bes4 | c2 c4 | c2 c4 | f2. | }

% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB   }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB   }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB }

sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    } }
verses       = { \verseOne \verseTwo \verseThree }

% this section gives the broad structure of the music

global = {
	\time 3/4
	\key f \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 3 {
		\repeat unfold 13 { s2. | } \pageBreak
	} \alternative { { \bar "||" } { \bar "|." } }
}

% And here is the score:

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
	\new ChoirStaff <<
		\new Staff = "women" <<
			\new Voice = "soprano" {
				\voiceOne
				<< \global \sopranoNotes >>
			}
			\new Voice = "alto" {
				\voiceTwo
				<< \global \altoNotes >>
			}
		>>

		\new Lyrics = "verses"

		\new Staff = "men" <<
			\clef bass
			\new Voice = "tenor" {
				\voiceThree
				<< \global \tenorNotes >>
			}
			\new Voice = "bass" {
				\voiceFour
				<< \global \bassNotes >>
			}
		>>

		\context Lyrics = "verses" \lyricsto "soprano" \verses
	>>
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
