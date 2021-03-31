% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% Taken from "Glory to God, the Presbyterian Hymnal", #248

\version "2.18.2"
hymntitle = "Hymn #248: Christ is Risen!  Shout Hosanna!"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c''{ b4 b c d | d c b a | g g a b | b4. a8 a2 | }
altoNotesA    = \relative c' { d4 d d d | d e8 fis g4 d | d d fis g | g4. fis8 fis2 | }
verseOneA     = \lyricmode   { Christ is ris -- en! | Shout Ho -- san -- na! | Cel -- e -- brate this | day of days! |}
verseTwoA     = \lyricmode   { Christ is ris -- en! | Raise your spir -- its | from the cav -- erns | of de -- spair. |}
verseThreeA   = \lyricmode   { Christ is ris -- en! | Earth and heav -- en | nev -- er -- more shall | be the same. | }
tenorNotesA   = \relative c' { g4 g  a b | b a g fis | g b c d | d4. d8 d2 | }
bassNotesA    = \relative c' { g4 g g g | d d d c | b b a g | d'4. d8 d2 | }

sopranoNotesB = \relative c''{ b4 b c d | d c b a | g g a b | a4. g8 g2 |}
altoNotesB    = \relative c''{ g4 d e f | f e d e | d d fis g | fis4. g8 g2 |}
verseOneB     = \lyricmode   { Christ is ris -- en! | Hush in won -- der: | all cre -- a -- tion | is a -- mazed. | }
verseTwoB     = \lyricmode   { Walk with glad -- ness | in the morn -- ing. | See what love can | do and dare. | }
verseThreeB   = \lyricmode   { Break the bread of | new cre -- a -- tion | where the world is | still in pain. | }
tenorNotesB   = \relative c' { d4 d c b | g a b c | b b c d | c4. b8 b2 |}
bassNotesB    = \relative c' { g4 g g g | c, c c c | d d d d | d4. g8 g2 |}

sopranoNotesC = \relative c''{ a4 a b g | a b8( c) b4 g | a b8( c) b4 a | g a d, \bar "" \break }
altoNotesC    = \relative c' { fis4 d d g | fis g8 fis g4 g | fis fis fis dis | e8 d cis4 d }
verseOneC     = \lyricmode   { In the des -- ert | all sur -- round -- ing, | see, a spread -- ing | tree has grown. }
verseTwoC     = \lyricmode   { Drink the wine of | res -- ur -- rec -- tion, | not a ser -- vant, | but a friend. }
verseThreeC   = \lyricmode   { Tell its grim, de -- mon -- ic cho -- rus: | ``Christ is ris -- en! | Get you gone!'' }
tenorNotesC   = \relative c' { d4 fis, g b | c b8 a g4 b | c b8 a b4 b | b a8 g  fis4 }
bassNotesC    = \relative c  { d4 d d d | d d d d | d d dis b | e a, d }

sopranoNotesD = \relative c''{ b4~ | b b c d | d c b a | g g a b | a4. g8 g2 | }
altoNotesD    = \relative c' { d4~ | d d e f | f e d e | d d fis g | fis4. g8 g2 | }
verseOneD     = \lyricmode   { Heal -- ing leaves of | grace a -- bound -- ing | bring a taste of | love un -- known. | }
verseTwoD     = \lyricmode   { Je -- sus is our | strong com -- pan -- ion. | Joy and peace shall | nev -- er end. | }
verseThreeD   = \lyricmode   { God the First and | Last is with us, | Sing Ho -- san -- na | ev -- ery -- one! | }
tenorNotesD   = \relative c' { g4~ | g d' c b | g a b c | b b c d | c4. b8 b2 | }
bassNotesD    = \relative c' { g4~ | g g g g | c, c c c | d d d d | d4. g8 g2 | }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }

sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }
verses       = { \verseOne \verseTwo \verseThree }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key g \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 3 {
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
		\tempo 4 = 100
	}
}


% default is A4: 210 x 297mm
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 650 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
