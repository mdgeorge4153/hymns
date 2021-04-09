% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% It's good to write the source of your music on this line for reference!

\version "2.18.2"
hymntitle = "Template hymn"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { }
altoNotesA    = \relative c' { }
verseOneA     = \lyricmode   { }
verseTwoA     = \lyricmode   { }
verseThreeA   = \lyricmode   { }
verseFourA    = \lyricmode   { }
verseFiveA    = \lyricmode   { }
tenorNotesA   = \relative c  { }
bassNotesA    = \relative c, { }

sopranoNotesB = \relative c' { }
altoNotesB    = \relative c' { }
verseOneB     = \lyricmode   { }
verseTwoB     = \lyricmode   { }
verseThreeB   = \lyricmode   { }
verseFourB    = \lyricmode   { }
verseFiveB    = \lyricmode   { }
tenorNotesB   = \relative c  { }
bassNotesB    = \relative c, { }

sopranoNotesC = \relative c' { }
altoNotesC    = \relative c' { }
verseOneC     = \lyricmode   { }
verseTwoC     = \lyricmode   { }
verseThreeC   = \lyricmode   { }
verseFourC    = \lyricmode   { }
verseFiveC    = \lyricmode   { }
tenorNotesC   = \relative c  { }
bassNotesC    = \relative c, { }

sopranoNotesD = \relative c' { }
altoNotesD    = \relative c' { }
verseOneD     = \lyricmode   { }
verseTwoD     = \lyricmode   { }
verseThreeD   = \lyricmode   { }
verseFourD    = \lyricmode   { }
verseFiveD    = \lyricmode   { }
tenorNotesD   = \relative c  { }
bassNotesD    = \relative c, { }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verseFour    = { \set stanza = "4. " \verseFourA    \verseFourB    \verseFourC    \verseFourD    }
verseFive    = { \set stanza = "5. " \verseFiveA    \verseFiveB    \verseFiveC    \verseFiveD    }

sopranoNotes = { \repeat unfold 5 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 5 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 5 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 5 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }
verses       = { \verseOne \verseTwo \verseThree \verseFour \verseFive }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key f \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 5 {
		\repeat unfold 16 { s1 | }
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
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 650 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
