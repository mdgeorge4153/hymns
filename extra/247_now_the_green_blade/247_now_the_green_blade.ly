% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% From "Glory To God"

\version "2.18.2"
hymntitle = "Hymn #247: Now the Green Blade Rises"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { e8 b' cis a | b4 g | a8 a16( b) g8 fis | e2 | }
altoNotesA    = \relative c' { e8 g a fis | g4 e | fis8 e dis cis | b2 | }
verseOneA     = \lyricmode   { Now the green blade ris -- es | from the bur -- ied | grain, | }
verseTwoA     = \lyricmode   { In the grave they | laid him, | love by ha -- tred | slain, | }
verseThreeA   = \lyricmode   { Forth he came at | Eas -- ter, | like the ris -- en | grain, | }
verseFourA    = \lyricmode   { When our hearts are | win -- try, | griev -- ing, or in | pain, | }
tenorNotesA   = \relative c' { b8 b b b | e4 b | a8 e b' a | g2 | }
bassNotesA    = \relative c  { e8 e e e | e4 e | a,8 a b b | e2 | }

sopranoNotesB = \relative c' { e8( b') cis a | b4 g | a8 a16( b) g8 fis | e2 | }
altoNotesB    = \relative c' { e8( g) fis e | g8( fis) e( d) | cis cis dis dis | b2 | }
verseOneB     = \lyricmode   { wheat that in | dark earth | man -- y days has | lain; | }
verseTwoB     = \lyricmode   { think -- ing that | he would | nev -- er wake a -- gain, | }
verseThreeB   = \lyricmode   { he that for | three days | in the grave had | lain; | }
verseFourB    = \lyricmode   { your touch can | call us | back to life a -- gain; | }
tenorNotesB   = \relative c' { g8( b) a cis | b4 b | e,8 e b' a | g2 | }
bassNotesB    = \relative c  { e4 a,8 a | e'4 e | a,8 a b b | e2 | }

sopranoNotesC = \relative c'' { g4 fis8 e | fis4. b,8 | g' g fis e | fis2 | }
altoNotesC    = \relative c' { e4 cis8 cis | d4. b8 | e d cis e | dis2 | }
verseOneC     = \lyricmode   { love lives a -- gain, that | with the dead has | been; | }
verseTwoC     = \lyricmode   { laid in the | eatth like | grain that sleeps un -- seen; | }
verseThreeC   = \lyricmode   { raised from the | dead, my | liv -- ing Lord is | seen; | }
verseFourC    = \lyricmode   { fields of our | hearts that | dead and bare have | been: | }
tenorNotesC   = \relative c' { b4 a8 a | a4. fis8 | g b ais cis | b2 | }
bassNotesC    = \relative c  { e4 a,8 a | d4. dis8 | e e fis fis | b,2 | }

sopranoNotesD = \sopranoNotesA
altoNotesD    = \relative c' { e8 g fis a | g4 e | cis8 cis dis dis | e2 | }
verseOneD     = \lyricmode   { love is come a -- gain like | wheat a -- ris -- ing | green. | }
verseTwoD     = \verseOneD
verseThreeD   = \verseOneD
verseFourD    = \verseOneD
tenorNotesD   = \relative c' { b8 b a cis | b4 b | a8 fis b b | g2 | }
bassNotesD    = \relative c  { e8 e e e | e4 g | fis8 fis b, b | e2 | }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verseFour    = { \set stanza = "4. " \verseFourA    \verseFourB    \verseFourC    \verseFourD    }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 4 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 4 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 4 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }
verses       = { \verseOne \verseTwo \verseThree \verseFour }

% this section gives the broad structure of the music

global = {
	\time 2/4
	\key e \minor
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 4 {
		\repeat unfold 4 { s2 | s2 | s2 | s2 | \break }
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
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 900 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
