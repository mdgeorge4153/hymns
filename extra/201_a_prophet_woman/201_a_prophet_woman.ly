% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% Taken from "Glory to God, the Presbyterian Hymnal", Hymn #201

\version "2.18.2"
hymntitle = "Hymn #201: A Prophet-Woman Broke a Jar"

sopranoNotesA = \relative c' { d4     | g        a     b2.    g4   | a       g     e2.    d4  | g      b     d2.  b4   | b        a2~ a }
altoNotesA    = \relative c' { d4     | d        d     g2.    d4   | e       e     c2.    d4  | d      g     g2.  g4   | g        fis2~ fis }
verseOneA     = \lyricmode   { A      | proph -- et -- wom -- an   | broke   a     jar,   by  | Love's di -- vine ap  -- point -- ing. }
verseTwoA     = \lyricmode   { A      | faith -- ful   wom -- an   | left    a     tomb   by  | Love's di -- vine com -- mis --   sion.}
verseThreeA   = \lyricmode   { Though | wom --   an -- wis -- dom, | wom --  an -- truth, for | cen -- tu -- ries were | hid --   den, }
verseFourA    = \lyricmode   { The    | Spir --  it   knows; the  | Spir -- it    calls, by  | Love's di -- vine or  -- dain --  ing, }
tenorNotesA   = \relative c  { d4     | b'       c     d2.    b4   | c       c     g2.    d4  | b'     d     b2.  d4   | d        d2~ d2 }
bassNotesA    = \relative c  { d4     | g        g     g2.    g4   | c,      c     c2.    d4  | g      g     g2.  g4   | d        d2~ d2 }

sopranoNotesB = \relative c' { d4     | g        a      b2.     g4   | a        g     e2.    d4    | d      g   b2.   a4   | a        g2. r4 }
altoNotesB    = \relative c' { d4     | d        fis    g2.     d4   | e        e     c2.    b4    | d      d   d2.   d4   | d        d2. s4 }
verseOneB     = \lyricmode   { With   | rare     per -- fume    she  | filled   the   room,  pre --  sid -- ing and   a --   noint -- ing.     }
verseTwoB     = \lyricmode   { She    | saw;     she    heard;  she  | preached the   Word,  a --    ris -- ing from  sub -- mis -- sion. }
verseThreeB   = \lyricmode   { un    -- sung,    un --  writ -- ten, | and      un -- heard, de --   rid -- ed  and   for -- bid -- den.}
verseFourB    = \lyricmode   { the    | friends  we     need,   to   | serve    and   lead,  their | powers and gifts un --  chain -- ing.}
tenorNotesB   = \relative c  { d4     | g        d'     d2.     b4   | c        c     g2.    g4    | g      b   d2.   c4   | c        b2. r4 }
bassNotesB    = \relative c  { d4     | b        d      g2.     g4   | c,       c     c2.    d4    | b      g   d'2.  d4   | g,       g2. s4 }

sopranoNotesC = \relative c''{ b4  | d d d b | a b g2. a4 | b b b2. a4 | b d2~ d2 }
altoNotesC    = \relative c''{ g4 | b b b g | fis fis e2. fis4 | g g g2. fis4 | g b2~ b }
verseOneC     = \lyricmode   { A   | proph -- et -- wom -- an | broke a jar, the | sneers of scorn de -- fy -- ing. }
verseTwoC     = \lyricmode   { A   | faith -- ful wom -- an | left a tomb, with | res -- ur -- rec -- tion | gos -- pel. }
verseThreeC   = \lyricmode   { the | Spir -- it's breath, the | Spir -- it's fire, on | free and slave de -- scend -- ing, }
verseFourC    = \lyricmode   { The | Spir -- it knows; the Spir -- it calls, from | wom -- en, men, and | chil -- dren, }
tenorNotesC   = \relative c' { g4 | g g g d' | d d b2. d4 | d d d2. d4 | d d2~ d }
bassNotesC    = \relative c' { g4 | g g g g | d d e2. d4 | g g g 2. d4 | g g2~ g }

sopranoNotesD = \relative c''{ b4 | d d d b8( a) | g4 e d2. d4 | g a b2. a4 | a g1 }
altoNotesD    = \relative c''{ g4 | g g g g | e c b2. d4 | e fis g2. fis4 | fis g1 }
verseOneD     = \lyricmode   { With | rare per -- fume she | filled the room, pre -- par -- ing Christ for | dy -- ing. }
verseTwoD     = \lyricmode   { She | saw; she heard; she | preached the Word, a -- pos -- tle to a -- pos -- tles. }
verseThreeD   = \lyricmode   { can | tum -- ble our di -- vid -- ing walls, our | shame and sad -- ness | mend -- ing. }
verseFourD    = \lyricmode   { the | friends we need, to | serve and lead. Re -- joice and make them | wel -- come! }
tenorNotesD   = \relative c' { d4 | b c d d | c g g2. b4 | b c d2. c4 | c b1 }
bassNotesD    = \relative c' { g4 | g a b g | c, c g'2. g4 | e d d2. d4 | g, g1 }


% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verseFour    = { \set stanza = "4. " \verseFourA    \verseFourB    \verseFourC    \verseFourD    }
verses       = { \verseOne \verseTwo \verseThree \verseFour }

sopranoNotes = { \repeat unfold 4 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 4 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 4 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 4 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }

% this section gives the broad structure of the music

global = {
	\time 6/4
	\key g \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 4 {
    \partial 4
		\repeat unfold 2 { s4 | s1. | s1. | s1. | s4 s1 \bar "" \break }
    \repeat unfold 2 { s4 | \omit Score.TimeSignature \time 4/4 s1 | \time 6/4 s1. \undo \omit Score.TimeSignature | s1. | s4 s1 \bar "" \break }
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
		\tempo 4 = 120
	}
}


% default is A4: 210 x 297mm
#(set! paper-alist (cons '("my size" . (cons (* 210 mm) (* 900 mm))) paper-alist))
\paper {
  #(set-paper-size "my size")
}
