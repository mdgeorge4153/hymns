% This is a lilypond file; running lilypond on it will generate a long single-page
% pdf as well as a midi file.
%
% This is a template file; see README.md for instructions on editing it.
%
% Taken from "Glory to God, the Presbyterian Hymnal", Hymn # 197

\version "2.20.0"
hymntitle = "Hymn #197: Hosanna, Loud Hosanna"

% There are 4 lines, here labeled A, B, C, and D; each has 4 voices and 3 verses

sopranoNotesA = \relative c' { f4   |  bes    a8( g) f4   bes  | d,( ees) f     f     | g8( a)   bes4 c       c    | d2. }
altoNotesA    = \relative c' { f4   |  bes    a8  g  f4   f    | bes,2    c4    d     | ees      f    g       f    | f2. }
verseOneA     = \lyricmode   { Ho --   san -- na,    loud ho --  san --   na,   the   | lit -- tle  chil -- dren | sang; }
verseTwoA     = \lyricmode   { From |  Ol  -- i --   vet  they | fol --   lowed `mid  | an     ex -- ult -- ant | crowd, }
verseThreeA   = \lyricmode   { ``Ho -- san -- na,    in   the  | high --  est!'' That | an --  cient song   we  | sing, }
tenorNotesA   = \relative c  { f4   |  bes    a8  g  f4   bes  | bes2     a4     bes  | bes    bes    bes   a   | bes2. }
bassNotesA    = \relative c  { f4   |  bes    a8  g  f4   d    | g2       f4     bes, | ees    d      ees   f   | bes,2. }

sopranoNotesB = \relative c' { f4      | bes    a8( g) f4    bes    | d,( ees) f     f     | g8( a)   bes4   bes   a    | bes2. }
altoNotesB    = \relative c' { f4      | bes    a8  g  f4    f      | bes,2    c4    d     | ees      d8 ees f4    f    | f2. }
verseOneB     = \lyricmode   { through | pil -- lared  court and    | tem --   ple   the   | joy --   ful    an -- them | rang. }
verseTwoB     = \lyricmode   { the     | vic -- tor    palm  branch | wav --   ing,  and   | chant -- ing    clear and  | loud; }
verseThreeB   = \lyricmode   { for     | Christ is     our   re --  | deem --  er;   the   | Lord     of     heaven, our | King.}
tenorNotesB   = \relative c  { f4      | bes    a8  g  f4    bes    | bes2     a4     bes  | bes    bes    c     c   | d2. }
bassNotesB    = \relative c  { f4      | bes    a8  g  f4    d      | g2       f4     bes, | ees    g      f     f   | bes,2. }

sopranoNotesC = \relative c''{ bes8( c) | d4    c    d     ees  | c( a8 bes) c4    bes8( c) | d4      c   d      ees  | c2. }
altoNotesC    = \relative c' { d8   ees | f4    f    f     g    | f2         f4    bes8 f   | f4      f   f      g    | f2. }
verseOneC     = \lyricmode   { To       | Je -- sus, who   had  | blessed    them, close    | fold -- ed  to     his  | breast, }
verseTwoC     = \lyricmode   { the      | Lord  of   earth and  | heav --    en    rode     | on      in  low -- ly   | state, }
verseThreeC   = \lyricmode   { O        | may   we   ev -- er   | praise     him   with     | heart   and life   and  | voice, }
tenorNotesC   = \relative c' { bes4     | bes   c    bes   bes  | a( f8 g)   a4    d8 c     | bes4    c   bes    bes  | a2. }
bassNotesC    = \relative c  { bes4     | bes'4 a    bes   ees, | f2         f4    g8 a     | bes4    a   bes    ees, | f2. }

sopranoNotesD = \sopranoNotesB
altoNotesD    = \altoNotesB
verseOneD     = \lyricmode   { the | chil -- dren sang their | prais -- es, the | sim -- plest and the | best. }
verseTwoD     = \lyricmode   { nor | scorned that lit -- tle | chil -- dren should | on his bid -- ding | wait. }
verseThreeD   = \lyricmode   { and | in his bliss -- ful | pres -- ence e -- ter -- nal -- ly re -- joice. }
tenorNotesD   = \tenorNotesB
bassNotesD    = \bassNotesB

% We now collect the 4 lines together:

verseOne     = { \set stanza = "1. " \verseOneA     \verseOneB     \verseOneC     \verseOneD     }
verseTwo     = { \set stanza = "2. " \verseTwoA     \verseTwoB     \verseTwoC     \verseTwoD     }
verseThree   = { \set stanza = "3. " \verseThreeA   \verseThreeB   \verseThreeC   \verseThreeD   }
verses       = { \verseOne \verseTwo \verseThree }

sopranoNotes = { \repeat unfold 3 { \sopranoNotesA \sopranoNotesB \sopranoNotesC \sopranoNotesD } }
altoNotes    = { \repeat unfold 3 { \altoNotesA    \altoNotesB    \altoNotesC    \altoNotesD    } }
tenorNotes   = { \repeat unfold 3 { \tenorNotesA   \tenorNotesB   \tenorNotesC   \tenorNotesD   } }
bassNotes    = { \repeat unfold 3 { \bassNotesA    \bassNotesB    \bassNotesC    \bassNotesD    } }

% this section gives the broad structure of the music

global = {
	\time 4/4
	\key bes \major
  \set Timing.baseMoment  = #(ly:make-moment 1/4)
  \set Timing.beamExceptions = #'()
	\repeat unfold 3 {
    \partial 4
    \repeat unfold 4 { s4 | s1 | s1 | s1 | s2. \bar "" \break }
	} \alternative { { \bar "||" \break } { \bar "|." } }
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
      \override LyricText.word-space = #5.0
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
