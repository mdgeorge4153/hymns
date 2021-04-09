% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% From "Glory to God"

\version "2.18.2"
hymntitle = "Hymn #703: Jesus, Thy Boundless Love to Me"

% There are 6 lines, here labeled A through F; each has 4 voices and 3 verses

sopranoNotesA = \relative c''{ b4 a g | g( fis) g | a( e) fis | g2. | }
altoNotesA    = \relative c' { d4 d d | d2 d4 | e2 d4 | d2. | }
verseOneA     = \lyricmode   { Je -- sus, thy | bound -- less | love to | me | }
verseTwoA     = \lyricmode   { O grant that | noth -- ing | in my | soul | }
verseThreeA   = \lyricmode   { O Love, how | gra -- cious | is thy | way! | }
tenorNotesA   = \relative c' { d4 c b | b( c) b | c2 c4 | b2. | }
bassNotesA    = \relative c' { g4 g g | g( a) g | c,2 d4 | g,2. | }

sopranoNotesB = \relative c''{ g4 fis e | d2 g4 | g( fis) g | a2. | }
altoNotesB    = \relative c' { e4 d c | d2 d4 | cis2 cis4 | d2. | }
verseOneB     = \lyricmode   { no thought can | reach, no | tongue de -- clare; | }
verseTwoB     = \lyricmode   { may dwell, but | thy pure | love a -- lone; | }
verseThreeB   = \lyricmode   { All fear be -- fore thy | pres -- ence | flies; | }
tenorNotesB   = \relative c' { c4 c c | b2 b4 | a2 g4 | fis2. | }
bassNotesB    = \relative c  { c4 c c | g'2 g,4 | a2 a4 | d2. | }

sopranoNotesC = \sopranoNotesA
altoNotesC    = \altoNotesB
verseOneC     = \lyricmode   { O knit my | thank -- ful | heart to | thee, | }
verseTwoC     = \lyricmode   { O may thy | love pos -- sess me | whole, | }
verseThreeC   = \lyricmode   { care, an -- guish, | sor -- row | melt a -- way | }
tenorNotesC   = \tenorNotesA
bassNotesC    = \bassNotesA

sopranoNotesD = \relative c''{ g4 fis e | d2 b'4 | a( b) a | g2. | }
altoNotesD    = \relative c' { e4 d c   | d2 g4 | g2 fis4 | g2. | }
verseOneD     = \lyricmode   { and reign with -- out a | ri -- val | there! | }
verseTwoD     = \lyricmode   { my joy, my | trea -- sure, | and my | crown! | }
verseThreeD   = \lyricmode   { where -- e'er thy | heal -- ing | beams a -- rise. | }
tenorNotesD   = \relative c' { c4 c c | b2 d4 | cis2 c4 | b2. | }
bassNotesD    = \relative c  { c4 c c | g'2 g,4 | a2 d4 | g,2. | }

sopranoNotesE = \relative c''{ c4 c c | b2 b4 | a2 a4 | b2. | }
altoNotesE    = \relative c''{ g4 g g | g2 g4 | fis2 fis4 | g2. | }
verseOneE     = \lyricmode   { Thine whol -- ly, | thine a -- lone, I'd | live; | }
verseTwoE     = \lyricmode   { All cold -- ness | from my | heart re -- move; | }
verseThreeE   = \lyricmode   { O Je -- sus, | noth -- ing | may I | see, | }
tenorNotesE   = \relative c' { e4 e e | d2 d4 | d2 d4 | d2. | }
bassNotesE    = \relative c  { c4 c c | g'2 g4 | d2 d4 | g2. | }

sopranoNotesF = \relative c''{ b4 a g | e2 g4 | a2 a4 | g2. | }
altoNotesF    = \relative c' { d4 d d | e2 e4 | fis2 fis4 | d2. | }
verseOneF     = \lyricmode   { my -- self to | thee en -- tire -- ly | give. | }
verseTwoF     = \lyricmode   { may ev -- ery | act. word, | thought be | love. | }
verseThreeF   = \lyricmode   { noth -- ing de -- sire, or | seek, but | thee. | }
tenorNotesF   = \relative c' { d4 c b | c2 b4 | d2 c4 | a2. | }
bassNotesF    = \relative c' { g4 g g | c,2 e4 | d2 d4 | g,2. | }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD   \verseOneE     \verseOneF    }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD   \verseTwoE     \verseTwoF    }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD \verseThreeE   \verseThreeF  }

sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD \sopranoNotesE \sopranoNotesF } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    \altoNotesE    \altoNotesF    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   \tenorNotesE   \tenorNotesF   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    \bassNotesE    \bassNotesF    } }
verses       = { \verseOne \verseTwo \verseThree }

% this section gives the broad structure of the music

global = {
	\time 3/4
	\key g \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 3 {
		\repeat unfold 6 { s2. | s2. | s2. | s2. | } \break
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
