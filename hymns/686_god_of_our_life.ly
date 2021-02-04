% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory to God", the Presbyterian Hymnal, #686

\version "2.18.2"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c'' { a2  a4 a   | bes2.  a4      | a      g       f      g     | a2.    f4   | g2     e2  | f1    | }
altoNotesA    = \relative c'  { f2  f4 f   | f2.    f4      | e      e       d      e     | f2.    a,4  | d2     c   | c1    | }
verseOneA     = \lyricmode    { God of our | life,  through | all    the     cir -- cling | years, we   | trust  in  | thee. | }
verseTwoA     = \lyricmode    { God of the | past,  our     | times  are     in     thy   | hand.  With | us     a --  bide. | }
verseThreeA   = \lyricmode    { God of the | com -- ing     | years, through paths  un  --  known  we   | fol -- low | thee. | }
tenorNotesA   = \relative c'  { c2  c4 c   | d2.    c4      | c      bes     a      c     | c2.    f,4  | bes2   g   | a1    | }
bassNotesA    = \relative c   { f2  f4 f   | f2.    f4      | c      c       d      c     | f2.    d4   | bes2   c   | f1    | }

sopranoNotesB = \sopranoNotesA
altoNotesB    = \relative c'  { f2   f4  f   | f2.     f4      | e      e    d       d    | cis2.  a4  | d2     c   | c1     | }
verseOneB     = \lyricmode    { In   all the | past,   through | all    our  hopes   and  | fears, thy | hand   we  | see.   | }
verseTwoB     = \lyricmode    { Lead us  by  | faith   to      | hope's true prom -- ised | land.  Be  | thou   our | guide. | }
verseThreeB   = \lyricmode    { When we  are | strong, Lord,   | leave  us   not     a --   lone.  Our | ref -- uge | be.    | }
tenorNotesB   = \relative c'  { c2   c4  c   | d2.     c4      | c      bes  a       d,   | e2.    f4  | bes2   g   | a1     | }
bassNotesB    = \relative c   { f2   f4  f   | f2.     f4      | c      c    d       bes  | a2.    d4  | bes2   c   | f1     | }

sopranoNotesC = \relative c'' { g2   g4   a   | bes2   g2   | c4      bes  a      g   | a2.    }
altoNotesC    = \relative c'  { e2   e4   f   | g( f)  e2   | f4      e    f      e   | f2.    }
verseOneC     = \lyricmode    { With each new | day,   when | morn -- ing  lifts  the | veil,  }
verseTwoC     = \lyricmode    { With thee to  | bless, the  | dark -- ness shines as  | light, }
verseThreeC   = \lyricmode    { Be   thou for | us     in   | life    our  dai -- ly  | bread, }
tenorNotesC   = \relative c'  { c2   c4   c   | d2     c2   | c4      c    c      c   | c2.    }
bassNotesC    = \relative c'  { c2   bes4 a   | g2 c4( bes) | a       g    f      c   | f2.    }

sopranoNotesD = \relative c'' { c4  | d2      c    | bes2.  a4    | c        bes   a      g    | f1     | }
altoNotesD    = \relative c'  { f4  | f2      f    | g2.    f4    | g        g     f      e    | c1     | }
verseOneD     = \lyricmode    { we  | own     thy  | mer -- cies, | Lord,    which nev -- er   | fail.  | }
verseTwoD     = \lyricmode    { and | faith's fair | vi --  sion  | chang -- es    in  -- to   | sight. | }
verseThreeD   = \lyricmode    { our | heart's true | home   when  | all      our   years  have | sped.  | }
tenorNotesD   = \relative c'  { c4  | bes2    c    | d      c     | d4       d     c      bes  | a1     | }
bassNotesD    = \relative c'  { a4  | bes2    a    | g4( f e f)   | bes,4    bes   c      c    | f1     | }


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
	\key f \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 3 {
		\repeat unfold 20 { s1 | }
	} \alternative { { \bar "||" \break } { \bar "|." } }
}

% And here is the score:

hymntitle = "Hymn #686: God of Our Life"

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
